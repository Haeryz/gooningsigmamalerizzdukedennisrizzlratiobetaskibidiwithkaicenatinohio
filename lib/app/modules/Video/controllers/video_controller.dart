import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';

class VideoController extends GetxController {
  var selectedVideoPath = ''.obs;
  var isVideoPlaying = false.obs;
  var isVideoLoading = false.obs;
  VideoPlayerController? videoPlayerController;

  final ImagePicker _picker = ImagePicker();
  final box = GetStorage();

  Future<void> pickVideo(ImageSource source) async {
    try {
      isVideoLoading.value = true;
      final XFile? pickedFile = await _picker.pickVideo(source: source);
      if (pickedFile != null) {
        selectedVideoPath.value = pickedFile.path;
        box.write('videoPath', pickedFile.path);

        videoPlayerController =
            VideoPlayerController.file(File(pickedFile.path))
              ..initialize().then((_) {
                videoPlayerController!
                    .play(); 
                isVideoPlaying.value = true;
                update();
              });
      } else {
        Get.snackbar('skibidi', 'mewing ohio tax',
            backgroundColor: Colors.pink);
      }
    } catch (e) {
      Get.snackbar('error', 'error : $e');
    } finally {
      isVideoLoading.value = false;
    }
  }

  void _loadStoreData() {
    selectedVideoPath.value = box.read('videoPath') ?? '';

    if (selectedVideoPath.value.isNotEmpty) {
      videoPlayerController =
          VideoPlayerController.file(File(selectedVideoPath.value))
            ..initialize().then((_) {
              videoPlayerController!.play();
              isVideoPlaying.value = true;
              update();
            });
    }
  }

  void play() {
    videoPlayerController?.play();
    isVideoPlaying.value = true;
    update();
  }

  void pause() {
    videoPlayerController?.pause();
    isVideoPlaying.value = false;
    update();
  }

  void tooglePlayPause() {
    if (videoPlayerController != null) {
      if (videoPlayerController!.value.isPlaying) {
        videoPlayerController!.pause();
        isVideoPlaying.value = false;
      } else {
        videoPlayerController!.play();
        isVideoPlaying.value = true;
      }
      update();
    }
  }
}

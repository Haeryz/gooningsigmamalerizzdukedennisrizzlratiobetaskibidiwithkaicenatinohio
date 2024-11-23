import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';

import '../controllers/video_controller.dart';

class VideoView extends GetView<VideoController> {
  const VideoView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('VideoView'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: Get.height / 2.32,
                width: Get.width * 0.7,
                child: Obx(() {
                  if (controller.selectedVideoPath.value.isNotEmpty) {
                    return Card(
                      child: Column(
                        children: [
                          AspectRatio(
                            aspectRatio: 1,
                            child:
                                VideoPlayer(controller.videoPlayerController!),
                          ),
                          VideoProgressIndicator(
                              controller.videoPlayerController!,
                              allowScrubbing: true),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                  onPressed: controller.tooglePlayPause,
                                  icon: Icon(controller.isVideoPlaying.isTrue
                                      ? Icons.pause
                                      : Icons.play_arrow))
                            ],
                          )
                        ],
                      ),
                    );
                  } else {
                    return const Text('No video selected');
                  }
                }),
              ),
              ElevatedButton(
                  onPressed: () => controller.pickVideo(ImageSource.camera),
                  child: const Text('Pick camera')),
              ElevatedButton(
                  onPressed: () => controller.pickVideo(ImageSource.gallery),
                  child: const Text('Pick galery')),
            ],
          ),
        ),
      ),
    );
  }
}

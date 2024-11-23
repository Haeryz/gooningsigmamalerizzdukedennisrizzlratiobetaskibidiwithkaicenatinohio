import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:google_mlkit_object_detection/google_mlkit_object_detection.dart';

class SensorController extends GetxController {
  final ImagePicker _picker = ImagePicker();
  final box = GetStorage();

  var selectedImagePath = ''.obs;
  var imageIsloading = false.obs;
  var detectionResults = <DetectedObject>[].obs;

  final objectDetector = ObjectDetector(
    options: ObjectDetectorOptions(
      classifyObjects: true,
      multipleObjects: true,
      mode: DetectionMode.single,  // Use single image detection for gallery images
    ),
  );

  Future<void> pickImage(ImageSource source) async {
    try {
      imageIsloading.value = true;
      final XFile? pickedFile = await _picker.pickImage(source: source);
      if (pickedFile != null) {
        selectedImagePath.value = pickedFile.path;
        box.write('ImagePath', pickedFile.path);

        // Perform object detection on the selected image
        await detectObjects(pickedFile.path);
      } else {
        Get.snackbar('Error', 'No image selected', backgroundColor: Colors.red);
      }
    } catch (e) {
      Get.snackbar('Error', 'Error: $e');
    } finally {
      imageIsloading.value = false;
    }
  }

  Future<void> detectObjects(String imagePath) async {
    try {
      // Create InputImage from the picked image file path
      final inputImage = InputImage.fromFilePath(imagePath);

      // Process the image and get detected objects
      final List<DetectedObject> objects = await objectDetector.processImage(inputImage);

      // Update the detected objects
      detectionResults.value = objects;

      // Debugging: Print the results in the desired format
      for (DetectedObject detectedObject in objects) {
        final rect = detectedObject.boundingBox;
        final trackingId = detectedObject.trackingId;

        for (Label label in detectedObject.labels) {
          print('Bounds ${rect.left}, ${rect.top}), (${rect.right}, ${rect.top}), '
                '(${rect.right}, ${rect.bottom}), (${rect.left}, ${rect.bottom})');
          print('Category: ${label.text}');
          print('Classification confidence: ${label.confidence}');
        }
      }
    } catch (e) {
      Get.snackbar('Error', 'Object Detection Error: $e');
    }
  }

  @override
  void onClose() {
    objectDetector.close();
    super.onClose();
  }
}

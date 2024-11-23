import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../controllers/sensor_controller.dart';

class SensorView extends GetView<SensorController> {
  const SensorView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SensorView'),
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
                  return controller.imageIsloading.value
                      ? const CircularProgressIndicator()
                      : controller.selectedImagePath.value == ''
                          ? const Text('No image selected')
                          : ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.file(
                                File(controller.selectedImagePath.value),
                                fit: BoxFit.cover,
                              ),
                            );
                }),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => controller.pickImage(ImageSource.camera),
                child: const Text('Camera'),
              ),
              ElevatedButton(
                onPressed: () => controller.pickImage(ImageSource.gallery),
                child: const Text('Gallery'),
              ),
              const SizedBox(height: 20),
              const Divider(color: Colors.grey),
              Obx(() {
                if (controller.detectionResults.isEmpty) {
                  return const Text('No objects detected');
                }
                return Column(
                  children: controller.detectionResults.map((object) {
                    return Column(
                      children: object.labels.map((label) {
                        final rect = object.boundingBox;
                        return ListTile(
                          title: Text('Detected Object'),
                          subtitle: Text(
                            'Bounds: (${rect.left.toStringAsFixed(0)}, ${rect.top.toStringAsFixed(0)}), '
                            '(${rect.right.toStringAsFixed(0)}, ${rect.top.toStringAsFixed(0)}), '
                            '(${rect.right.toStringAsFixed(0)}, ${rect.bottom.toStringAsFixed(0)}), '
                            '(${rect.left.toStringAsFixed(0)}, ${rect.bottom.toStringAsFixed(0)})\n'
                            'Category: ${label.text}\n'
                            'Classification Confidence: ${label.confidence.toStringAsFixed(4)}',
                          ),
                        );
                      }).toList(),
                    );
                  }).toList(),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}

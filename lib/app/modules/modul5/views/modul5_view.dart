import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/modul5_controller.dart';

class Modul5View extends GetView<Modul5Controller> {
  const Modul5View({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Modul5View'),
        actions: [
          IconButton(
              onPressed: controller.getCurrentLocation,
              icon: const Icon(Icons.refresh)),
        ],
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Titik koordinat',
              style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
            ),
            Obx(() => Text(
                  controller.locationMessage.value,
                  style: const TextStyle(fontSize: 18),
                )),
            const SizedBox(height: 20),

            // Conditionally display loading indicator or button based on loading state
            Obx(() => controller.loading.value
                ? const Center(child: CircularProgressIndicator())
                : ElevatedButton(
                    onPressed: controller.getCurrentLocation,
                    child: const Text('Cari Lokasi'),
                  )),

            const SizedBox(height: 20),

            // Google Maps button
            ElevatedButton(
              onPressed: controller.openGoogleMaps,
              child: const Text('Buka Google Maps'),
            ),
          ],
        ),
      ),
    );
  }
}

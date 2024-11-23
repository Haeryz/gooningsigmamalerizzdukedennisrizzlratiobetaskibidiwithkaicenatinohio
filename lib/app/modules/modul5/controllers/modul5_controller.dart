import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class Modul5Controller extends GetxController {
  var currentPosition = Rxn<Position>();
  var locationMessage = "Mencari Lat dan long...".obs;
  var loading = false.obs;

  Future<void> getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    loading.value = true;

    try {
      serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        await Geolocator.openLocationSettings();
        throw Exception("Location service is not enabled");
      }

      permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          throw Exception("Location permission denied");
        }
      }

      if (permission == LocationPermission.deniedForever) {
        throw Exception("Location permission denied forever");
      }

      Position position = await Geolocator.getCurrentPosition(
        locationSettings: LocationSettings(
          accuracy: LocationAccuracy.best,
        ),
      );

      currentPosition.value = position;
      locationMessage.value =
          "Latitude: ${position.latitude}, Longitude: ${position.longitude}";
    } catch (e) {
      locationMessage.value = "Gagal mendapatkan lokasi";
    } finally {
      loading.value = false;
    }
  }

  void openGoogleMaps() async {
    if (currentPosition.value != null) {
      final latitude = currentPosition.value!.latitude;
      final longitude = currentPosition.value!.longitude;
      final url =
          Uri.parse('https://www.google.com/maps?q=$latitude,$longitude');

      if (await canLaunchUrl(url)) {
        await launchUrl(url, mode: LaunchMode.externalApplication);
      } else {
        Get.snackbar(
          'Error',
          'Could not open Google Maps',
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } else {
      Get.snackbar(
        'Error',
        'Location is not available yet',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}

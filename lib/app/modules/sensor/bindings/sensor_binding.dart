import 'package:get/get.dart';

import '../controllers/sensor_controller.dart';

class SensorBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SensorController>(
      () => SensorController(),
    );
  }
}

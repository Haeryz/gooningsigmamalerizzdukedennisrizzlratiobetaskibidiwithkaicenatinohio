import 'package:get/get.dart';

import '../controllers/breakfast_controller.dart';

class BreakfastBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BreakfastController>(
      () => BreakfastController(),
    );
  }
}

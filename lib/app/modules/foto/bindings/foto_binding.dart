import 'package:get/get.dart';

import '../controllers/foto_controller.dart';

class FotoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FotoController>(
      () => FotoController(),
    );
  }
}

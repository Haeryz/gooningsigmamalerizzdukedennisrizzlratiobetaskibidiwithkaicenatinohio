import 'package:get/get.dart';

import '../controllers/modul5_controller.dart';

class Modul5Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Modul5Controller>(
      () => Modul5Controller(),
    );
  }
}

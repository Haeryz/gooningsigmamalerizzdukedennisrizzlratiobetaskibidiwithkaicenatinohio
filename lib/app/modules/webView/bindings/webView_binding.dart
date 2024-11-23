import 'package:get/get.dart';

import '../controllers/webView_controller.dart';

class WebviewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WebviewController>(
      () => WebviewController(),
    );
  }
}

import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart'; // Import webview_flutter for WebViewController

class WebviewController extends GetxController {
  late final WebViewController webViewCtrl;  

  @override
  void onInit() {
    super.onInit();

    // Initialize the WebViewController from webview_flutter
    webViewCtrl = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse('https://satisfactory.fandom.com/wiki/Satisfactory_Wiki'));
  }
}

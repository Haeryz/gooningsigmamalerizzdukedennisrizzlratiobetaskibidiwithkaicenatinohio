import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart'; // Import webview_flutter for WebViewWidget
import '../controllers/webView_controller.dart';

class WebviewView extends GetView<WebviewController> {
  const WebviewView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Satisfactory Wiki'),
        centerTitle: true,
      ),
      body: WebViewWidget(
        controller: controller.webViewCtrl,  // Access the renamed webController here
      ),
    );
  }
}

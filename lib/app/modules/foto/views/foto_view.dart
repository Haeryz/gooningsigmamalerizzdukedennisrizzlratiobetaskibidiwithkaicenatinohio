import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/foto_controller.dart';

class FotoView extends GetView<FotoController> {
  const FotoView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FotoView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'FotoView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}

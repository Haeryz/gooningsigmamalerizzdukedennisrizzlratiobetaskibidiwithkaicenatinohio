import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/mypage_controller.dart';

class MypageView extends GetView<MypageController> {
  const MypageView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MypageView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'MypageView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}

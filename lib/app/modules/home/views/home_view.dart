import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gooningsigmamalerizzdukedennisrizzlratiobetaskibidiwithkaicenatinohio/app/data/services/http_controller.dart';
import 'package:gooningsigmamalerizzdukedennisrizzlratiobetaskibidiwithkaicenatinohio/app/modules/authentication/controllers/authentication_controller.dart';
import 'package:gooningsigmamalerizzdukedennisrizzlratiobetaskibidiwithkaicenatinohio/app/routes/app_pages.dart';

class HomeView extends GetView<HttpController> {
  HomeView({super.key});
  final AuthenticationController _authController =
      Get.put(AuthenticationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('aingmacan'),
          actions: [
            IconButton(
                onPressed: () {
                  _authController.logout();
                },
                icon: Icon(Icons.exit_to_app))
          ],
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(onPressed: (){
                Get.toNamed(Routes.SENSOR);
              }, child: Text('gambar')),
              ElevatedButton(onPressed: (){
                Get.toNamed(Routes.VIDEO);
              }, child: Text('Video')),
              ElevatedButton(onPressed: (){
                Get.toNamed(Routes.MODUL5);
              }, child: Text('Modul 5')),
            ],
          ),
        ));
  }
}

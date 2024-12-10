import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gooningsigmamalerizzdukedennisrizzlratiobetaskibidiwithkaicenatinohio/app/data/services/http_controller.dart';
import 'package:gooningsigmamalerizzdukedennisrizzlratiobetaskibidiwithkaicenatinohio/app/routes/app_pages.dart';

class HomeView extends GetView<HttpController> {
  const HomeView({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('aingmacan'),
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
              ElevatedButton.icon(onPressed: (){
                Get.toNamed(Routes.CONNECTION);
              }, label: Text('Wifi connection'), icon: Icon(Icons.other_houses)),
            ],
          ),
        ));
  }
}

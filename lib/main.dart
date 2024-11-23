import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:gooningsigmamalerizzdukedennisrizzlratiobetaskibidiwithkaicenatinohio/app/modules/home/views/home_view.dart';
import 'package:gooningsigmamalerizzdukedennisrizzlratiobetaskibidiwithkaicenatinohio/app/data/services/http_controller.dart';
import 'package:gooningsigmamalerizzdukedennisrizzlratiobetaskibidiwithkaicenatinohio/firebase_options.dart';
import 'app/routes/app_pages.dart';
import 'package:get_storage/get_storage.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await GetStorage.init();

  Get.put(HttpController()); // Initializes HttpController globally
  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      home: HomeView(),
    ),
  );
}

import 'package:get/get.dart';

import '../modules/Video/bindings/video_binding.dart';
import '../modules/Video/views/video_view.dart';
import '../modules/authentication/bindings/authentication_binding.dart';
import '../modules/authentication/views/authentication_view.dart';
import '../modules/breakfast/bindings/breakfast_binding.dart';
import '../modules/breakfast/views/breakfast_view.dart';
import '../modules/foto/bindings/foto_binding.dart';
import '../modules/foto/views/foto_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/modul5/bindings/modul5_binding.dart';
import '../modules/modul5/views/modul5_view.dart';
import '../modules/mypage/bindings/mypage_binding.dart';
import '../modules/mypage/views/mypage_view.dart';
import '../modules/sensor/bindings/sensor_binding.dart';
import '../modules/sensor/views/sensor_view.dart';
import '../modules/task/bindings/task_binding.dart';
import '../modules/task/views/task_view.dart';
import '../modules/webView/bindings/webView_binding.dart';
import '../modules/webView/views/webView_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  // ignore: constant_identifier_names
  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.WEBVIEW,
      page: () => const WebviewView(),
      binding: WebviewBinding(),
    ),
    GetPage(
      name: _Paths.AUTHENTICATION,
      page: () => AuthenticationView(),
      binding: AuthenticationBinding(),
    ),
    GetPage(
      name: _Paths.MYPAGE,
      page: () => const MypageView(),
      binding: MypageBinding(),
    ),
    GetPage(
      name: _Paths.TASK,
      page: () => TaskView(),
      binding: TaskBinding(),
    ),
    GetPage(
      name: _Paths.BREAKFAST,
      page: () => const BreakfastView(),
      binding: BreakfastBinding(),
    ),
    GetPage(
      name: _Paths.SENSOR,
      page: () => const SensorView(),
      binding: SensorBinding(),
    ),
    GetPage(
      name: _Paths.FOTO,
      page: () => const FotoView(),
      binding: FotoBinding(),
    ),
    GetPage(
      name: _Paths.VIDEO,
      page: () => const VideoView(),
      binding: VideoBinding(),
    ),
    GetPage(
      name: _Paths.MODUL5,
      page: () => const Modul5View(),
      binding: Modul5Binding(),
    ),
  ];
}

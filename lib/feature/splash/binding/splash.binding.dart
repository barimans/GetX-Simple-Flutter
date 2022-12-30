import 'package:get/get.dart';
import 'package:getex_cuy/feature/splash/controller/splash.controller.dart';

class SplashBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => SplashController());
  }

}
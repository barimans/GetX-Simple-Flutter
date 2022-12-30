import 'package:get/get.dart';
import 'package:getex_cuy/feature/login/controller/login.controller.dart';

class LoginBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController());
  }

}
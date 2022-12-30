import 'package:get/get.dart';
import 'package:getex_cuy/feature/account/controller/account.controller.dart';

class AccountBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => AccountController());
  }

}
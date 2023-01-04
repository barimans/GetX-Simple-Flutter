import 'package:get/get.dart';
import 'package:getex_cuy/feature/account/controller/account.controller.dart';
import 'package:getex_cuy/repository/account.repository.dart';

class AccountBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => AccountController());
    Get.lazyPut(() =>
        AccountRepository(),
        tag: (AccountRepository).toString());
  }

}
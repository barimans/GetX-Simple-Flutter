import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:getex_cuy/constants/canoncial_path.dart';
import 'package:getex_cuy/feature/account/argument/account.argument.dart';
import 'package:getex_cuy/route/route.constant.dart';

class LoginController extends GetxController{
  var isLoading = false.obs;
  var isError = false.obs;
  var errMsg = "".obs;
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  void postLogin() async{
    isLoading(true);
    try {
      debugPrint("Username => ${usernameController.text}");
      debugPrint("Password => ${passwordController.text}");
      await Future.delayed(const Duration(seconds: 3));

      isLoading(false);
      isError(false);
      prefs.write("auth_token", "blablablayesdapettoken");
      Get.offNamed(RouteConstants.account, arguments: AccountArgument(id: "11"));
    } catch (e) {
      isLoading(false);
      isError(true);
      errMsg(e.toString());
      debugPrint("Error splash $e");
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}
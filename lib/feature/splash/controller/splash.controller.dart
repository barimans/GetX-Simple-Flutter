import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getex_cuy/constants/canoncial_path.dart';
import 'package:getex_cuy/route/route.constant.dart';

class SplashController extends GetxController{

  @override
  void onInit() {
    // TODO: implement onInit
    _initPlatform();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void _initPlatform() async {
    debugPrint("KEsini Lha");
    try {
      await Future.delayed(const Duration(seconds: 3));

      String tokenLogin = prefs.read("auth_token") ?? "";
      if (tokenLogin.isEmpty) {
        Get.offNamed(RouteConstants.login);
      } else {
        Get.offNamed(RouteConstants.account);
      }
      // Get.offNamed(RouteConstants.splash);
    } catch (e) {
      debugPrint("Error splash $e");
    }
  }
}
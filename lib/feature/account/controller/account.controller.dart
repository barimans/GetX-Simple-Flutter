import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Response;
import 'package:getex_cuy/constants/canoncial_path.dart';
import 'package:getex_cuy/feature/account/argument/account.argument.dart';
import 'package:getex_cuy/feature/account/model/account.model.dart';
import 'package:getex_cuy/main.dart';

class AccountController extends GetxController {
  var isLoading = true.obs;
  var isError = false.obs;
  var errMsg = "".obs;
  var accountData = <UserModel>[].obs;
  AccountArgument? accountArgument;

  Dio dio = Dio();

  @override
  void onInit() {
    // TODO: implement onInit
    accountArgument = Get.arguments;
    debugPrint("Account Argument => ${accountArgument?.id}");
    getUser();
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

  Future<List<UserModel>> getUser() async {
    isLoading(true);
    try {
      final result = await myApiClient.getData(CanonicalPath.ACCOUNT);
      var dataJson = jsonDecode(result.toString());
      List<dynamic> data = (dataJson["data"] ?? []) as List<dynamic>;
      isLoading(false);
      isError(false);
      accountData.value = data.map((e) => UserModel.fromMap(e)).toList();
      return accountData;
    } catch (e) {
      isLoading(false);
      isError(true);
      errMsg(e.toString());
      throw Exception(e);
    }
  }

  showToast(fName, lName, context) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text("${fName}  ${lName}"),
    ));
  }
}
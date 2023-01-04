import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Response;
import 'package:getex_cuy/base/base.controller.dart';
import 'package:getex_cuy/feature/account/argument/account.argument.dart';
import 'package:getex_cuy/feature/account/model/account.model.dart';
import 'package:getex_cuy/repository/account.repository.dart';

class AccountController extends BaseController {
  final AccountRepository accountRepository = Get.find(tag: (AccountRepository).toString());
  AccountArgument? accountArgument;

  final RxList<UserModel> _accountListController =
  RxList.empty();

  List<UserModel> get accountList =>
      _accountListController.toList();

  @override
  void onInit() {
    // TODO: implement onInit
    accountArgument = Get.arguments;
    debugPrint("Account Argument => ${accountArgument?.id}");
    getAccountUser();
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

  void getAccountUser(){
    var accountDataService = accountRepository.getAccountUser();

    callDataService(
      accountDataService,
      onSuccess: _handleDataAccountList
    );
  }

  void _handleDataAccountList(List<UserModel> listUserModel){
    _accountListController(listUserModel);
  }

  showToast(fName, lName, context) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text("${fName}  ${lName}"),
    ));
  }
}
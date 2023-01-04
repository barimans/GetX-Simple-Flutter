import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getex_cuy/base/base.view.dart';
import 'package:getex_cuy/feature/account/argument/account.argument.dart';
import 'package:getex_cuy/feature/account/controller/account.controller.dart';
import 'package:getex_cuy/widget/custom_app_bar.dart';
import 'package:shimmer/shimmer.dart';

class AccountScreen extends BaseView<AccountController> {
  const AccountScreen({super.key});

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return CustomAppBar(appBarTitleText: "Account Page");
  }

  @override
  Widget body(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Obx(() {
        return Column(
          children: controller.accountList.map<Widget>((user) {
            return Card(
              child: ListTile(
                onTap: () {
                  controller.showToast(
                      user.firstName, user.lastName, context);
                },
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(user.avatar),
                ),
                title: Text(user.firstName),
                subtitle: Text(user.email),
              ),
            );
          }).toList(),
        );
      })
    );
  }
}

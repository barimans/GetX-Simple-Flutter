import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getex_cuy/feature/account/argument/account.argument.dart';
import 'package:getex_cuy/feature/account/controller/account.controller.dart';
import 'package:shimmer/shimmer.dart';

class AccountScreen extends StatelessWidget {
  final AccountArgument? args;

  const AccountScreen({Key? key, this.args}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AccountController>(
      builder: (accountController) {
        return Scaffold(
            appBar: AppBar(title: const Text("GetX Cuy")),
            body: Container(
                alignment: Alignment.topCenter,
                padding: const EdgeInsets.all(20),
                child: Obx(() {
                  if (accountController.isLoading.value) {
                    return Shimmer.fromColors(
                        baseColor: Colors.grey[400]!,
                        highlightColor: Colors.grey[300]!,
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: 5,
                          itemBuilder: (context, index) => Container(
                            margin: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                            ),
                            height: 100,
                            width: 200,
                          ),
                        ));
                  } else if (accountController.isError.value) {
                    return Text(
                        "Error: ${accountController.errMsg.value.capitalize}");
                  } else {
                    return Column(
                      children: accountController.accountData.map<Widget>((user) {
                        return Card(
                          child: ListTile(
                            onTap: () {
                              accountController.showToast(
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
                  }
                })));
      }
    );
  }
}

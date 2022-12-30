import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getex_cuy/feature/login/controller/login.controller.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      builder: (loginController) {
        return Container(
          color: Colors.blue,
          child: SafeArea(
            child: Scaffold(
              body: Container(
                padding: const EdgeInsets.all(16),
                child: Obx(() {
                    return Stack(
                      children: [
                        Column(
                          children: [
                            const Text(
                              "Login to GetX Cuy",
                              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(height: 48,),
                            TextField(
                              controller: loginController.usernameController,
                              decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Username',
                                  hintText: 'Enter your username'
                              ),
                            ),
                            const SizedBox(height: 16,),
                            TextField(
                              controller: loginController.passwordController,
                              obscureText: true,
                              decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Password',
                                  hintText: 'Enter your password'
                              ),
                            ),
                            const SizedBox(height: 48,),
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                  onPressed: (){
                                    loginController.postLogin();
                                  },
                                  child: const Text("login")),
                            )
                          ],
                        ),
                        if (loginController.isLoading.value)
                          const Center(
                            child: CircularProgressIndicator(),
                          )
                      ],
                    );
                  }
                ),
              ),
            ),
          ),
        );
      }
    );
  }
}

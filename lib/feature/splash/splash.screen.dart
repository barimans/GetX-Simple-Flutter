import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getex_cuy/feature/splash/controller/splash.controller.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
      builder: (splashController) {
        return Scaffold(
            backgroundColor: Colors.white70,
            body: Stack(
              children: const [
                Center(
                  child: Icon(
                    Icons.accessibility,
                    size: 200,
                    color: Colors.blue,
                  ),
                ),
                Positioned(
                    bottom: 20,
                    left: 20,
                    right: 20,
                    child: Text(
                      "Hai Barrr . . .",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black87,
                        fontWeight: FontWeight.bold
                      ),
                    )
                )
              ],
            ));
      }
    );
  }
}

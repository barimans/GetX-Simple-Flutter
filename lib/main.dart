import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getex_cuy/feature/splash/binding/splash.binding.dart';
import 'package:getex_cuy/route/route.pages.dart';
import 'package:getex_cuy/services/api_client.dart';
import 'package:getex_cuy/constants/env.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
ApiClient myApiClient = ApiClient();

void main() {
  runApp(MyApp(env: EnvValue.staging,));
}

class MyApp extends StatelessWidget {
  final Env env;
  const MyApp({super.key, required this.env});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Getex Cuy',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      navigatorKey: navigatorKey,
      getPages: RoutePages.pages,
      initialBinding: SplashBinding(),
      debugShowCheckedModeBanner: false,
    );
  }
}

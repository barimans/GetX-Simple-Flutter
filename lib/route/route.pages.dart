import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:getex_cuy/feature/account/argument/account.argument.dart';
import 'package:getex_cuy/feature/account/binding/account.binding.dart';
import 'package:getex_cuy/feature/account/screen/account.screen.dart';
import 'package:getex_cuy/feature/login/binding/login.binding.dart';
import 'package:getex_cuy/feature/login/screen/login.screen.dart';
import 'package:getex_cuy/feature/splash/binding/splash.binding.dart';
import 'package:getex_cuy/feature/splash/splash.screen.dart';
import 'package:getex_cuy/route/route.constant.dart';

class RoutePages{
  static final List<GetPage> pages = [
    GetPage(
      name: RouteConstants.splash,
      page: () => const SplashScreen(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: RouteConstants.login,
      page: () => const LoginScreen(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: RouteConstants.account,
      page: () => AccountScreen(
        args: AccountArgument(),
      ),
      binding: AccountBinding(),
    ),
  ];
}
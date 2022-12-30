import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getex_cuy/constants/env.dart';
import 'package:getex_cuy/main.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  runZonedGuarded(() {
    initializeDateFormatting().then((_) => runApp(
        MyApp(
          env: EnvValue.production,
        )));
  }, (error, stackTrace) async {});
}
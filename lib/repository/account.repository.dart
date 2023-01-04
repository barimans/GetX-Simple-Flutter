import 'dart:convert';

import 'package:getex_cuy/constants/canoncial_path.dart';
import 'package:getex_cuy/feature/account/model/account.model.dart';
import 'package:getex_cuy/main.dart';

class AccountRepository{
  Future<List<UserModel>> getAccountUser() async{
    try {
      final result = await myApiClient.getData(CanonicalPath.ACCOUNT);
      var dataJson = jsonDecode(result.toString());
      List<dynamic> data = (dataJson["data"] ?? []) as List<dynamic>;
      var accountData = data.map((e) => UserModel.fromMap(e)).toList();
      return accountData;
    } catch (e) {
      rethrow;
    }
  }
}
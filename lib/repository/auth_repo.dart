import 'dart:convert';

import 'package:prepseed_app/models/auth_model.dart';
import "package:http/http.dart" as http;
import 'package:prepseed_app/services/apiConstant.dart';
import 'package:prepseed_app/services/auth_client.dart';

abstract class AuthRepo {
  Future<dynamic> register(AuthModel authModel);
  Future<dynamic> login(AuthModel authModel);
}

class AuthRepoImpl extends AuthRepo {
  @override
  Future login(AuthModel authModel) async {
    final body = {"email": authModel.email, "password": authModel.password};
    http.Response response =
        await AuthClient.instance.doPost(ApiConstant.login, body);

    print("check0");
    if (response.statusCode == 200) {
      dynamic jsonData = jsonDecode(response.body);
      return jsonData;
    } else {
      throw response.statusCode;
    }
  }

  @override
  Future register(AuthModel authModel) async {
    final body = {"email": authModel.email, "password": authModel.password};
    http.Response response =
        await AuthClient.instance.doPost(ApiConstant.register, body);
    print("check0");
    if (response.statusCode == 200) {
      dynamic jsonData = jsonDecode(response.body);
      return jsonData;
    } else {
      throw response.statusCode;
    }
  }
}

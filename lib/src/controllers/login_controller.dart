import 'package:flutter/material.dart';
import 'package:ieanjesus/src/api/api_provider.dart';

class LoginController  extends ChangeNotifier {
    GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

 final _api = ApiProvider();
  bool validateFormCoro() {
    if (loginFormKey.currentState!.validate()) {
      return true;
    } else {
      return false;
    }
  }

  String _codigo = "";

  void onCodeChange(String text) {
    _codigo = text;
    print('onCodeChange: $_codigo');
  }


}
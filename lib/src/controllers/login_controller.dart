import 'package:flutter/material.dart';
import 'package:ieanjesus/src/api/api_provider.dart';
import 'package:ieanjesus/src/api/auth.dart';
import 'package:ieanjesus/src/models/session.dart';

class LoginController extends ChangeNotifier {
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  final _api = ApiProvider();

  Session? infoUser;

  bool validateFormLogin() {
    if (loginFormKey.currentState!.validate()) {
      return true;
    } else {
      return false;
    }
  }

  String _nombre = "";
  void onNameChange(String _text) {
    _nombre = _text;
    // print('onNombreChange: $_nombre');
  }

  String _codigo = "";
  void onCodigoChange(String _cod) {
    _codigo = _cod;
    // print('onCodeChange: $_codigo');
  }

  //========================== LOGIN =======================//
  Future<bool> loginApp() async {
    // print('INFO login:$_nombre');
    // print('INFO login:$_codigo');
    String? _tipo;
    if (_codigo == '@12345' || _codigo == '@2022') {
      if (_codigo == '@12345') {
        _tipo = 'standar';
      } else if (_codigo == '@2022') {
        _tipo = 'master';
      }
      final response = {
        "usuario": _nombre,
        "tipo": _tipo,
        "codigo": _codigo,
      };
// print('RESPUESTA:$response');
      await Auth.instance.saveSession(response);
      infoUser = await Auth.instance.getSession();
// print('RESPUESTA:$infoUser');
      return true;
    } else {
      return false;
    }

  }

}

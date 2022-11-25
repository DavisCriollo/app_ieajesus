import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:ieanjesus/src/models/session.dart';

class Auth {
  Auth.internal();
  static final Auth _instance = Auth.internal();
  static Auth get instance => _instance;

  final _storage = const FlutterSecureStorage();
  final keySESION = 'SESSION';

// GUARDO LA INFORMACION EN EL DISPOSITIVO
  Future<void> saveSession(dynamic _data) async {
    // print('LA DATA ES: $_data');
    final Session session = Session(
      usuario: _data['usuario'],
      tipo: _data['tipo'],
      codigo: _data['codigo'],
    );
// CONVERTIMOS  LA INFORMACION  A STRING PARA GUARDAR AL DISPOSITIVO
    final String value = jsonEncode(session.toJson());
// GUARDAMOS LA INFORMACION DEL DISPOSITIVO
    await _storage.write(key: keySESION, value: value);
// print('guardado enel dispositivo la ssesion: $value');
  }


// OBTEMENOS LA INFORMACION DEL DISPOSITIVO
  Future<Session?> getSession() async {
    final String? value = await _storage.read(key: keySESION);
    if (value != null) {
      // final Map<String, dynamic> json = jsonDecode(value);
      final session = Session.fromJson(jsonDecode(value));
      return session;
    }
    return null;
  }

  // CIERRO SESSION
  Future<void> deleteSesion(BuildContext context) async {
    // await _storage.deleteAll();
    await _storage.delete(key: keySESION);
    Navigator.pushNamedAndRemoveUntil(context, 'login', (_) => false);
  }













}



import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:ieanjesus/src/models/biblia_libros_model.dart';

class HomeController extends ChangeNotifier {

GlobalKey<FormState> coroFormKey = GlobalKey<FormState>();
GlobalKey<FormState> himnoFormKey = GlobalKey<FormState>();
GlobalKey<FormState> alabanzaFormKey = GlobalKey<FormState>();
GlobalKey<FormState> coroNinoFormKey = GlobalKey<FormState>();



  bool validateFormCoro() {
    if (coroFormKey.currentState!.validate()) {
      return true;
    } else {
      return false;
    }
  }
  bool validateFormHimno() {
    if (himnoFormKey.currentState!.validate()) {
      return true;
    } else {
      return false;
    }
  }
  bool validateFormAlabanza() {
    if (alabanzaFormKey.currentState!.validate()) {
      return true;
    } else {
      return false;
    }
  }
  bool validateFormCoroNino() {
    if (coroNinoFormKey.currentState!.validate()) {
      return true;
    } else {
      return false;
    }
  }
  





//================================== OBTENEMOS TODOS LOS LIBROS  ==============================//

  List<dynamic> _listaLibros  = [];
  List<dynamic> get getlistalibrosBiblia => _listaLibros;

  void setListaLibrosBiblia(List<dynamic> data) {
    _listaLibros = data;
    print('data : ${_listaLibros}');

    notifyListeners();
  }
  List<dynamic>  _detalleLibro  = [];
  List<dynamic>  get getDetallelibroBiblia => _detalleLibro;

  void setDetalleLibroBiblia( List<dynamic> data) {
    _detalleLibro = data;
    // print('datalleeee : ${_detalleLibro[42]}');

    notifyListeners();
  }

  bool? _errorLibrosBliblia; // sera nulo la primera vez
  bool? get getErrorLibrosBliblia => _errorLibrosBliblia;

  Future getTodosLosibrosBiblia() async {
    final response = await rootBundle.loadString('assets/data/sbiblia.json');

final dataRespose=BibliaLibrosController.fromJson(response);


setListaLibrosBiblia(dataRespose.biblia.keys.toList());
setDetalleLibroBiblia(dataRespose.biblia.values.toList());
    // print('response LIBROS BIBLIA : ${dataRespose.biblia.keys.toList()}');
    // print('response LIBROS BIBLIA : ${dataRespose.biblia.runtimeType}');
    // print('response LIBROS BIBLIA : ${dataRespose.biblia['Juan']}');

    //   // cantidad: 100,
    //   // page: 0,
    //   search: search,
    //   // input: 'nomId',
    //   // orden: false,
    //   // datos: '',
    //   // rucempresa: '${dataUser!.rucempresa}',
    //   token: '${dataUser!.token}',
    // print('response LIBROS BIBLIA : ${response.runtimeType}');
//     if (response != '') {
// final dataRespose=jsonDecode(response);

//       _errorLibrosBliblia = true;

//       // setMapalibrosBiblia(dataRespose);
//       notifyListeners();
//       return dataRespose;
//     }
//     if (response =='') {
//       _errorLibrosBliblia = false;
//       notifyListeners();
//       return null;
//     }

//     return null;
  }

















}
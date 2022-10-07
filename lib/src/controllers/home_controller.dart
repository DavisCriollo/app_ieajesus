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

  List<dynamic> _listaLibros = [];
  List<dynamic> get getlistalibrosBiblia => _listaLibros;

  void setListaLibrosBiblia(List<dynamic> data) {
    _listaLibros = data;
    print('data : ${_listaLibros}');

    notifyListeners();
  }

  List<dynamic> _detalleLibro = [];
  List<dynamic> get getDetallelibroBiblia => _detalleLibro;

  void setDetalleLibroBiblia(List<dynamic> data) {
    _detalleLibro = data;
    // print('datalleeee : ${_detalleLibro[42]}');

    notifyListeners();
  }

  bool? _errorLibrosBliblia; // sera nulo la primera vez
  bool? get getErrorLibrosBliblia => _errorLibrosBliblia;

  Future getTodosLosibrosBiblia() async {
    final response = await rootBundle.loadString('assets/data/sbiblia.json');

    final dataRespose = BibliaLibrosController.fromJson(response);

    setListaLibrosBiblia(dataRespose.biblia.keys.toList());
    setDetalleLibroBiblia(dataRespose.biblia.values.toList());
  }

//=============================================================================//
//================================== MODULO COROS ==============================//
  
  //=============== INPUTS ===========//
  
  String? _tituloCoro;
  String? get getTituloCoro => _tituloCoro;
  void setTituloCoro(String? _textCoro) {
    _tituloCoro = _textCoro;
    print('TITULO CORO: $_tituloCoro');
    notifyListeners();
  }

  String? _letraCoro;
  String? get getletraCoro => _letraCoro;
  void setLetraCoro(String? _textCoro) {
    _letraCoro = _textCoro;
    print('LETRA CORO: $_letraCoro');
    notifyListeners();
  }

//====================================//





//=============================================================================//
//================================== MODULO HIMNOS ==============================//
  
  //=============== INPUTS ===========//
  
  String? _tituloHimno;
  String? get getTituloHimno => _tituloHimno;
  void setTituloHimno(String? _textHimno) {
    _tituloHimno = _textHimno;
    print('TITULO Himno: $_tituloHimno');
    notifyListeners();
  }

  String? _letraHimno;
  String? get getletraHimno => _letraHimno;
  void setLetraHimno(String? _textHimno) {
    _letraHimno = _textHimno;
    print('LETRA Himno: $_letraHimno');
    notifyListeners();
  }

//====================================//





//=============================================================================//
//================================== MODULO HIMNOS ==============================//
  
  //=============== INPUTS ===========//
  
  String? _tituloAlabanza;
  String? get getTituloAlabanza => _tituloAlabanza;
  void setTituloAlabanza(String? _textAlabanza) {
    _tituloAlabanza = _textAlabanza;
    print('TITULO Alabanza: $_tituloAlabanza');
    notifyListeners();
  }

  String? _letraAlabanza;
  String? get getletraAlabanza => _letraAlabanza;
  void setLetraAlabanza(String? _textAlabanza) {
    _letraAlabanza = _textAlabanza;
    print('LETRA Alabanza: $_letraAlabanza');
    notifyListeners();
  }

//====================================//




//=============================================================================//
//=============================================================================//



//=============================================================================//
//================================== MODULO HIMNOS ==============================//
  
  //=============== INPUTS ===========//
  
  String? _tituloCoroNino;
  String? get getTituloCoroNino => _tituloCoroNino;
  void setTituloCoroNino(String? _textCoroNino) {
    _tituloCoroNino = _textCoroNino;
    print('TITULO CoroNino: $_tituloCoroNino');
    notifyListeners();
  }

  String? _letraCoroNino;
  String? get getletraCoroNino => _letraCoroNino;
  void setLetraCoroNino(String? _textCoroNino) {
    _letraCoroNino = _textCoroNino;
    print('LETRA CoroNino: $_letraCoroNino');
    notifyListeners();
  }

//====================================//




//=============================================================================//
//=============================================================================//
































}

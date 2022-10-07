import 'dart:async';
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


//  =================  CREO DEBOUNCE  PARA BUSQUEDAS ==================//

  Timer? _deboucerSearchBuscaCoro;
  Timer? _deboucerSearchBuscaHimno;
  Timer? _deboucerSearchBuscaAlabanza;
  Timer? _deboucerSearchBuscaInfantiles;

  @override
  void dispose() {
    _deboucerSearchBuscaCoro?.cancel();
  _deboucerSearchBuscaHimno?.cancel();
  _deboucerSearchBuscaAlabanza?.cancel();
  _deboucerSearchBuscaInfantiles?.cancel();

    // _videoController.dispose();
    super.dispose();
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




//===================BOTON SEARCH COROS==========================//

  bool _btnSearchCoros = false;
  bool get btnSearch => _btnSearchCoros;

  void setBtnSearch(bool action) {
    _btnSearchCoros = action;
    //  print('==_btnSearchCoros===> $_btnSearchCoros');
    notifyListeners();
  }
  //===================INPUT SEARCH COROSE==========================//
 String _nameSearchCoro = "";
  String get nameSearch => _nameSearchCoro;

  void onSearchText(String data) {
    _nameSearchCoro = data;
    if (_nameSearchCoro.length >= 3) {
      _deboucerSearchBuscaCoro?.cancel();
      _deboucerSearchBuscaCoro = Timer(const Duration(milliseconds: 700), () {
        print('=====> $data');
        // buscaAusencias(_nameSearch,'false');
      });
    } else {
      // buscaAusencias('','false');
    }
    notifyListeners();
  }





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

//===================BOTON SEARCH HIMNOS==========================//

  bool _btnSearchHimnos = false;
  bool get btnSearcHimno => _btnSearchHimnos;

  void setBtnSearchHimno(bool action) {
    _btnSearchHimnos = action;
    //  print('==_btnSearchCoros===> $_btnSearchCoros');
    notifyListeners();
  }
  //===================INPUT SEARCH COROSE==========================//
 String _nameSearchHimno = "";
  String get nameSearchHimno => _nameSearchHimno;

  void onSearchTextHimno(String data) {
    _nameSearchHimno = data;
    if (_nameSearchHimno.length >= 3) {
      _deboucerSearchBuscaHimno?.cancel();
      _deboucerSearchBuscaHimno = Timer(const Duration(milliseconds: 700), () {
        print('=====> $data');
        // buscaAusencias(_nameSearch,'false');
      });
    } else {
      // buscaAusencias('','false');
    }
    notifyListeners();
  }



//=============================================================================//
//================================== MODULO ALABANZA ==============================//
  
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

//===================BOTON SEARCH ALABANZAS ==========================//

  bool _btnSearchAlabanzas = false;
  bool get btnSearchAlabanza => _btnSearchAlabanzas;

  void setBtnSearchAlabanza(bool action) {
    _btnSearchAlabanzas = action;
    //  print('==_btnSearchCoros===> $_btnSearchCoros');
    notifyListeners();
  }
  //===================INPUT SEARCH COROSE==========================//
 String _nameSearchAlabanza = "";
  String get nameSearchAlabanza => _nameSearchAlabanza;

  void onSearchTextAlabanza(String data) {
    _nameSearchAlabanza = data;
    if (_nameSearchAlabanza.length >= 3) {
      _deboucerSearchBuscaAlabanza?.cancel();
      _deboucerSearchBuscaAlabanza = Timer(const Duration(milliseconds: 700), () {
        print('=====> $data');
        // buscaAusencias(_nameSearch,'false');
      });
    } else {
      // buscaAusencias('','false');
    }
    notifyListeners();
  }



//=============================================================================//
//=============================================================================//



//=============================================================================//
//================================== MODULO INFANTILES ==============================//
  
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

//===================BOTON SEARCH ALABANZAS ==========================//

  bool _btnSearchInfantiles = false;
  bool get btnSearchInfantiles => _btnSearchInfantiles;

  void setBtnSearchInfantiles(bool action) {
    _btnSearchInfantiles = action;
    //  print('==_btnSearchCoros===> $_btnSearchCoros');
    notifyListeners();
  }
  //===================INPUT SEARCH COROSE==========================//
 String _nameSearchInfantiles = "";
  String get nameSearchInfantiles => _nameSearchInfantiles;

  void onSearchTextInfantiles(String data) {
    _nameSearchInfantiles = data;
    if (_nameSearchInfantiles.length >= 3) {
      _deboucerSearchBuscaInfantiles?.cancel();
      _deboucerSearchBuscaInfantiles = Timer(const Duration(milliseconds: 700), () {
        print('=====> $data');
        // buscaAusencias(_nameSearch,'false');
      });
    } else {
      // buscaAusencias('','false');
    }
    notifyListeners();
  }


//=============================================================================//
//=============================================================================//
































}

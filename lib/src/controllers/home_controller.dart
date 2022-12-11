import 'dart:async';
import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:ieanjesus/src/Data/data_local_provider.dart';
import 'package:ieanjesus/src/api/api_provider.dart';
import 'package:ieanjesus/src/api/auth.dart';
// import 'package:ieanjesus/src/models/biblia_model..dart';
import 'package:ieanjesus/src/models/letra_musica_model.dart';
import 'package:ieanjesus/src/models/lista_de_Musicas_model.dart';
import 'package:ieanjesus/src/models/session.dart';

class HomeController extends ChangeNotifier {
  GlobalKey<FormState> coroFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> himnoFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> alabanzaFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> coroNinoFormKey = GlobalKey<FormState>();
  final _api = ApiProvider();
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

  Session? _user;

  Session? get getSesion => _user;
  void setSesion(Session? _inf) {
    _user = _inf;
    //
    notifyListeners();
  }

  void resetFormCoros() {
    setTipoCoro(null);
    setTituloCoro(null);
    setLetraCoro(null);

    setTipoHimno(null);
    setTituloHimno(null);
    setLetraHimno(null);

    setTipoAlabanza(null);
    setTituloAlabanza(null);
    setLetraAlabanza(null);

    setTipoInfantiles(null);
    setTituloCoroNino(null);
    setLetraCoroNino(null);
    _pageCapitulo = 0;

    LetraMusica(
      id: 0,
      tipo: '',
      titulo: '',
      letra: '',
    );
    _getCoro;
    _getHimno;
    _getAlabanza;
    _getInfantil;
    notifyListeners();
  }

//================================== OBTENEMOS TODOS LOS LIBROS  ==============================//

  List<dynamic> _listaLibros = [];
  List<dynamic> get getlistalibrosBiblia => _listaLibros;

  void setListaLibrosBiblia(List<dynamic> data) {
    _listaLibros = data;
    //

    notifyListeners();
  }

  List<dynamic> _detalleLibro = [];
  List<dynamic> get getDetallelibroBiblia => _detalleLibro;

  void setDetalleLibroBiblia(List<dynamic> data) {
    _detalleLibro = data;
    //

    notifyListeners();
  }

  bool? _errorLibrosBliblia; // sera nulo la primera vez
  bool? get getErrorLibrosBliblia => _errorLibrosBliblia;

  Future getTodosLosibrosBiblia() async {
    final response = await rootBundle.loadString('assets/data/sbiblia.json');

    _errorLibrosBliblia = true;


    final _resp = (jsonDecode(response));



    setListaLibrosBibliaCompleta(_resp['biblia']);


    notifyListeners();
    return response;
  }
//================================== OBTENEMOS TODOS LOS LIBROS DE LA BIBLIA COMPLETO  ==============================//

  Map<String, dynamic> _listaLibrosCompleta = {};
  Map<String, dynamic> get getlistalibrosBibliaCompleta => _listaLibrosCompleta;

  void setListaLibrosBibliaCompleta(Map<String, dynamic> data) {
    _listaLibrosCompleta = data;
 
    notifyListeners();
  }

//  =================  CREO DEBOUNCE  PARA BUSQUEDAS ==================//

  Timer? _deboucerSearchBuscaCoro;
  Timer? _deboucerSearchBuscaHimno;
  Timer? _deboucerSearchBuscaAlabanza;
  Timer? _deboucerSearchBuscaInfantiles;
  Timer? _deboucerSearchBuscaBiblia;

  @override
  void dispose() {
    _deboucerSearchBuscaCoro?.cancel();
    _deboucerSearchBuscaHimno?.cancel();
    _deboucerSearchBuscaAlabanza?.cancel();
    _deboucerSearchBuscaInfantiles?.cancel();
    _deboucerSearchBuscaBiblia?.cancel();

    // _videoController.dispose();
    super.dispose();
  }

//=============================================================================//
//================================== MODULO COROS ==============================//

  //=============== INPUTS ===========//

  String? _tipoCoro;
  String? get getTipoCoro => _tipoCoro;
  void setTipoCoro(String? _textTipo) {
    _tipoCoro = _textTipo;

    notifyListeners();
  }

  String? _tituloCoro;
  String? get getTituloCoro => _tituloCoro;
  void setTituloCoro(String? _textCoro) {
    _tituloCoro = _textCoro;

    notifyListeners();
  }

  String? _letraCoro;
  String? get getletraCoro => _letraCoro;
  void setLetraCoro(String? _textCoro) {
    _letraCoro = _textCoro;

    notifyListeners();
  }

//====================================//

//===================BOTON SEARCH COROS==========================//

  bool _btnSearchCoros = false;
  bool get btnSearch => _btnSearchCoros;

  void setBtnSearch(bool action) {
    _btnSearchCoros = action;
    //
    notifyListeners();
  }

  //===================INPUT SEARCH COROSE==========================//
  String _nameSearchCoro = "";
  String get nameSearch => _nameSearchCoro;

  void onSearchText(String data) {
    _nameSearchCoro = data;
    if (_nameSearchCoro.length >= 2) {
      _deboucerSearchBuscaCoro?.cancel();
      _deboucerSearchBuscaCoro = Timer(const Duration(milliseconds: 700), () {
        //
        listarAllCoros(data);
      });
    } else {
      listarAllCoros('');
 
    }
    notifyListeners();
  }
//===================BOTON SEARCH BIBLIA=========================//

  bool _btnSearchBiblia = false;
  bool get btnSearchBiblia => _btnSearchBiblia;

  void setBtnSearchBiblia(bool action) {
    _btnSearchBiblia = action;
    //
    notifyListeners();
  }

  //===================INPUT SEARCH BIBLIA==========================//

  List _bibliasearch = [];
  List get getlistaBibliaSearch => _bibliasearch;

  void setlistaBibliaSearch(List data) {
    _bibliasearch = data.reversed.toList();
  
    notifyListeners();
  }


  String _nameSearchBiblia = "";
  String get nameSearchBiblia => _nameSearchBiblia;

  void onSearchTextBiblia(String data) {
    _nameSearchBiblia = data;
    if (_nameSearchBiblia.length >= 2) {
      _deboucerSearchBuscaBiblia?.cancel();
      _deboucerSearchBuscaBiblia = Timer(const Duration(milliseconds: 700), () {
        _bibliasearch = [];

        _listaLibrosCompleta;

        _listaLibrosCompleta.forEach((key, value) {
          for (var k = 0; k < _listaLibrosCompleta[key].length; k++) {
            for (var i = 0; i < _listaLibrosCompleta[key][k].length; i++) {
              if (_listaLibrosCompleta[key][k][i]
                  .toLowerCase()
                  .replaceAll(',', '')
                  .replaceAll(':', '')
                  .replaceAll(';', '')
                  .replaceAll('á', 'a')
                  .replaceAll('é', 'e')
                  .replaceAll('í', 'i')
                  .replaceAll('ó', 'o')
                  .replaceAll('ú', 'u')
                  .replaceAll('ú', 'u')
                  .replaceAll('Á', 'A')
                  .replaceAll('É', 'E')
                  .replaceAll('Í', 'I')
                  .replaceAll('Ó', 'O')
                  .replaceAll('Ú', 'U')
                  .contains(data.toLowerCase())) {
                _bibliasearch.add({
                  "nombrelibro": key,
                  "capitulo": k + 1,
                  "verso": i + 1,
                  "texto": _listaLibrosCompleta[key][k][i],
                  "libro": _listaLibrosCompleta[key],
                });
              }
            }
          }
        });

        notifyListeners();

 
      });
    } else {
      setlistaBibliaSearch([]);
    
    }
    // notifyListeners();
  }

//=============================================================================//
//================================== MODULO HIMNOS ==============================//

  //=============== INPUTS ===========//

  String? _tipoHimno;
  String? get getTipoHimno => _tipoHimno;
  void setTipoHimno(String? _textTipo) {
    _tipoHimno = _textTipo;
    //
    notifyListeners();
  }

  String? _tituloHimno;
  String? get getTituloHimno => _tituloHimno;
  void setTituloHimno(String? _textHimno) {
    _tituloHimno = _textHimno;
    //
    notifyListeners();
  }

  String? _letraHimno;
  String? get getletraHimno => _letraHimno;
  void setLetraHimno(String? _textHimno) {
    _letraHimno = _textHimno;
    //
    notifyListeners();
  }

//====================================//

//===================BOTON SEARCH HIMNOS==========================//

  bool _btnSearchHimnos = false;
  bool get btnSearcHimno => _btnSearchHimnos;

  void setBtnSearchHimno(bool action) {
    _btnSearchHimnos = action;
    //
    notifyListeners();
  }

  //===================INPUT SEARCH COROSE==========================//
  String _nameSearchHimno = "";
  String get nameSearchHimno => _nameSearchHimno;

  void onSearchTextHimno(String data) {
    _nameSearchHimno = data;
    if (_nameSearchHimno.length >= 2) {
      _deboucerSearchBuscaHimno?.cancel();
      _deboucerSearchBuscaHimno = Timer(const Duration(milliseconds: 700), () {
        listarAllHimnos(data);
      });
    } else {
      listarAllHimnos('');
    }
    notifyListeners();
  }

//=============================================================================//
//================================== MODULO ALABANZA ==============================//

  //=============== INPUTS ===========//
  String? _tipoAlabanza;
  String? get getTipoAlabanza => _tipoAlabanza;
  void setTipoAlabanza(String? _textTipo) {
    _tipoAlabanza = _textTipo;
    //
    notifyListeners();
  }

  String? _tituloAlabanza;
  String? get getTituloAlabanza => _tituloAlabanza;
  void setTituloAlabanza(String? _textAlabanza) {
    _tituloAlabanza = _textAlabanza;
    notifyListeners();
  }

  String? _letraAlabanza;
  String? get getletraAlabanza => _letraAlabanza;
  void setLetraAlabanza(String? _textAlabanza) {
    _letraAlabanza = _textAlabanza;
    notifyListeners();
  }

//===================BOTON SEARCH ALABANZAS ==========================//

  bool _btnSearchAlabanzas = false;
  bool get btnSearchAlabanza => _btnSearchAlabanzas;

  void setBtnSearchAlabanza(bool action) {
    _btnSearchAlabanzas = action;
    //
  }

  //===================INPUT SEARCH COROSE==========================//
  String _nameSearchAlabanza = "";
  String get nameSearchAlabanza => _nameSearchAlabanza;

  void onSearchTextAlabanza(String data) {
    _nameSearchAlabanza = data;
    if (_nameSearchAlabanza.length >= 2) {
      _deboucerSearchBuscaAlabanza?.cancel();
      _deboucerSearchBuscaAlabanza =
          Timer(const Duration(milliseconds: 700), () {
        listarAllAlabanzas(data);
      });
    } else {
      listarAllAlabanzas('');
    }
    notifyListeners();
  }

//=============================================================================//
//================================== MODULO INFANTILES ==============================//

  //=============== INPUTS ===========//
  String? _tipoInfantiles;
  String? get getTipoInfantiles => _tipoInfantiles;
  void setTipoInfantiles(String? _textTipo) {
    _tipoInfantiles = _textTipo;
    //
    notifyListeners();
  }

  String? _tituloCoroNino;
  String? get getTituloCoroNino => _tituloCoroNino;
  void setTituloCoroNino(String? _textCoroNino) {
    _tituloCoroNino = _textCoroNino;
    notifyListeners();
  }

  String? _letraCoroNino;
  String? get getletraCoroNino => _letraCoroNino;
  void setLetraCoroNino(String? _textCoroNino) {
    _letraCoroNino = _textCoroNino;
    notifyListeners();
  }

//====================================//

//===================BOTON SEARCH INFANTILES ==========================//

  bool _btnSearchInfantiles = false;
  bool get btnSearchInfantiles => _btnSearchInfantiles;

  void setBtnSearchInfantiles(bool action) {
    _btnSearchInfantiles = action;
    //
  }

  //===================INPUT SEARCH COROSE==========================//
  String _nameSearchInfantiles = "";
  String get nameSearchInfantiles => _nameSearchInfantiles;

  void onSearchTextInfantiles(String data) {
    _nameSearchInfantiles = data;
    if (_nameSearchInfantiles.length >= 2) {
      _deboucerSearchBuscaInfantiles?.cancel();
      _deboucerSearchBuscaInfantiles =
          Timer(const Duration(milliseconds: 700), () {
        listarAllInfantiles(data);
      });
    } else {
      listarAllInfantiles('');
    }
    notifyListeners();
  }

//===================================CREAR COROS==========================================//
//=======================================================================================//

  Future crearCoro() async {
    await DB.insert(
        LetraMusica(tipo: 'coro', titulo: _tituloCoro, letra: _letraCoro));
    await listarAllCoros('');
  }
//===================================ELIMINA COROS==========================================//

  Future eliminaCoro(LetraMusica _getCoro) async {
    await DB.delete(_getCoro);
    await listarAllCoros('');
  }

//===================================EDITAR COROS==========================================//

  Future editarCoro() async {
    _getCoro!.titulo = _tituloCoro;
    _getCoro!.letra = _letraCoro;
    await DB.update(_getCoro!);
    await listarAllCoros('');
  }

//===================================LISTA TODOS LOS COROS==========================================//
  List<LetraMusica> _listaCoros = [];
  List<LetraMusica> get getListaCoros => _listaCoros;

  void setListaCoros(List<LetraMusica> _listCoros) {
    _listaCoros = _listCoros;
    notifyListeners();
  }

  bool? _errorListaCoros; // sera nulo la primera vez
  bool? get getErrorListaCoros => _errorListaCoros;
  set setErrorListaCoros(bool? value) {
    _errorListaCoros = value;
    notifyListeners();
  }

  Future listarAllCoros(String? search) async {
    final _listAuxCoros = await DB.letrasMusicas(search);

    if (_listAuxCoros.isNotEmpty) {
      _errorListaCoros = true;
      _listAuxCoros.removeWhere((e) => e.tipo != 'coro');

      setListaCoros(_listAuxCoros);

      notifyListeners();
      return _listAuxCoros;
    }

    if (_listAuxCoros.isEmpty) {
      _errorListaCoros = false;
      notifyListeners();
      return null;
    }
  }

//==================================OBTENEMOS LA INFORMACION DEL CORO==========================================//
  LetraMusica? _getCoro;
  LetraMusica? get getInfoCoro => _getCoro;
  void getInfoDelCoro(LetraMusica? _coro) {
    _getCoro = _coro;
    _tipoCoro = _coro!.tipo;
    _tituloCoro = _coro.titulo;
    _letraCoro = _coro.letra;
    notifyListeners();
  }

//===================================CREAR HIMNO==========================================//
//=======================================================================================//

  Future crearHimno() async {
    await DB.insert(
        LetraMusica(tipo: 'himno', titulo: _tituloHimno, letra: _letraHimno));
    await listarAllHimnos('');
  }
//===================================ELIMINA COROS==========================================//

  Future eliminaHimno(LetraMusica _getHimno) async {
    await DB.delete(_getHimno);
    await listarAllHimnos('');
  }

//===================================EDITAR COROS==========================================//

  Future editarHimno() async {
    _getHimno!.titulo = _tituloHimno;
    _getHimno!.letra = _letraHimno;
    await DB.update(_getHimno!);
    await listarAllHimnos('');
  }

//===================================LISTA TODOS LOS HIMNOS==========================================//
  List<LetraMusica> _listaHimnos = [];
  List<LetraMusica> get getListaHimnos => _listaHimnos;

  void setListaHimnos(List<LetraMusica> _listHimno) {
    _listaHimnos = _listHimno;
    notifyListeners();
  }

  bool? _errorListaHimnos; // sera nulo la primera vez
  bool? get getErrorListaHimnos => _errorListaHimnos;
  set setErrorListaHimnos(bool? value) {
    _errorListaHimnos = value;
    notifyListeners();
  }

  Future listarAllHimnos(String? search) async {
    final _listAuxHimnos = await DB.letrasMusicas(search);

    if (_listAuxHimnos.isNotEmpty) {
      _errorListaHimnos = true;
      _listAuxHimnos.removeWhere((e) => e.tipo != 'himno');


      setListaHimnos(_listAuxHimnos);

      notifyListeners();
      return _listAuxHimnos;
    }
    if (_listAuxHimnos.isEmpty) {
      _errorListaHimnos = false;
      notifyListeners();
      return null;
    }
  }

//==================================OBTENEMOS LA INFORMACION DEL CORO==========================================//
  LetraMusica? _getHimno;
  LetraMusica? get getInfoHimno => _getHimno;
  void getInfoDelHimno(LetraMusica? _himno) {
    _getHimno = _himno;
    _tipoHimno = _himno!.tipo;
    _tituloHimno = _himno.titulo;
    _letraHimno = _himno.letra;
    notifyListeners();
  }
//=============================================================================//

//===================================CREAR ALABANZAS==========================================//
//=======================================================================================//

  Future crearAlabanza() async {
    await DB.insert(LetraMusica(
        tipo: 'alabanza', titulo: _tituloAlabanza, letra: _letraAlabanza));
    await listarAllAlabanzas('');
  }
//===================================ELIMINA ALABANZA==========================================//

  Future eliminaAlabanza(LetraMusica _getAlabanza) async {
    await DB.delete(_getAlabanza);
    await listarAllAlabanzas('');
  }

//===================================EDITAR ALABANZA==========================================//

  Future editarAlabanza() async {
    _getAlabanza!.titulo = _tituloAlabanza;
    _getAlabanza!.letra = _letraAlabanza;
    await DB.update(_getAlabanza!);
    await listarAllAlabanzas('');
  }

//===================================LISTA TODOS LAS ALABANZAS==========================================//
  List<LetraMusica> _listaAlabanzas = [];
  List<LetraMusica> get getListaAlabanzas => _listaAlabanzas;

  void setListaAlabanzas(List<LetraMusica> _listAlabanzas) {
    _listaAlabanzas = _listAlabanzas;
    notifyListeners();
  }

  bool? _errorListaAlabanzas; // sera nulo la primera vez
  bool? get getErrorListaAlabanzas => _errorListaAlabanzas;
  set setErrorListaAlabanzas(bool? value) {
    _errorListaAlabanzas = value;
    notifyListeners();
  }

  Future listarAllAlabanzas(String? search) async {
    final _listAuxAlabanzas = await DB.letrasMusicas(search);
    // _listAuxAlabanzas.removeWhere((e) => e.tipo != 'Alabanzas');

    if (_listAuxAlabanzas.isNotEmpty) {
      _errorListaAlabanzas = true;
      _listAuxAlabanzas.removeWhere((e) => e.tipo != 'alabanza');
      setListaAlabanzas(_listAuxAlabanzas);

      notifyListeners();
      return _listAuxAlabanzas;
    }

    if (_listAuxAlabanzas.isEmpty) {
      _errorListaAlabanzas = false;
      notifyListeners();
      return null;
    }
  }

//==================================OBTENEMOS LA INFORMACION DE LA ALABANZA==========================================//
  LetraMusica? _getAlabanza;
  LetraMusica? get getInfoAlabanza => _getAlabanza;
  void getInfoDelAlabanza(LetraMusica? _alabanza) {
    _getAlabanza = _alabanza;
    _tipoAlabanza = _alabanza!.tipo;
    _tituloAlabanza = _alabanza.titulo;
    _letraAlabanza = _alabanza.letra;
    notifyListeners();
  }

//===================================CREAR INFANTILES==========================================//
//=======================================================================================//

  Future crearInfantil() async {
    await DB.insert(LetraMusica(
        tipo: 'infantil', titulo: _tituloCoroNino, letra: _letraCoroNino));
    await listarAllInfantiles('');
  }
//===================================ELIMINA ALABANZA==========================================//

  Future eliminaInfantil(LetraMusica _getInfantil) async {
    await DB.delete(_getInfantil);
    await listarAllInfantiles('');
  }

//===================================EDITAR ALABANZA==========================================//

  Future editarInfantil() async {
    _getInfantil!.titulo = _tituloCoroNino;
    _getInfantil!.letra = _letraCoroNino;
    await DB.update(_getInfantil!);
    await listarAllInfantiles('');
  }

//===================================LISTA TODOS LAS ALABANZAS==========================================//
  List<LetraMusica> _listaInfantiles = [];
  List<LetraMusica> get getListaInfantiles => _listaInfantiles;

  void setListaInfantiles(List<LetraMusica> _listInfantiles) {
    _listaInfantiles = _listInfantiles;
    notifyListeners();
  }

  bool? _errorListaInfantiles; // sera nulo la primera vez
  bool? get getErrorListaInfantiles => _errorListaInfantiles;
  set setErrorListaInfantiles(bool? value) {
    _errorListaInfantiles = value;
    notifyListeners();
  }

  Future listarAllInfantiles(String? search) async {
    final _listAuxInfantiles = await DB.letrasMusicas(search);
   

    if (_listAuxInfantiles.isNotEmpty) {
      _errorListaInfantiles = true;
      _listAuxInfantiles.removeWhere((e) => e.tipo != 'infantil');
      setListaInfantiles(_listAuxInfantiles);

      notifyListeners();
      return _listAuxInfantiles;
    }

    if (_listAuxInfantiles.isEmpty) {
      _errorListaInfantiles = false;
      notifyListeners();
      return null;
    }
  }

//==================================OBTENEMOS LA INFORMACION DE LA ALABANZA==========================================//
  LetraMusica? _getInfantil;
  LetraMusica? get getInfoInfantil => _getInfantil;
  void getInfoDelInfantil(LetraMusica? _infantila) {
    _getInfantil = _infantila;
    _tipoInfantiles = _infantila!.tipo;
    _tituloCoroNino = _infantila.titulo;
    _letraCoroNino = _infantila.letra;
    notifyListeners();
  }

//============================================================================//
//================================= PETICION DE LA DATA  ===========================================//
//============================================================================//

  List<dynamic>? _listaAllData = [];
  // List<TipoMulta> get getListaTodosLosTiposDeMultas => _listaTodosLosTiposDeMultas;
  List<dynamic>? get getListaAllData => _listaAllData;

  void setListaAllData(List<dynamic>? data) {
    _listaAllData = [];
    _listaAllData = data;

    DB.insertAll(_listaAllData!);

    //
    notifyListeners();
  }

  bool? _errorListaAllData; // sera nulo la primera vez
  bool? get getErrorListaAllData => _errorListaAllData;
  set setErrorListaAllData(bool? value) {
    _errorListaAllData = value;
    notifyListeners();
  }

  Future getAllData() async {
    final response = await _api.getAllData();
    if (response != null) {
      _errorListaAllData = true;

      setListaAllData(response.data['data']);

      notifyListeners();
      return response;
    }
    if (response == null) {
      _errorListaAllData = false;
      notifyListeners();
      return null;
    }
  }

  //===================================LISTA TODOS LOS COROS==========================================//
  List? _listaParaGuardar = [];
  List? get getListaParaGuardar => _listaParaGuardar;

  void setListaParaGuardar(List? _lista) {
    for (var e in _lista!) {
      _listaParaGuardar!.addAll({
        {
          "genId": 0,
          "genTipo": e.tipo,
          "genTitulo": e.titulo,
          "genDescripcion": e.letra,
          "genFecReg": ""
        }
      });
    }
    notifyListeners();
  }

  bool? _errorListaParaGuardar; // sera nulo la primera vez
  bool? get getErrorListaParaGuardar => _errorListaParaGuardar;
  set setErrorListaParaGuardar(bool? value) {
    _errorListaParaGuardar = value;
    notifyListeners();
  }

  Future listarAllParaGuardar(String? search) async {
    final _listAuxParaGuardar = await DB.letrasMusicas(search);

    if (_listAuxParaGuardar.isNotEmpty) {
      _errorListaParaGuardar = true;
      setListaParaGuardar(_listAuxParaGuardar);

      notifyListeners();
      return _listAuxParaGuardar;
    }

    if (_listAuxParaGuardar.isEmpty) {
      _errorListaParaGuardar = false;
      notifyListeners();
      return null;
    }
  }

  //===================================SUBE LA DATA AL SERVIDOR==========================================//
  Future saveData() async {
  

  
    final response = await _api.saveAllData(_listaParaGuardar);


    if (response != null) {
      return response;
    }
    if (response == null) {
      return null;
    }
    notifyListeners();
    return null;
  }

  //===================================DELETA ALL INFO BASE LOCAL ==========================================//

  Future deleteAllLocal() async {
    DB.deleteAllTable();
  }

//===================================CREAR ALABANZAS==========================================//
//=======================================================================================//

  int? _pageCapitulo = 0;
  int? get getPageCapitulo => _pageCapitulo;

  Future setPageCapitulo(int? _item) async {
    _pageCapitulo = _item;

    notifyListeners();
  }

//===================TAMANIO DE LETRA==========================//

  double _btnSize = 2;
  double get getBtnSize => _btnSize;

  void setBtnSize(double _sizes) {
    _btnSize = _sizes;
    //
    notifyListeners();
  }

//==============CONTROLLE LECTURA TEXTO================//

  bool _action = false;
  bool get getAaction => _action;
  void setAction(bool _state) {
    _action = _state;

    notifyListeners();
  }
//==============CONTROLLE LECTURA TEXTO================//

  bool _textSelect = false;
  bool get getTextSelect => _textSelect;
  void setTextSelect(bool _state) {
    _textSelect = _state;
    print('_textSelect:$_textSelect');

    notifyListeners();
  }

//===================================LISTA TODOS OS FAVORITOS==========================================//
  List<Map<String, dynamic>> _listaFavoritos = [];
  List<Map<String, dynamic>> get getListaFavoritos => _listaFavoritos;

  void setListaFavoritos(List<Map<String, dynamic>> _likes) {
    // _listaFavoritos.addAll(_likes);
    notifyListeners();
  }

  Map<String, dynamic> _itemFavorito = {};
  Map<String, dynamic> get getItemFavorito => _itemFavorito;

  void setItemFavorito(Map<String, dynamic> _likes) async {
    _likes.removeWhere(
      (key, value) => key.contains('data'),
    );
    _listAuxFavoritos.removeWhere((e) => e['texto'] == _likes['texto']);
    // _listaFavoritos.add(_likes);
    _listAuxFavoritos.add(_likes);

    await Auth.instance.saveFavoritos(jsonEncode(_listAuxFavoritos));

    notifyListeners();
  }

  bool? _errorListaFavoritos; // sera nulo la primera vez
  bool? get getErrorListaFavoritos => _errorListaFavoritos;
  set setErrorListaFavoritos(bool? value) {
    _errorListaFavoritos = value;
    notifyListeners();
  }

//====================================================//
  void eliminaFavorito(String? _dato) async {
    _listAuxFavoritos.removeWhere((e) => e['texto'] == _dato);

    await Auth.instance.saveFavoritos(jsonEncode(_listAuxFavoritos));

    notifyListeners();
  }
//====================================================//

//******************************** VALIDA DATA DEL DISPOSITIVO ********************************** */
  List _listAuxFavoritos = [];
  List get getListAuxFavoritos => _listAuxFavoritos;

  void validaDataDispositivo() async {
    final infoFavoritosMovil = await Auth.instance.getFavoritos();

    if (infoFavoritosMovil != null) {
      _listAuxFavoritos = json.decode(infoFavoritosMovil);

      _errorListaFavoritos = true;

      notifyListeners();
    } else {}
  }
}

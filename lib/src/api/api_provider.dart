// import 'package:dio/dio.dart';
import 'dart:convert';
// import 'dart:js';


import 'package:dio/dio.dart';
import 'package:http/http.dart' as _http;
import 'package:ieanjesus/src/api/auth.dart';
import 'package:ieanjesus/src/models/letra_musica_model.dart';

class ApiProvider {
 final Dio _dio=Dio(BaseOptions(baseUrl:'https://ieanjesusbackend.neitor.com' ));




// //================================= RECUPERA DATA ==============================//
  Future getAllData() async {
    try {
      // final url =
      //     Uri.parse('https://ieanjesusbackend.neitor.com/api/general/filtro/0');

      // final dataResp = await _http.get(
      //   url,
      //   // headers: {"x-auth-token": '$token'},
      // );

final dataResp = await _dio.get('/api/general/filtro/0');


      if (dataResp.statusCode == 200) {
        // final responseData = jsonDecode(dataResp.body);
        // print('INFORMACION DATA   $responseData');
        // print('RESPONSE:DSDSD ${dataResp}');
        // print('si se ejecuta la accion ');
        return dataResp;
      }
      if (dataResp.statusCode == 401) {
        // Map<String, dynamic> message = jsonDecode(dataResp.body);
        // NotificatiosnService.showSnackBarError(message['msg']);
        return null;
      }
      if (dataResp.statusCode == 404) {
        return null;
      }
      if (dataResp.statusCode == 401) {
        //  Auth.instance.deleteSesion(context!);
        // Auth.instance.deleteIdRegistro();
        // Auth.instance.deleteTurnoSesion();
        return null;
      }
    } catch (e) {
      // snaks.NotificatiosnService.showSnackBarError("DATA INFO  1  ");
      // print('-ERROR -> $e');
      return null;
    }
  }

// //================================= GUARDA LA  DATA ==============================//
  Future saveAllData(List? _dataList) async {


    try {
  
    final dataResp = await _dio.post(
      '/api/general',
      data:
       _dataList

    );



      if (dataResp.statusCode == 200) {
        
        return dataResp;
      }
      if (dataResp.statusCode == 401) {
     
        return null;
      }
      if (dataResp.statusCode == 404) {
        return null;
      }
      if (dataResp.statusCode == 401) {
        
        return null;
      }
    } catch (e) {
     
      return null;
    }
  }

  //  Future<AuthResponse?> login({BuildContext? context,
  //   String? usuario,
  //   String? password,
  //   String? empresa,
  // }) async {
  //   try {
  //     final dataResp = await _http.post(
  //         Uri.parse('https://backsigeop.neitor.com/api/auth/login'),
  //         body: {"usuario": usuario, "password": password, "empresa": empresa});
  //     final respo = jsonDecode(dataResp.body);

  //   print('-OKkkkkkR->$respo');

  //     if (dataResp.statusCode == 404) {
  //       // print('-OKkkkkkR->$respo');
  //       snaks.NotificatiosnService.showSnackBarDanger("${respo["msg"]}");
  //       return null;
  //     }
  //     if (dataResp.statusCode == 200) {
  //       // snaks.NotificatiosnService.showSnackBarDanger("${respo["msg"]}");
  //       final responsData = AuthResponse.fromMap(respo);
  //       return responsData;
  //     }
  //     if (dataResp.statusCode == 401) {
  //        Auth.instance.deleteSesion(context!);
  //                 // Auth.instance.deleteIdRegistro();
  //                 // Auth.instance.deleteTurnoSesion();
  //       return null;
  //     }
  //   } catch (e) {
  //     // snaks.NotificatiosnService.showSnackBarError("SIN RESPUESTA");
  //     // return null;
  //   }
  // }
}
// //================================= LOGIN ==============================//
  // Future<Auth?> loginApp(
  //   String? usuario,
  //   String? clave,
   
  // ) async {
  //   try {
  //     // final dataResp = await _http.post(
  //     //     Uri.parse('https://backsigeop.neitor.com/api/auth/login'),
  //     //     body: {"usuario": usuario, "password": password, "empresa": empresa});
  //     // final respo = jsonDecode(dataResp.body);

  //   // print('-OKkkkkkR->$respo');

  //     // if (dataResp.statusCode == 404) {
  //     //   // print('-OKkkkkkR->$respo');
  //     //   snaks.NotificatiosnService.showSnackBarDanger("${respo["msg"]}");
  //     //   return null;
  //     // }
  //     // if (dataResp.statusCode == 200) {
  //     //   // snaks.NotificatiosnService.showSnackBarDanger("${respo["msg"]}");
  //     //   final responsData = AuthResponse.fromMap(respo);
  //     //   return responsData;
  //     // }
  //     // if (dataResp.statusCode == 401) {
  //     //   //  Auth.instance.deleteSesion(context!);
  //     //             // Auth.instance.deleteIdRegistro();
  //     //             // Auth.instance.deleteTurnoSesion();
  //     //   return null;
  //     // }

  //       return null;

  //   } catch (e) {
  //     // snaks.NotificatiosnService.showSnackBarError("SIN RESPUESTA");
  //     return null;
  //   }
  // }

// //================================= RECUPERA CLAVE ==============================//
//   Future recuperaClave({BuildContext? context,
//     String? usuario,
//     String? empresa,
//   }) async {
//     try {
//       final dataResp = await _http.post(
//           Uri.parse('https://backsigeop.neitor.com/api/auth/password'),
//           body: {"usuario": usuario, "empresa": empresa});
//       final respo = jsonDecode(dataResp.body);
//       if (dataResp.statusCode == 404) {
//         // print('-OKkkkkkR->$respo');
//         // snaks.NotificatiosnService.showSnackBarDanger("${respo["msg"]}");
//         return null;
//       }
//       if (dataResp.statusCode == 200) {
//         // final responsData = AuthResponse.fromMap(respo);
//         //  NotificatiosnService.showSnackBarDanger("${respo["msg"]}");
//         return respo;
//       }
//       if (dataResp.statusCode == 401) {
//          Auth.instance.deleteSesion(context!);
//                   // Auth.instance.deleteIdRegistro();
//                   // Auth.instance.deleteTurnoSesion();
//         return null;
//       }
//     } catch (e) {
//       // snaks.NotificatiosnService.showSnackBarError("SIN RESPUESTA");
//       // return null;
//     }
//   }

//   //=========================GET ALL COMUNICADOS CLIENTES =====================================//
//   Future<AllCumunicadosClientes?> getAllComunicadosClientes({
//     BuildContext? context,
//     int? cantidad,
//     int? page,
//     String? search,
//     String? input,
//     bool? orden,
//     String? datos,
//     String? rucempresa,
//     String? token,
//   }) async {
//     try {
    
//       final url = Uri.parse(
//           'https://backsigeop.neitor.com/api/comunicados?cantidad=$cantidad&page=$page&search=$search&input=$input&orden=$orden&datos=$datos&rucempresa=$rucempresa');

//       final dataResp = await _http.get(
//         url,
//         headers: {"x-auth-token": '$token'},
//       );

//       if (dataResp.statusCode == 200) {
//         final responseData = AllCumunicadosClientes.fromJson(dataResp.body);
//         // print('-COMUNICADOS->${responseData}');

//         return responseData;
//       }

//       if (dataResp.statusCode == 404) {
//         return null;
//       }
//       if (dataResp.statusCode == 401) {
//          Auth.instance.deleteSesion(context!);
//                   // Auth.instance.deleteIdRegistro();
//                   // Auth.instance.deleteTurnoSesion();
//         return null;
//       }
//     } catch (e) {
//       // snaks.NotificatiosnService.showSnackBarError("DATA INFO  1  ");
//       // print('-ERROR -> $e');
//       return null;
//     }
//   }
//   //=========================GET ALL COMUNICADOS CLIENTES =====================================//
//   Future getAllComunicados({
//     BuildContext? context,
//     // int? cantidad,
//     // int? page,
//     // String? search,
//     // String? input,
//     // bool? orden,
//     // String? datos,
//     // String? rucempresa,
//     String? token,
//      String? search,
//     String? notificacion,
//   }) async {
//     try {
    
//       final url = Uri.parse(
//           'https://backsigeop.neitor.com/api/avisos/filtro/0?&search=$search&notificacion=$notificacion');

//       final dataResp = await _http.get(
//         url,
//         headers: {"x-auth-token": '$token'},
//       );
//  final respo = jsonDecode(dataResp.body);
//       if (dataResp.statusCode == 200) {
//         // final responseData = AllCumunicadosClientes.fromJson(dataResp.body);
//         // print('-COMUNICADOS->${respo}');

//         return respo;
//       }

//       if (dataResp.statusCode == 404) {
//         return null;
//       }
//       if (dataResp.statusCode == 401) {
//          Auth.instance.deleteSesion(context!);
//                   // Auth.instance.deleteIdRegistro();
//                   // Auth.instance.deleteTurnoSesion();
//         return null;
//       }
//     } catch (e) {
//       // snaks.NotificatiosnService.showSnackBarError("SIN 2  ");
//       return null;
//     }
//   }

//   //=========================GET ALL NOVEDADES GUARDIAS =====================================//
//   Future<AllNovedadesGuardia?> getAllMultasGuardias({
//     BuildContext? context,
//     // int? cantidad,
//     // int? page,
//     String? search,
//     String? notificacion,
//     // String? input,
//     // bool? orden,
//     // String? datos,
//     // String? rucempresa,
//     String? token,
//   }) async {
//     try {
//       final url = Uri.parse(
//           // 'https://backsigeop.neitor.com/api/nominanovedades?cantidad=$cantidad&page=$page&search=$search&input=$input&orden=$orden&datos=$datos&rucempresa=$rucempresa');
//           'https://backsigeop.neitor.com/api/nominanovedades/filtro/0?search=$search&notificacion=$notificacion');

//       final dataResp = await _http.get(
//         url,
//         headers: {"x-auth-token": '$token'},
//       );
//       // print('si :${dataResp.body}');
//       if (dataResp.body.isEmpty) {
// // print('RESPONSE: ${dataResp.body}');
//         return null;
//       }
//       if (dataResp.statusCode == 200) {
//         final responseData = AllNovedadesGuardia.fromJson(dataResp.body);
//         return responseData;
//       }
//       if (dataResp.statusCode == 404) {
        
//         return null;
//       }
//       if (dataResp.statusCode == 401) {
//           //  snaks.NotificatiosnService.showSnackBarDanger("${dataResp.body}");
//            snaks.NotificatiosnService.showSnackBarDanger("Debe inciar sesión nuevamente");
//         //  Auth.instance.deleteSesion(context!);
//                   // Auth.instance.deleteIdRegistro();
//                   // Auth.instance.deleteTurnoSesion();
//         return null;
//       }
//     } catch (e) {
//       // snaks.NotificatiosnService.showSnackBarError("SIN 3 ");
//       return null;
//     }
//   }

//   //=========================GET ALL CLIENTE MULTAS GUALDIAS =====================================//
//   // Future<AllClientes?> getAllClientesMultas({
//   Future getAllClientesMultas({
//     BuildContext? context,
//     // int? cantidad,
//     // int? page,
//     String? search,
//     // String? input,
//     // bool? orden,
//     // String? datos,
//     // String? rucempresa,
//     String? estado,
//     String? token,
//   }) async {
//     // print('$cantidad');
//     // print('$page');
//     // print('$search');
//     // // print('$input');
//     // // print('$datos');
//     // // print('$rucempresa');
//     // print('$estado');
//     // print('$token');

//     try {
//       final url = Uri.parse(
//           //  'https://backsigeop.neitor.com/api/clientes?cantidad=$cantidad&page=$page&search=$search&input=$input&orden=$orden&datos=$datos&rucempresa=$rucempresa&perfil=$perfil');
//           'https://backsigeop.neitor.com/api/clientes/filtro/0?search=$search&estado=$estado');

//       final dataResp = await _http.get(
//         url,
//         headers: {"x-auth-token": '$token'},
//       );
//        final respo = jsonDecode(dataResp.body);
// // print('SIIIII cliente multas : ${dataResp.body}');
// // print('SIIIII cliente multas : ${dataResp.body.runtimeType}');
//       if (dataResp.statusCode == 200) {
//         // final responseData = AllClientes.fromJson(dataResp.body);
//         // final responseData = AllClientes.fromJson(dataResp.body);
//         // print('SIIIII cliente  : ${respo}');
//         return respo;
//       }
//       if (dataResp.statusCode == 404) {
//         return null;
//       }
//       if (dataResp.statusCode == 401) {
//          Auth.instance.deleteSesion(context!);
//                   // Auth.instance.deleteIdRegistro();
//                   // Auth.instance.deleteTurnoSesion();
//         return null;
//       }
//     } catch (e) {
//       // snaks.NotificatiosnService.showSnackBarError("SIN 4 ");
//       return null;
//     }
//   }
//   //=========================GET ALL CLIENTE MULTAS GUALDIAS =====================================//
//   // Future<AllClientes?> getAllClientesMultas({
//   Future getAllPuestosClientes({
//     BuildContext? context,
//     // int? cantidad,
//     // int? page,
//     String? search,
//     // String? input,
//     // bool? orden,
//     // String? datos,
//     // String? rucempresa,
//     String? estado,
//     String? token,
//   }) async {
//     // print('$cantidad');
//     // print('$page');
//     // print('$search');
//     // // print('$input');
//     // // print('$datos');
//     // // print('$rucempresa');
//     // print('$estado');
//     // print('$token');

//     try {
//       final url = Uri.parse(
//           //  'https://backsigeop.neitor.com/api/clientes?cantidad=$cantidad&page=$page&search=$search&input=$input&orden=$orden&datos=$datos&rucempresa=$rucempresa&perfil=$perfil');
//           'https://backsigeop.neitor.com/api/clientes/filtro/0?search=$search&estado=$estado');

//       final dataResp = await _http.get(
//         url,
//         headers: {"x-auth-token": '$token'},
//       );
//        final respo = jsonDecode(dataResp.body);
// // print('SIIIII cliente multas : ${dataResp.body}');
// // print('SIIIII cliente multas : ${dataResp.body.runtimeType}');
//       if (dataResp.statusCode == 200) {
//         // final responseData = AllClientes.fromJson(dataResp.body);
//         // final responseData = AllClientes.fromJson(dataResp.body);
//         // print('SIIIII cliente  : ${respo}');
//         return respo;
//       }
//       if (dataResp.statusCode == 404) {
//         return null;
//       }
//       if (dataResp.statusCode == 401) {
//          Auth.instance.deleteSesion(context!);
//                   // Auth.instance.deleteIdRegistro();
//                   // Auth.instance.deleteTurnoSesion();
//         return null;
//       }
//     } catch (e) {
//       // snaks.NotificatiosnService.showSnackBarError("SIN 4 ");
//       return null;
//     }
//   }

//   //=========================GET ALL CLIENTE MULTAS GUALDIAS =====================================//
//   Future<AllClientes?> getAllClientes({
//     BuildContext? context,
//     // int? cantidad,
//     // int? page,
//     String? search,
//     // String? input,
//     // bool? orden,
//     // String? datos,
//     // String? rucempresa,
//     String? estado,
//     String? token,
//   }) async {
//     // print('$cantidad');
//     // print('$page');
//     // print('$search');
//     // // print('$input');
//     // // print('$datos');
//     // // print('$rucempresa');
//     // print('$estado');
//     // print('$token');

//     try {
//       final url = Uri.parse(
//           //  'https://backsigeop.neitor.com/api/clientes?cantidad=$cantidad&page=$page&search=$search&input=$input&orden=$orden&datos=$datos&rucempresa=$rucempresa&perfil=$perfil');
//           'https://backsigeop.neitor.com/api/clientes/filtro/0?search=$search&estado=$estado');

//       final dataResp = await _http.get(
//         url,
//         headers: {"x-auth-token": '$token'},
//       );
// // print('SIIIII cliente multas : ${dataResp.body}');
// // print('SIIIII cliente multas : ${dataResp.body.runtimeType}');
//       if (dataResp.statusCode == 200) {
//         final responseData = AllClientes.fromJson(dataResp.body);
//         // print('SIIIII cliente multas : ${responseData.data[0].cliNombreComercial}');
//         return responseData;
//       }
//       if (dataResp.statusCode == 404) {
//         return null;
//       }
//       if (dataResp.statusCode == 401) {
//          Auth.instance.deleteSesion(context!);
//                   // Auth.instance.deleteIdRegistro();
//                   // Auth.instance.deleteTurnoSesion();
//         return null;
//       }
//     } catch (e) {
//       // snaks.NotificatiosnService.showSnackBarError("SIN 5 ");
//       return null;
//     }
//   }

//   //=========================GET ALL CLIENTE PEDIDOS-DISTRIBUCION =====================================//
//   Future<AllClientePedido?> getAllClientesPedidos({
//     BuildContext? context,
//     // int? cantidad,
//     // int? page,
//     String? search,
//     // String? input,
//     // bool? orden,
//     // String? datos,
//     // String? rucempresa,
//     String? tipo,
//     String? token,
//   }) async {
//     // print('$cantidad');
//     // print('$page');
//     // print('$search');
//     // // print('$input');
//     // // print('$datos');
//     // // print('$rucempresa');
//     // print('$estado');
//     // print('$token');

//     try {
//       final url = Uri.parse(
//           //  'https://backsigeop.neitor.com/api/clientes?cantidad=$cantidad&page=$page&search=$search&input=$input&orden=$orden&datos=$datos&rucempresa=$rucempresa&perfil=$perfil');
//           'https://backsigeop.neitor.com/api/clientes/filtro/0?search=$search&estado=$tipo');

//       final dataResp = await _http.get(
//         url,
//         headers: {"x-auth-token": '$token'},
//       );
// // print('SIIIII cliente multas : ${dataResp.body}');
// // print('SIIIII cliente multas : ${dataResp.body.runtimeType}');
//       if (dataResp.statusCode == 200) {
//         final responseData = AllClientePedido.fromJson(dataResp.body);
//         // print('SIIIII cliente multas : ${responseData.data[0].cliNombreComercial}');
//         return responseData;
//       }
//       if (dataResp.statusCode == 404) {
//         return null;
//       }
//       if (dataResp.statusCode == 401) {
//          Auth.instance.deleteSesion(context!);
//                   // Auth.instance.deleteIdRegistro();
//                   // Auth.instance.deleteTurnoSesion();
//         return null;
//       }
//     } catch (e) {
//       // snaks.NotificatiosnService.showSnackBarError("SIN 6 ");
//       return null;
//     }
//   }

//   //=========================GET ALL CLIENTE DISTRIBUCION =====================================//
//   Future<AllGuardiasPedido?> getAllGuardiasPedido({
//     BuildContext? context,
//     String? search,
//     String? docnumero,
//     String? token,
//   }) async {
//     try {
//       final url = Uri.parse(
//           //  'https://backsigeop.neitor.com/api/clientes?cantidad=$cantidad&page=$page&search=$search&input=$input&orden=$orden&datos=$datos&rucempresa=$rucempresa&perfil=$perfil');
//           // 'https://backsigeop.neitor.com/api/distribucion/filtro/0?search=$search&tipo=$tipo');
//           'https://backsigeop.neitor.com/api/personas/listado/0?docnumero=$docnumero&search=$search');

//       final dataResp = await _http.get(
//         url,
//         headers: {"x-auth-token": '$token'},
//       );
//       // print('SIIIII GUARDIA : ${dataResp}');

//       if (dataResp.statusCode == 200) {
//         // final response = jsonDecode(dataResp.body);
//         // print('SIIIII cliente 200 : ${dataResp}');
//         final response = AllGuardiasPedido.fromJson(dataResp.body);

//         return response;
//       }
//       if (dataResp.statusCode == 404) {
//         return null;
//       }
//       if (dataResp.statusCode == 401) {
//          Auth.instance.deleteSesion(context!);
//                   // Auth.instance.deleteIdRegistro();
//                   // Auth.instance.deleteTurnoSesion();
//         return null;
//       }
//     } catch (e) {
//       // snaks.NotificatiosnService.showSnackBarError("SIN 7 ");
//       return null;
//     }
//   }

//   //=========================GET ALL TIPOS DE MULTAS GUARDIAS =====================================//
//   Future<AllTiposMultasGuardias?> getAllTiposMultasGuardias({
//     BuildContext? context,
//     String? search,
//     String? token,
//   }) async {
//     try {
//       final url = Uri.parse(
//           'https://backsigeop.neitor.com/api/novedades/filtro/0?search=$search');

//       final dataResp = await _http.get(
//         url,
//         headers: {"x-auth-token": '$token'},
//       );
//       // print('-TIPOS MULTAS->${dataResp.body}');
//       if (dataResp.statusCode == 200) {
//         final responseData = AllTiposMultasGuardias.fromJson(dataResp.body);
//         //  print('-TIPOS MULTAS->${responseData.data}');
//         return responseData;
//       }
//       if (dataResp.statusCode == 404) {
//         return null;
//       }
//       if (dataResp.statusCode == 401) {
//          Auth.instance.deleteSesion(context!);
//                   // Auth.instance.deleteIdRegistro();
//                   // Auth.instance.deleteTurnoSesion();
//         return null;
//       }
//     } catch (e) {
//       // snaks.NotificatiosnService.showSnackBarError("SIN 8  ");
//       return null;
//     }
//   }

//   // //=========================GET ALL TIPOS DE MULTAS GUARDIAS =====================================//
//   // Future<GetInfoGuardiaMulta?> getAllInfoGuardiaMultas({

//   //   String? search,

//   //   String? token,
//   // }) async {
//   //   try {

//   //     final url = Uri.parse(
//   //         'https://backsigeop.neitor.com/api/personas/listado/0?search=$search');

//   //     final dataResp = await _http.get(
//   //       url,
//   //       headers: {"x-auth-token": '$token'},
//   //     );
//   // // print('-INFO GUARDIA->${dataResp.body}');
//   //     if (dataResp.statusCode == 200) {
//   //       final responseData = GetInfoGuardiaMulta.fromJson(dataResp.body);
//   //       //  print('-persona S->${responseData.data}');
//   //       return responseData;
//   //     }
//   //     if (dataResp.statusCode == 404) {
//   //       return null;
//   //     }
//   //   } catch (e) {
//       // snaks.NotificatiosnService.showSnackBarError("SIN RESPUESTA ");
//   //     return null;
//   //   }
//   // }
//   //=========================GET ALL TIPOS DE MULTAS GUARDIAS =====================================//
//   Future<AllGuardias?> getAllInfoGuardias({
//     BuildContext? context,
//     String? search,
//     String? docnumero,
//     String? token,
//   }) async {
//     try {
//       final url = Uri.parse(
//           // 'https://backsigeop.neitor.com/api/personas/filtro/0?search=$search&estado=$estado');
//           'https://backsigeop.neitor.com/api/personas/listado/0?docnumero=$docnumero&search=$search');

//       final dataResp = await _http.get(
//         url,
//         headers: {"x-auth-token": '$token'},
//       );

//       if (dataResp.body.isEmpty) {
//         return null;
// // print('RESPONSE: ${dataResp.body}');
//       }
//       if (dataResp.statusCode == 200) {
// // print('RESPONSE: ${dataResp.body}');

//         final responseData = AllGuardias.fromJson(dataResp.body);

//         return responseData;
//       }
//       if (dataResp.statusCode == 404) {
//         return null;
//       }
//       if (dataResp.statusCode == 401) {
//          Auth.instance.deleteSesion(context!);
//                   // Auth.instance.deleteIdRegistro();
//                   // Auth.instance.deleteTurnoSesion();
//         return null;
//       }
//     } catch (e) {
//       // NotificatiosnService.showSnackBarError("SIN 9 ");
//       return null;
//     }
//   }
//   Future getAllInfoGuardiasConsignas({
//     BuildContext? context,
//     String? search,
//     String? docnumero,
//     String? token,
//   }) async {
//     try {
//       final url = Uri.parse(
//           // 'https://backsigeop.neitor.com/api/personas/filtro/0?search=$search&estado=$estado');
//           'https://backsigeop.neitor.com/api/personas/listado/0?docnumero=$docnumero&search=$search');
        

//       final dataResp = await _http.get(
//         url,
//         headers: {"x-auth-token": '$token'},
//       );

//          if (dataResp.body.isEmpty) {
//         return null;
//       }
//       // print('RESPONSE:DSDSD ${dataResp.body}');
//       if (dataResp.statusCode == 200) {
//         final responseData = jsonDecode(dataResp.body);
//         // print('INFORMACION DATA GUARDIA  $responseData');
//         // print('RESPONSE:DSDSD ${dataResp.body}');
//         // print('si se ejecuta la accion ');
//         return responseData;
//       }
//       if (dataResp.statusCode == 401) {
//         Map<String, dynamic> message = jsonDecode(dataResp.body);
//         NotificatiosnService.showSnackBarError(message['msg']);
//         return null;
//       }
//       if (dataResp.statusCode == 404) {
//         return null;
//       }
//       if (dataResp.statusCode == 401) {
//          Auth.instance.deleteSesion(context!);
//                   // Auth.instance.deleteIdRegistro();
//                   // Auth.instance.deleteTurnoSesion();
//         return null;
//       }
//     } catch (e) {
//       // NotificatiosnService.showSnackBarError("SIN 9 ");
//       return null;
//     }
//   }

//   //=========================GET ALL TIPOS DE MULTAS GUARDIAS =====================================//
//   Future<AllImplementoPedido?> getAllImplementoPedido({
//     BuildContext? context,
//     String? search,
//     String? token,
//   }) async {
//     try {
//       final url = Uri.parse(
//           'https://backsigeop.neitor.com/api/inventario/filtro/0?search=$search');

//       final dataResp = await _http.get(
//         url,
//         headers: {"x-auth-token": '$token'},
//       );

//       if (dataResp.body.isEmpty) {
//         return null;
// // print('RESPONSE: ${dataResp.body}');
//       }
//       if (dataResp.statusCode == 200) {
// // print('RESPONSE: ${dataResp.body}');

//         final responseData = AllImplementoPedido.fromJson(dataResp.body);

//         return responseData;
//       }
//       if (dataResp.statusCode == 404) {
//         return null;
//       }
//       if (dataResp.statusCode == 401) {
//          Auth.instance.deleteSesion(context!);
//                   // Auth.instance.deleteIdRegistro();
//                   // Auth.instance.deleteTurnoSesion();
//         return null;
//       }
//     } catch (e) {
//       // NotificatiosnService.showSnackBarError("SIN 10 ");
//       return null;
//     }
//   }

//   //=========================GET ALL INFORMES DE LOS  GUARDIAS =====================================//
// //   Future<AllInformesGuardias?> getAllInformesGuardia({
// //     String? search,
// //     String? token,
// //   }) async {
// //     try {
// //       final url = Uri.parse(
// //           'https://backsigeop.neitor.com/api/informes/filtro/0?search=$search');

// //       final dataResp = await _http.get(
// //         url,
// //         headers: {"x-auth-token": '$token'},
// //       );

// //       if (dataResp.body.isEmpty) {
// //         return null;
// //       }
// //       // print('RESPONSE:DSDSD ${dataResp.body}');
// //       if (dataResp.statusCode == 200) {
// // print('RESPONSE:asas ${dataResp.body}');
// // // print('RESPONSE:DSDSD ${dataResp.body}');
// //         final responseData = AllInformesGuardias.fromJson(dataResp.body);

// //         return responseData;
// //       }
// //       if (dataResp.statusCode == 404) {
// //         return null;
// //       }
// // if (dataResp.statusCode == 401) {
// //         //  Auth.instance.deleteSesion(context);
// //                   Auth.instance.deleteIdRegistro();
// //                   Auth.instance.deleteTurnoSesion();
// //         return null;
// //       }
// //     } catch (e) {
// //       // NotificatiosnService.showSnackBarError("SIN RESPUESTA sss");
// //       return null;
// //     }
// //   }
//   Future getAllInformesGuardia({
//     BuildContext? context,
//     String? search,
//         String? notificacion,
//     String? token,
//   }) async {
//     try {
//       final url = Uri.parse(
//           'https://backsigeop.neitor.com/api/informes/filtro/0?search=$search&notificacion=$notificacion');

//       final dataResp = await _http.get(
//         url,
//         headers: {"x-auth-token": '$token'},
//       );

//       if (dataResp.body.isEmpty) {
//         return null;
//       }
//       // print('RESPONSE:DSDSD ${dataResp.body}');
//       if (dataResp.statusCode == 200) {
//         final responseData = jsonDecode(dataResp.body);
//         // print('INFORMACION DATA GUARDIA  $responseData');
//         // print('RESPONSE:DSDSD ${dataResp.body}');
//         // print('si se ejecuta la accion ');
//         return responseData;
//       }
//       if (dataResp.statusCode == 401) {
//         Map<String, dynamic> message = jsonDecode(dataResp.body);
//         NotificatiosnService.showSnackBarError(message['msg']);
//         return null;
//       }
//       if (dataResp.statusCode == 404) {
//         return null;
//       }
//       if (dataResp.statusCode == 401) {
//          Auth.instance.deleteSesion(context!);
//                   // Auth.instance.deleteIdRegistro();
//                   // Auth.instance.deleteTurnoSesion();
//         return null;
//       }
//     } catch (e) {
//       // NotificatiosnService.showSnackBarError("SIN 11 ");
//       return null;
//     }
//   }

//   //=========================GET ALL GUARDIAS =====================================//
//   Future getAllGuardias({
//     BuildContext? context,
//     String? search,
//     String? estado,
//     String? token,
//   }) async {
//     try {
//       final url = Uri.parse(
//           'https://backsigeop.neitor.com/api/personas/filtro/0?search=$search&estado=$estado');

//       final dataResp = await _http.get(
//         url,
//         headers: {"x-auth-token": '$token'},
//       );

//       if (dataResp.body.isEmpty) {
//         return null;
//       }

//       if (dataResp.statusCode == 200) {
//         final responseData = jsonDecode(dataResp.body);
//         return responseData;
//       }
//       if (dataResp.statusCode == 404) {
//         return null;
//       }
//       if (dataResp.statusCode == 401) {
//          Auth.instance.deleteSesion(context!);
//                   // Auth.instance.deleteIdRegistro();
//                   // Auth.instance.deleteTurnoSesion();
//         return null;
//       }
//     } catch (e) {
//       // NotificatiosnService.showSnackBarError("SIN 12 ");
//       return null;
//     }
//   }
//   //=========================GET ALL GUARDIAS =====================================//
//   Future getAllGuardiasPorCliente({
//     String? search,
//     // String? estado,
//     String? docnumero,
//     String? token,
//   }) async {
//     try {
//       final url = Uri.parse(
//           'https://backsigeop.neitor.com/api/personas/listado/0?docnumero=$docnumero');

//       final dataResp = await _http.get(
//         url,
//         headers: {"x-auth-token": '$token'},
//       );

//       if (dataResp.body.isEmpty) {
//         return null;
//       }

//       if (dataResp.statusCode == 200) {
//         final responseData = jsonDecode(dataResp.body);
//         // print(responseData);
//         return responseData;
//       }
//       if (dataResp.statusCode == 404) {
//         return null;
//       }
//       if (dataResp.statusCode == 401) {
//         //  Auth.instance.deleteSesion(context);
//                   // Auth.instance.deleteIdRegistro();
//                   // Auth.instance.deleteTurnoSesion();
//         return null;
//       }
//     } catch (e) {
//       // NotificatiosnService.showSnackBarError("SIN 13 ");
//       return null;
//     }
//   }

//   //=========================GET INFO GUARDIA QR =====================================//
//   Future getGuardiaQR({
//     BuildContext? context,
//     String? codigoQR,
//     String? token,
//   }) async {
//     try {
//       final url = Uri.parse(
//           'https://backsigeop.neitor.com/api/personas/$codigoQR?tipo=QR');

//       final dataResp = await _http.get(
//         url,
//         headers: {"x-auth-token": '$token'},
//       );

//       if (dataResp.body.isEmpty) {
//         return null;
//       }

//       if (dataResp.statusCode == 200) {
//         final responseData = jsonDecode(dataResp.body);
//         // print('INFORMACION DATA GUARDIA QR $responseData');
//         return responseData;
//       }
//       if (dataResp.statusCode == 404) {
//         return null;
//       }
//       if (dataResp.statusCode == 401) {
//          Auth.instance.deleteSesion(context!);
//                   // Auth.instance.deleteIdRegistro();
//                   // Auth.instance.deleteTurnoSesion();
//         return null;
//       }
//     } catch (e) {
//       // NotificatiosnService.showSnackBarError("SIN 14 ");
//       return null;
//     }
//   }

//   //=========================GET INFO GUARDIA QR =====================================//
//   Future getClienteQR({
//     BuildContext? context,
//     String? codigoQR,
//     String? token,
//   }) async {
//     try {
//       final url = Uri.parse(
//           'https://backsigeop.neitor.com/api/clientes/$codigoQR?tipo=QR');

//       final dataResp = await _http.get(
//         url,
//         headers: {"x-auth-token": '$token'},
//       );

//       if (dataResp.body.isEmpty) {
//         return null;
//       }

//       if (dataResp.statusCode == 200) {
//         final responseData = jsonDecode(dataResp.body);
//         // print('INFORMACION DATA CLIENTE QR $responseData');
//         return responseData;
//       }
//       if (dataResp.statusCode == 404) {
//         return null;
//       }
//       if (dataResp.statusCode == 401) {
//          Auth.instance.deleteSesion(context!);
//                   // Auth.instance.deleteIdRegistro();
//                   // Auth.instance.deleteTurnoSesion();
//         return null;
//       }
//     } catch (e) {
//       // NotificatiosnService.showSnackBarError("SIN 15 ");
//       return null;
//     }
//   }

//   //=========================GET ALL INFORMES DE LOS  GUARDIAS =====================================//
//   Future getAllAvisosSalida({
//     BuildContext? context,
//     String? search,
//     String? token,
//   }) async {
//     try {
//       final url = Uri.parse(
//           'https://backsigeop.neitor.com/api/avisosalidas/filtro/0?search=$search');

//       final dataResp = await _http.get(
//         url,
//         headers: {"x-auth-token": '$token'},
//       );

//       if (dataResp.body.isEmpty) {
//         return null;
//       }
//       // print('RESPONSE:AVISOSALIDA ${dataResp.body}');
//       if (dataResp.statusCode == 200) {
// // print('RESPONSE: ${dataResp.body}');
// // print('RESPONSE:DSDSD ${dataResp.body}');
//         // final responseData = AllInformesGuardias.fromJson(dataResp.body);

//         final responseData = jsonDecode(dataResp.body);
//         return responseData;
//       }
//       if (dataResp.statusCode == 404) {
//         return null;
//       }
//       if (dataResp.statusCode == 401) {
//          Auth.instance.deleteSesion(context!);
//                   // Auth.instance.deleteIdRegistro();
//                   // Auth.instance.deleteTurnoSesion();
//         return null;
//       }
//     } catch (e) {
//       // NotificatiosnService.showSnackBarError("SIN 16 ");
//       return null;
//     }
//   }

//   //=========================GET ALL INFORMES DE LOS  GUARDIAS =====================================//
//   Future getAllCambioPuesto({
//     BuildContext? context,
//     String? search,
//     String? notificacion,
//     String? token,
//   }) async {
//     try {
//       final url = Uri.parse(
//           'https://backsigeop.neitor.com/api/cambiopuesto/filtro/0?search=$search&notificacion=$notificacion');

//       final dataResp = await _http.get(
//         url,
//         headers: {"x-auth-token": '$token'},
//       );

//       if (dataResp.body.isEmpty) {
//         return null;
//       }
//       // print('RESPONSE:AVISOSALIDA ${dataResp.body}');
//       if (dataResp.statusCode == 200) {
// // print('RESPONSE: ${dataResp.body}');
// // print('RESPONSE:DSDSD ${dataResp.body}');
//         // final responseData = AllInformesGuardias.fromJson(dataResp.body);

//         final responseData = jsonDecode(dataResp.body);
//         //  print('$responseData');
//         return responseData;
//       }
//       if (dataResp.statusCode == 404) {
//         return null;
//       }
//       if (dataResp.statusCode == 401) {
//          Auth.instance.deleteSesion(context!);
//                   // Auth.instance.deleteIdRegistro();
//                   // Auth.instance.deleteTurnoSesion();
//         return null;
//       }
//     } catch (e) {
//       // NotificatiosnService.showSnackBarError("SIN 17 ");
//       return null;
//     }
//   }

//   //=========================GET ALL INFORMES DE LOS  GUARDIAS =====================================//
//   Future getAllAusencias({
//     BuildContext? context,
//     String? search,
//     String? notificacion,
//     String? token,
//   }) async {
//     try {
//       final url = Uri.parse(
//           'https://backsigeop.neitor.com/api/ausencias/filtro/0?search=$search&notificacion=$notificacion');

//       final dataResp = await _http.get(
//         url,
//         headers: {"x-auth-token": '$token'},
//       );

//       if (dataResp.body.isEmpty) {
//         return null;
//       }
//       // print('RESPONSE:AVISOSALIDA ${dataResp.body}');
//       if (dataResp.statusCode == 200) {
// // print('RESPONSE: ${dataResp.body}');
// // print('RESPONSE:DSDSD ${dataResp.body}');
//         // final responseData = AllInformesGuardias.fromJson(dataResp.body);

//         final responseData = jsonDecode(dataResp.body);
//         return responseData;
//       }
//       if (dataResp.statusCode == 404) {
//         return null;
//       }
//       if (dataResp.statusCode == 401) {
//          Auth.instance.deleteSesion(context!);
//                   // Auth.instance.deleteIdRegistro();
//                   // Auth.instance.deleteTurnoSesion();
//         return null;
//       }
//     } catch (e) {
//       // NotificatiosnService.showSnackBarError("SIN 18 ");
//       return null;
//     }
//   }

//   //=========================GET ALL TURNOS EXTRAS =====================================//
//   Future getAllTurnosExtras({
//     BuildContext? context,
//     String? search,
//     String? token,
//   }) async {
//     try {
//       final url = Uri.parse(
//           'https://backsigeop.neitor.com/api/turnoextra/filtro/0?search=$search');

//       final dataResp = await _http.get(
//         url,
//         headers: {"x-auth-token": '$token'},
//       );

//       if (dataResp.body.isEmpty) {
//         return null;
//       }
//       // print('RESPONSE:AVISOSALIDA ${dataResp.body}');
//       if (dataResp.statusCode == 200) {
// // print('RESPONSE: ${dataResp.body}');
// // print('RESPONSE:DSDSD ${dataResp.body}');
//         // final responseData = AllInformesGuardias.fromJson(dataResp.body);

//         final responseData = jsonDecode(dataResp.body);
//         return responseData;
//       }
//       if (dataResp.statusCode == 404) {
//         return null;
//       }
//       if (dataResp.statusCode == 401) {
//          Auth.instance.deleteSesion(context!);
//                   // Auth.instance.deleteIdRegistro();
//                   // Auth.instance.deleteTurnoSesion();
//         return null;
//       }
//     } catch (e) {
//       //  NotificatiosnService.showSnackBarError("SIN 19 ");
//       return null;
//     }
//   }

//   //=========================GET ALL CONSIGNAS CLIENTES =====================================//
//   // Future<AllConsignasClientes?> getAllConsignasClientes({
//   //   BuildContext? context,
//   //   int? cantidad,
//   //   int? page,
//   //   String? search,
//   //   String? input,
//   //   bool? orden,
//   //   String? datos,
//   //   String? rucempresa,
//   //   String? token,
//   // }) async {
//   //   try {
//   //     final url = Uri.parse(
//   //         'https://backsigeop.neitor.com/api/consignas?cantidad=$cantidad&page=$page&search=$search&input=$input&orden=$orden&datos=$datos&rucempresa=$rucempresa');

//   //     final dataResp = await _http.get(
//   //       url,
//   //       headers: {"x-auth-token": '$token'},
//   //     );
//   //     // print(dataResp);
//   //     if (dataResp.statusCode == 200) {
//   //       final response = AllConsignasClientes.fromJson(dataResp.body);

//   //       return response;
//   //     }

//   //     if (dataResp.statusCode == 404) {
//   //       return null;
//   //     }
//   //     if (dataResp.statusCode == 401) {
//   //        Auth.instance.deleteSesion(context!);
//   //                 Auth.instance.deleteIdRegistro();
//   //                 Auth.instance.deleteTurnoSesion();
//   //       return null;
//   //     }
//   //   } catch (e) {
//   //     NotificatiosnService.showSnackBarError("SIN 20 ");
//   //     return null;
//   //   }
//   // }
//   Future getAllConsignasClientes({
//     BuildContext? context,
//     // int? cantidad,
//     // int? page,
//     String? search,
//        String? notificacion,
//     // String? input,
//     // bool? orden,
//     // String? datos,
//     // String? rucempresa,
//     String? token,
//   }) async {
//    try {
//       final url = Uri.parse(
//           'https://backsigeop.neitor.com/api/consignas/filtro/0?search=$search&notificacion=$notificacion');

//       final dataResp = await _http.get(
//         url,
//         headers: {"x-auth-token": '$token'},
//       );

// print('RESPONSE: ${dataResp.body}');
//       if (dataResp.body.isEmpty) {
//         return null;
//       }
     
//       if (dataResp.statusCode == 200) {
// // print('RESPONSE: ${dataResp.body}');
// // print('RESPONSE:DSDSD ${dataResp.body}');
//         // final responseData = AllInformesGuardias.fromJson(dataResp.body);

//         final responseData = jsonDecode(dataResp.body);
//         return responseData;
//       }
//       if (dataResp.statusCode == 404) {
//         return null;
//       }
//       if (dataResp.statusCode == 401) {
//          Auth.instance.deleteSesion(context!);
//                   // Auth.instance.deleteIdRegistro();
//                   // Auth.instance.deleteTurnoSesion();
//         return null;
//       }
//     } catch (e) {
//       //  NotificatiosnService.showSnackBarError("SIN 19 ");
//       return null;
//     }
//   }

//   //=========================GET ALL PEDIDOS  =====================================//
//   Future getAllPedidos({
//     BuildContext? context,
//     String? search,
//     String? notificacion,
//     String? tipo,
//     String? token,
//   }) async {
//     try {
//       final url = Uri.parse(
//           // 'https://backsigeop.neitor.com/api/distribucion/filtro/0?search=$search&tipo=$tipo');
//           'https://backsigeop.neitor.com/api/distribucion/filtro/0?search=$search&notificacion=$notificacion&tipo=$tipo');

//       final dataResp = await _http.get(
//         url,
//         headers: {"x-auth-token": '$token'},
//       );
//       if (dataResp.body.isEmpty) {
//         return null;
//       }
//       // print('8888888> ${dataResp.body}');
//       if (dataResp.statusCode == 200) {
//         // final response = AllPedidosGuardias.fromJson(dataResp.body);
//         // final response = Pedido.fromJson(dataResp.body);

//         final response = jsonDecode(dataResp.body);
//         // print(response);
//         // print('8888888> {response.data[0].disTipo}');
//         return response;
//       }

//       if (dataResp.statusCode == 404) {
//         return null;
//       }
//       if (dataResp.statusCode == 401) {
//          Auth.instance.deleteSesion(context!);
//                   // Auth.instance.deleteIdRegistro();
//                   // Auth.instance.deleteTurnoSesion();
//         return null;
//       }
//     } catch (e) {
//       //  NotificatiosnService.showSnackBarError("SIN 21 ");
//       return null;
//     }
//   }

//   //=========================GET ALL PEDIDOS ACTIVOS =====================================//
//   Future getAllPedidosActivos({
//     BuildContext? context,
//     String? search,
//     String? tipo,
//     String? token,
//   }) async {
//     try {
//       final url = Uri.parse(
//           // 'https://backsigeop.neitor.com/api/distribucion/filtro/0?search=$search&tipo=$tipo');
//           'https://backsigeop.neitor.com/api/pedidos/pedidos_activos/0?search=$search&tipo=$tipo');

//       final dataResp = await _http.get(
//         url,
//         headers: {"x-auth-token": '$token'},
//       );
//       if (dataResp.body.isEmpty) {
//         return null;
//       }
//       // print('8888888> ${dataResp.body}');
//       if (dataResp.statusCode == 200) {
//         // final response = AllPedidosGuardias.fromJson(dataResp.body);
//         // final response = Pedido.fromJson(dataResp.body);

//         final response = jsonDecode(dataResp.body);
//         // print(response);
//         // print('8888888> {response.data[0].disTipo}');
//         return response;
//       }

//       if (dataResp.statusCode == 404) {
//         return null;
//       }
//       if (dataResp.statusCode == 401) {
//          Auth.instance.deleteSesion(context!);
//                   // Auth.instance.deleteIdRegistro();
//                   // Auth.instance.deleteTurnoSesion();
//         return null;
//       }
//     } catch (e) {
//       // NotificatiosnService.showSnackBarError("SIN 22 ");
//       return null;
//     }
//   }
//   //=========================GET ALL PEDIDOS  =====================================//
//   Future getAllDistribucion({
//     BuildContext? context,
//     String? search,
//     String? notificacion,
//     String? tipo,
//     String? token,
//   }) async {
//     try {
//       final url = Uri.parse(
//           // 'https://backsigeop.neitor.com/api/distribucion/filtro/0?search=$search&tipo=$tipo');
//           'https://backsigeop.neitor.com/api/distribucion/filtro/0?search=$search&notificacion=$notificacion&tipo=$tipo');

//       final dataResp = await _http.get(
//         url,
//         headers: {"x-auth-token": '$token'},
//       );
//       if (dataResp.body.isEmpty) {
//         return null;
//       }
//       // print('8888888> ${dataResp.body}');
//       if (dataResp.statusCode == 200) {
//         // final response = AllPedidosGuardias.fromJson(dataResp.body);
//         // final response = Pedido.fromJson(dataResp.body);

//         final response = jsonDecode(dataResp.body);
//         // print(response);
//         // print('8888888> {response.data[0].disTipo}');
//         return response;
//       }

//       if (dataResp.statusCode == 404) {
//         return null;
//       }
//       if (dataResp.statusCode == 401) {
//          Auth.instance.deleteSesion(context!);
//                   // Auth.instance.deleteIdRegistro();
//                   // Auth.instance.deleteTurnoSesion();
//         return null;
//       }
//     } catch (e) {
//       //  NotificatiosnService.showSnackBarError("SIN 23 ");
//       return null;
//     }
//   }

//   //=========================GET ALL PERSONAL DESIGNADO =====================================//
//   Future<AllPersonasDesignadas?> getAllPersonalDesignado({
//     BuildContext? context,
//     String? docnumero,
//     String? token,
//   }) async {
//     try {
//       final url = Uri.parse(
//           'https://backsigeop.neitor.com/api/personas/listado/0?docnumero=$docnumero');

//       final dataResp = await _http.get(
//         url,
//         headers: {"x-auth-token": '$token'},
//       );

// // //         print('-->${responseData.results[0]}');
//       // final respo = jsonDecode(dataResp.body);
// // // final responseData=AllCumunicadosClientes.fromJson(dataResp.body);

// //       // // // // return respo;
//       // print('-SIIIIII ->${responseData.data.results[0].comAsunto}');
//       // print('-SIIIIII  respuesta Personal Designada ->${dataResp.body}');

//       if (dataResp.statusCode == 200) {
//         final responseData = AllPersonasDesignadas.fromJson(dataResp.body);
//         // print('-->${dataResp}');
//         //  print('-SIIIIII ->${responseData.data[0].perAreaDepartamento}');
//         return responseData;
//         // return respo;
//       }

//       if (dataResp.statusCode == 404) {
//         return null;
//       }
//       if (dataResp.statusCode == 401) {
//          Auth.instance.deleteSesion(context!);
//                   // Auth.instance.deleteIdRegistro();
//                   // Auth.instance.deleteTurnoSesion();
//         return null;
//       }
//     } catch (e) {
//       //  NotificatiosnService.showSnackBarError("SIN 24 ");
//       return null;
//     }
//   }

//   //=========================GET ALL CONSIGNAS CLIENTES =====================================//
//   Future<AllEstadosCuentaCliente?> getAllEstadosdeCuentaClientes({
//     BuildContext? context,
//     int? cantidad,
//     int? page,
//     String? search,
//     String? input,
//     bool? orden,
//     String? datos,
//     String? rucempresa,
//     String? token,
//   }) async {
//     try {
//       // final params = {
//       //   "cantidad": cantidad,
//       //   "page": page,
//       //   "search": search,
//       //   "input": input,
//       //   "orden": orden,
//       //   "datos": datos,
//       //   "rucempresa": rucempresa,
//       // };

//       //  print('-SIIIIII ->${token}');
//       //  print('-SIIIIII ->${params}');

//       final url = Uri.parse(
//           'https://backsigeop.neitor.com/api/estadocuentas?cantidad=$cantidad&page=$page&search=$search&input=$input&orden=$orden&datos=$datos&rucempresa=$rucempresa');

//       final dataResp = await _http.get(
//         url,
//         headers: {"x-auth-token": '$token'},
//       );

// // //         print('-->${responseData.results[0]}');
//       // final respo = jsonDecode(dataResp.body);
// // // final responseData=AllCumunicadosClientes.fromJson(dataResp.body);

// //       // // // // return respo;
//       // print('-SIIIIII ->${responseData.data.results[0].comAsunto}');
//       // print('-SIIIIII ESTADO DE CUENTA ->${respo}');

//       if (dataResp.statusCode == 200) {
//         final responseData = AllEstadosCuentaCliente.fromJson(dataResp.body);
//         // print('-->${dataResp}');
//         //  print('-SIIIIII ->${responseData.data.results[0].conNombreCliente}');
//         return responseData;
//       }

//       if (dataResp.statusCode == 404) {
//         return null;
//       }
//       if (dataResp.statusCode == 401) {
//          Auth.instance.deleteSesion(context!);
//                   // Auth.instance.deleteIdRegistro();
//                   // Auth.instance.deleteTurnoSesion();
//         return null;
//       }
//     } catch (e) {
//       //  NotificatiosnService.showSnackBarError("SIN 25 ");
//       return null;
//     }
//   }

//   //=========================GET ALL TURNOS EXTRAS =====================================//
//   Future getAllActividades({
//     BuildContext? context,
//     String? search,
//     String? token,
//   }) async {
//     try {
//       final url = Uri.parse(
//           'https://backsigeop.neitor.com/api/actividades/filtro/0?search=$search');

//       final dataResp = await _http.get(
//         url,
//         headers: {"x-auth-token": '$token'},
//       );

//       if (dataResp.body.isEmpty) {
//         return null;
//       }
//       // print('RESPONSE:AVISOSALIDA ${dataResp.body}');
//       if (dataResp.statusCode == 200) {
// // print('RESPONSE actividades: ${dataResp.body}');
// // print('RESPONSE:DSDSD ${dataResp.body}');
//         // final responseData = AllInformesGuardias.fromJson(dataResp.body);

//         final responseData = jsonDecode(dataResp.body);
//         return responseData;
//       }
//       if (dataResp.statusCode == 404) {
//         return null;
//       }
//       if (dataResp.statusCode == 401) {
//           return 401;
//       }
//       if (dataResp.statusCode == 401) {
//          Auth.instance.deleteSesion(context!);
//                   // Auth.instance.deleteIdRegistro();
//                   // Auth.instance.deleteTurnoSesion();
//         return null;
//       }
//     } catch (e) {
//       //  NotificatiosnService.showSnackBarError("SIN 26 ");
//       return null;
//     }
//   }

//   //=========================GET ALL CLIENTES =====================================//
//   Future getAllClientesVarios({
//     BuildContext? context,
//     String? search,
//     String? estado,
//     String? token,
//   }) async {
//     try {
//       final url = Uri.parse(
//           'https://backsigeop.neitor.com/api/clientes/filtro/0?search=$search&estado=$estado');

//       final dataResp = await _http.get(
//         url,
//         headers: {"x-auth-token": '$token'},
//       );

//       if (dataResp.body.isEmpty) {
//         return null;
//       }

//       if (dataResp.statusCode == 200) {
//         final responseData = jsonDecode(dataResp.body);
//         // print('RESPONSE CLIENTES MULTAS: ${dataResp.body}');

//         return responseData;
//       }
//       if (dataResp.statusCode == 404) {
//         return null;
//       }
//       if (dataResp.statusCode == 401) {
//          Auth.instance.deleteSesion(context!);
//                   // Auth.instance.deleteIdRegistro();
//                   // Auth.instance.deleteTurnoSesion();
//         return null;
//       }
//     } catch (e) {
//       // NotificatiosnService.showSnackBarError("SIN 27 ");
//       return null;
//     }
//   }

// //=====================================================================================//
// //================================= TOKEN ID ==============================//
//   Future sentIdToken({
//     BuildContext? context,
//     String? tokennotificacion,
//     String? token,
//   }) async {
//     try {
//       final uri =
//           Uri.parse('https://backsigeop.neitor.com/api/notificaciones/token');
//       final headers = {
//         'Content-Type': 'application/json',
//         "x-auth-token": "$token"
//       };
//       Map<String, dynamic> body = {
//         "tokennotificacion": tokennotificacion,
//       };
//       String jsonBody = json.encode(body);
//       final encoding = Encoding.getByName('utf-8');

//       final dataResp = await _http.post(
//         uri,
//         headers: headers,
//         body: jsonBody,
//         encoding: encoding,
//       );

//       if (dataResp.statusCode == 404) {
//         // print('-OKkkkkkR RESPONSE->${dataResp.body}');
//         return null;
//       }
//       if (dataResp.statusCode == 200) {
//         final responseData = jsonDecode(dataResp.body);
//         // print('RESPONSE TOKEN BACK: $responseData');
//         return responseData;
//       }
//       if (dataResp.statusCode == 401) {
//          Auth.instance.deleteSesion(context!);
//                   // Auth.instance.deleteIdRegistro();
//                   // Auth.instance.deleteTurnoSesion();
//         return null;
//       }
//     } catch (e) {
//       //  NotificatiosnService.showSnackBarError("SIN 28 ");
//       return null;
//     }
//   }

//   //=========================GET ALL NOTIFICACIONES1 PUSH =====================================//
//   Future getAllNotificacionesPush({
//     BuildContext? context,
//     String? token,
//   }) async {
//     try {
//       final url =
//           Uri.parse('https://backsigeop.neitor.com/api/notificaciones/listado');

//       final dataResp = await _http.get(
//         url,
//         headers: {"x-auth-token": '$token'},
//       );
//       //  print('RESPONSE NOTIFICACIONES 111 ${dataResp.body}');
//       //   print('RESPONSE NOTIFICACIONES 222: ${dataResp.body}');
//        final responseData = jsonDecode(dataResp.body);
//       // print('TIPO json : ${responseData['data']}');
//       // print('TIPO json 111: ${responseData['data'].length}');

//       // if (responseData['data'].length==0) {
//       //   print('RESPONSE NOTIFICACIONES 11 ${responseData['data']}');
//       //   print('EL ARRAY ESTA VACIO000.....');
      
//       // }
//       // print('RESPONSE NOTIFICACIONES 11 ${responseData.data[0]}');
//       // print('RESPONSE NOTIFICACIONES 22: ${responseData.data[0]}');

     

//       if (dataResp.body.isEmpty) {
//         // print('RESPONSE NOTIFICACIONES 11 ${dataResp.body[0]}');
//         // print('RESPONSE NOTIFICACIONES 22: ${dataResp.body[0]}');
//         return null;
//       }
    

//       if (dataResp.statusCode == 200) {
//         // final responseData = jsonDecode(dataResp.body);

//         // print(
//         //     'RESPONSE NOTIFICACIONES 11 ${responseData['data']['notificacion1']}');
//         // print(
//         //     'RESPONSE NOTIFICACIONES 22: ${responseData['data']['notificacion2']}');
//         // print('RESPONSE NOTIFICACIONES TYPE: ${responseData['data']['notificacion2'].runtimeType}');

//         return responseData;
//         // return dataResp;
//       }
//       if (dataResp.statusCode == 404) {
//         return null;
//       }
//       if (dataResp.statusCode == 401) {
//          Auth.instance.deleteSesion(context!);
//                   // Auth.instance.deleteIdRegistro();
//                   // Auth.instance.deleteTurnoSesion();
//         return null;
//       }
//     } catch (e) {
//       // NotificatiosnService.showSnackBarError("SIN 29 ");
//       return null;
//     }
//   }

//   //=========================GET ALL NOTIFICACIONES1 PUSH =====================================//
//   Future getAllNotificacionesPush2({
//     BuildContext? context,
//     String? token,
//   }) async {
//     try {
//       final url =
//           Uri.parse('https://backsigeop.neitor.com/api/notificaciones/listado');

//       final dataResp = await _http.get(
//         url,
//         headers: {"x-auth-token": '$token'},
//       );

//       if (dataResp.body.isEmpty) {
//         return null;
//       }

//       if (dataResp.statusCode == 200) {
//         final responseData = jsonDecode(dataResp.body);
//         //  print('RESPONSE NOTIFICACIONES 2: ${responseData['data']}');
//         // print('RESPONSE NOTIFICACIONES 2: ${responseData['data']}');

//         return responseData;
//         // return dataResp.body;
//       }
//       if (dataResp.statusCode == 404) {
//         return null;
//       }
//       if (dataResp.statusCode == 401) {
//          Auth.instance.deleteSesion(context!);
//                   // Auth.instance.deleteIdRegistro();
//                   // Auth.instance.deleteTurnoSesion();
//         return null;
//       }
     
      
//     } catch (e) {
//       //  NotificatiosnService.showSnackBarError("SIN 30 ");
//       return null;
//     }
//   }

// //================================= DELETE TOKEN FIREBASE ==============================//
//   Future deleteTokenFirebase({
//     BuildContext? context,
//     String? tokennotificacion,
//     String? token,
//   }) async {
//     try {
//       final uri = Uri.parse(
//           'https://backsigeop.neitor.com/api/notificaciones/token/eliminar');
//       final headers = {
//         'Content-Type': 'application/json',
//         "x-auth-token": "$token"
//       };
//       Map<String, dynamic> body = {
//         "tokennotificacion": tokennotificacion,
//       };
//       String jsonBody = json.encode(body);
//       final encoding = Encoding.getByName('utf-8');

//       final dataResp = await _http.post(
//         uri,
//         headers: headers,
//         body: jsonBody,
//         encoding: encoding,
//       );

//       if (dataResp.statusCode == 404) {
//         // print('-OKkkkkkR RESPONSE->${dataResp.body}');
//         return null;
//       }
//       if (dataResp.statusCode == 200) {
//         final responseData = jsonDecode(dataResp.body);
//         // print('RESPONSE TOKEN BACK: $responseData');
//         return responseData;
//       }
//       if (dataResp.statusCode == 401) {
//          Auth.instance.deleteSesion(context!);
//                   // Auth.instance.deleteIdRegistro();
//                   // Auth.instance.deleteTurnoSesion();
//         return null;
//       }
//     } catch (e) {
//       //  NotificatiosnService.showSnackBarError("SIN 31 ");
//       return null;
//     }
//   }
// //================================= RECOPERA TOKEN DEL SERVIDOR ==============================//
//   Future revisaTokenTurno({
//     BuildContext? context,
//     // String? tokennotificacion,
//     String? token,
//   }) async {
//     try {
//       final url =
//           Uri.parse('https://backsigeop.neitor.com/api/session');

//       final dataResp = await _http.get(
//         url,
//         headers: {"x-auth-token": '$token'},
//       );

//       if (dataResp.body.isEmpty) {
//         //  NotificatiosnService.showSnackBarError("No ha iniciado Turno ");
//         return null;
//       }

//       if (dataResp.statusCode == 200) {
//         final responseData = jsonDecode(dataResp.body);
//         //  print('RESPONSE NOTIFICACIONES 2: ${responseData['data']}');
//         // print('RESPONSE NOTIFICACIONES 2: ${responseData['data']}');

//         return responseData;
//         // return dataResp.body;
//       }
//       if (dataResp.statusCode == 404) {
//         //  NotificatiosnService.showSnackBarError("No ha iniciado Turno ");
//         return null;
//       }
//       if (dataResp.statusCode == 401) {
//          Auth.instance.deleteSesion(context!);
//                   // Auth.instance.deleteIdRegistro();
//                   // Auth.instance.deleteTurnoSesion();
//         return null;
//       }
     
      
//     } catch (e) {
//       //  NotificatiosnService.showSnackBarError("SIN $e['msg'] ");
//       return null;
//     }
//   }

// //=========================GET ALL PERSONAS DIRIGIDO A =====================================//
//   Future getAllPersonasDirigidoA({
//     BuildContext? context,
//     String? search,
//     String? estado,
//     String? token,
//   }) async {
//     try {
//       final url = Uri.parse(
//           // 'https://backsigeop.neitor.com/api/personas/filtro/0?search=$search&estado=$estado');
//           'https://backsigeop.neitor.com/api/personas/filtroporareadepartamento/0?search=$search&estado=$estado');

//       final dataResp = await _http.get(
//         url,
//         headers: {"x-auth-token": '$token'},
//       );

//       // print('RESPONSE dirigido A: ${dataResp.body[0]}');
//       if (dataResp.body.isEmpty) {
//         return null;
//       }

//       if (dataResp.statusCode == 200) {
//         final responseData = jsonDecode(dataResp.body);

//         return responseData;
//       }
//       if (dataResp.statusCode == 404) {
//         return null;
//       }
//       if (dataResp.statusCode == 401) {
//          Auth.instance.deleteSesion(context!);
//                   // Auth.instance.deleteIdRegistro();
//                   // Auth.instance.deleteTurnoSesion();
//         return null;
//       }
//     } catch (e) {
//       // NotificatiosnService.showSnackBarError("SIN 32 ");
//       return null;
//     }
//   }



// //================================= DELETE TOKEN FIREBASE ==============================//
//   Future validaTokenUsuarios({
//     String? token,
//   }) async {
//         try {
//       final url = Uri.parse(
//             'https://backsigeop.neitor.com/api/auth');

//       final dataRespToken = await _http.get(
//         url,
//         headers: {"x-auth-token": '$token'},
//       );

// // final responseData = jsonDecode(dataRespToken.body);
//       // print('RESPONSE VALIDA SESION: ${responseData}');
//       if (dataRespToken.body.isEmpty) {
//         return null;
//       }
//       if (dataRespToken.statusCode == 200) {
//         final responseData = jsonDecode(dataRespToken.body);
//       // print('RESPONSE VALIDA SESION: ${responseData}');

//         return responseData;
//       }
//       if (dataRespToken.statusCode == 404) {
//         return null;
//       }
//       if (dataRespToken.statusCode == 401) {
//         return null;
//       }
//     } catch (e) {
//          return null;
//     }
//   }



// //=====================================================================================//

// }

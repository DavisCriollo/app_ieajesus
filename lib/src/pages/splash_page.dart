import 'package:flutter/material.dart';
import 'package:ieanjesus/src/api/auth.dart';
import 'package:ieanjesus/src/controllers/home_controller.dart';
import 'package:ieanjesus/src/controllers/login_controller.dart';
import 'package:ieanjesus/src/models/session.dart';
import 'package:ieanjesus/src/pages/home_page.dart';
import 'package:ieanjesus/src/pages/login_page.dart';
import 'package:ieanjesus/src/utils/responsive.dart';

import 'package:provider/provider.dart';


class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final controllerLogin = LoginController();
  final controllerHome = HomeController();

  @override
  void initState() {
    super.initState();
// VERIFICO SI EL CONTEXTO  ESTA INICIALIZADO//
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      _chechLogin();
    });
  }



  _chechLogin() async {
      // final controllerHome = Provider.of<HomeController>(context, listen: false);
    final Session? session = await Auth.instance.getSession();
    // controllerHome.setSesionUser(session);

        // print('============== SI TIENE sesion: ${session!.nomComercial}');

    if (session != null) {
     
//       final status = await Permission.location.request();
//       if (status == PermissionStatus.granted) {
//         // print('============== SI TIENE PERMISOS');
Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => HomePage(user:session)),
          (Route<dynamic> route) => false);
      
     
//         }
      } else {
     Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) =>  LoginPage()),
          (Route<dynamic> route) => false);
      }
  }

  @override
  Widget build(BuildContext context) {
    final Responsive size = Responsive.of(context);
    return Scaffold(
      body: SizedBox(
        width: size.wScreen(100.0),
        height: size.hScreen(100.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircularProgressIndicator(),
              SizedBox(
                height: size.iScreen(2.0),
              ),
              const Text('Preparando Contenido.... '),
            ],
          ),
        ),
      ),
    );
  }
  }

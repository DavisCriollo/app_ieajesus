

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ieanjesus/src/api/auth.dart';
import 'package:ieanjesus/src/controllers/home_controller.dart';
import 'package:ieanjesus/src/models/session.dart';
import 'package:ieanjesus/src/utils/dialogs.dart';

import 'package:ieanjesus/src/utils/responsive.dart';
import 'package:ieanjesus/src/utils/theme.dart';

//

class MenuPrincipal extends StatelessWidget {
  final Session users;
  MenuPrincipal({Key? key, required this.users}) : super(key: key);

  final controllerHome = HomeController();

  @override
  Widget build(BuildContext context) {
    // final authService = Provider.of<AuthService>(context);
    // final socketService = Provider.of<SocketService>(context);
    // final usuario = authService.usuario;

      print('object: ${users.usuario[0]}');


    final Responsive size = Responsive.of(context);
    return Drawer(
      child: Column(
        children: [
          SafeArea(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: size.iScreen(2.0)),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  // color: Colors.red,
                  // border: Border.all(color: Colors.blue),
                  ),
              width: size.wScreen(100),
              // height: size.wScreen(46.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(size.iScreen(0.5)),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(
                        color: primaryColor,
                        width: size.iScreen(0.5)
                      ),
                    ),
                    width: size.iScreen(13),
                    height: size.iScreen(13),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Center(
                        child: Text(users.usuario[0], style: GoogleFonts.roboto(
                              fontSize: size.iScreen(8.0),
                              
                              fontWeight: FontWeight.bold,
                              color: primaryColor,
                              )),
                      )
                      // const Image(
                      //   // image: AssetImage('assets/imgs/Me.jpg'),
                      //   image: AssetImage('assets/imgs/no-image.png'),
                      //   fit: BoxFit.cover,
                      // ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    // color:Colors .red,
                    margin: EdgeInsets.only(top: size.iScreen(2.0)),
                    child: Text('Dios te Bendiga',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.roboto(
                            fontSize: size.iScreen(2.0),
                            fontWeight: FontWeight.normal
                            // color: Colors.white,
                            )),
                  ),
                  Container(
                    alignment: Alignment.center,
                    // color:Colors .red,
                    margin: EdgeInsets.only(top: size.iScreen(1.0)),
                    child: Text('${users.usuario}',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.roboto(
                            fontSize: size.iScreen(1.8),
                            fontWeight: FontWeight.bold
                            // color: Colors.white,
                            )),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: _ListaOpciones(),
          ),
          Container(
            // color: Colors.red,

            child: Column(
              // mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [


users.tipo=='master'
                ?Container(
                   width: size.wScreen(40.0),
                  child: ElevatedButton(
                    // style: ButtonStyle(
                    //   backgroundColor:
                    //       MaterialStateProperty.all<Color>(Colors.green),
                    // ),
                    onPressed: () async {
                      ProgressDialog.show(context);
                      await controllerHome.listarAllParaGuardar('');
                      final response = await controllerHome.saveData();
                      ProgressDialog.dissmiss(context);
                      if (response != null) {
                        final snackBar = _sNackInfo(
                            'Datos subidos correctamente', size, Colors.green);

                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      } else {
                        final snackBar = _sNackInfo(
                            'Error al subir los datos', size, Colors.red);
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }

                      Navigator.pop(context);

                      // Find the ScaffoldMessenger in the widget tree
                      // and use it to show a SnackBar.
                    },

                    child: Container(
                      width: size.wScreen(40.0),
                      padding: EdgeInsets.symmetric(vertical: size.iScreen(0.3)),
                      child: Row(
                        children: [
                          Text('Subir Data',
                              style: GoogleFonts.roboto(
                                  // fontSize: size.iScreen(2.0),
                                  fontWeight: FontWeight.bold
                                  // color: Colors.white,
                                  )),
                          SizedBox(
                            width: size.iScreen(2.0),
                          ),
                          const Icon(
                            Icons.upload_outlined,
                            // size:size.wScreen(10.0),
                          ),
                        ],
                      ),
                    ),
                  ),
                ):Container(),
                Container(
                   width: size.wScreen(40.0),
                  child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Colors.blue.shade700),
                      ),
                      onPressed: () async {
                        ProgressDialog.show(context);
                        await controllerHome.deleteAllLocal();
                        await controllerHome.getAllData();
                        ProgressDialog.dissmiss(context);

                        final snackBar = _sNackInfo(
                            'Datos Actualizados correctamente',
                            size,
                            Colors.green);

                        ScaffoldMessenger.of(context).showSnackBar(snackBar);

                        Navigator.pop(context);
                      },
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(vertical: size.iScreen(0.3)),
                        child: Row(
                          children: [
                            Text('Actualizar',
                                style: GoogleFonts.roboto(
                                    // fontSize: size.iScreen(2.0),
                                    fontWeight: FontWeight.bold
                                    // color: Colors.white,
                                    )),
                            SizedBox(
                              width: size.iScreen(2.0),
                            ),
                            const Icon(
                              Icons.download_outlined,
                            ),
                          ],
                        ),
                      )),
                ),
              ],
            ),
          ),
          //***********************************************/
                  SizedBox(
                    height: size.iScreen(5.0),
                  ),
                  //*****************************************/
          // ListTile(
          //   title: Text('Acerca de',
          //       style: GoogleFonts.roboto(
          //           fontSize: size.iScreen(2.0), fontWeight: FontWeight.bold
          //           // color: Colors.white,
          //           )),
          //   leading: const Icon(Icons.info_outline, color: primaryColor),
          //   trailing: Icon(
          //     FontAwesomeIcons.chevronRight,
          //     size: size.iScreen(1.6),
          //   ),
          //   onTap: () {

          //     Navigator.pushNamed(context, 'acercaDePage');

          //   },
          // ),
          ListTile(
            title: Text('Cerrar Sesión',
                style: GoogleFonts.roboto(
                    fontSize: size.iScreen(2.0), fontWeight: FontWeight.bold
                    // color: Colors.white,
                    )),
            leading: Icon(Icons.logout_outlined, color: primaryColor),
            trailing: Icon(
              FontAwesomeIcons.chevronRight,
              size: size.iScreen(1.6),
            ),
            onTap: ()  async{
              await Auth.instance.deleteSesion(context);
              // socketService.disconnect();
              // Navigator.pushReplacementNamed(context, 'login');
              // AuthService.deleteToken();
            },
          ),
        ],
      ),
    );
  }

  SnackBar _sNackInfo(String _info, Responsive size, Color _color) {
    return SnackBar(
      backgroundColor: _color,
      content: Text(_info,
          style: GoogleFonts.roboto(
              fontSize: size.iScreen(2.0), fontWeight: FontWeight.bold
              // color: Colors.white,
              )),
    );
  }
}

class _ListaOpciones extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Responsive size = Responsive.of(context);

    return ListView(
      physics: BouncingScrollPhysics(),
      children: [
        _ItemsMenu(
          enabled: true,
          icon: Icons.auto_stories_outlined,
          title: 'Dedicatoria',
          page: 'dedicatoria',
          size: size,
        ),
      
        _ItemsMenu(
          enabled: false,
          icon: FontAwesomeIcons.shareAlt,
          title: 'Compartir',
          page: '',
          size: size,
        ),
      ],
    );
  }
}

class _ItemsMenu extends StatelessWidget {
  final Responsive size;
  final bool enabled;
  final String title;
  final IconData icon;
  final String page;
  const _ItemsMenu({
    required this.title,
    required this.enabled,
    required this.icon,
    required this.page,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Ink(
          color:
              (enabled == false) ? Color.fromARGB(255, 236, 241, 241) : Colors.transparent,
          child: ListTile(
            selectedTileColor: Colors.grey,
            enabled: enabled,
            dense: true,
            leading: Icon(
              icon,
              color: primaryColor,
            ),
            title: Text(
              title,
              style: GoogleFonts.roboto(
                fontSize: size.iScreen(2.0),
                color: Colors.black,
              ),
            ),
            trailing: Icon(
              FontAwesomeIcons.chevronRight,
              size: size.iScreen(2.2),
            ),
            onTap: () {
              Navigator.popAndPushNamed(context, page);
            },
          ),
        ),
        Divider(
          color: Theme.of(context).primaryColor,
        ),
      ],
    );
  }
}

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ieanjesus/src/controllers/home_controller.dart';
import 'package:ieanjesus/src/models/session.dart';
import 'package:ieanjesus/src/pages/lista_alabanzas_page.dart';
import 'package:ieanjesus/src/pages/lista_congregacionales_page.dart';
import 'package:ieanjesus/src/pages/lista_coros_infantiles_page.dart';
import 'package:ieanjesus/src/pages/lista_coros_page.dart';
import 'package:ieanjesus/src/pages/lista_libros_biblia.dart';
import 'package:ieanjesus/src/utils/responsive.dart';
import 'package:ieanjesus/src/widgets/item_menu_home.dart';
import 'package:ieanjesus/src/widgets/menu_Drower.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  final Session? user;
   const HomePage({Key? key,  this.user}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    initData();
    super.initState();
  }

  void initData() async {
final controller=HomeController();

controller.setSesion(widget.user);
  }
  @override
  Widget build(BuildContext context) {
  
    final Responsive size = Responsive.of(context);
    final controllerInfo = context.read<HomeController>();
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Salmos 84:2',
            style: GoogleFonts.roboto(
                fontSize: size.iScreen(2.5),
                color: Colors.white,
                fontWeight: FontWeight.bold),
            overflow: TextOverflow.ellipsis,
          ),
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomCenter,
                colors: <Color>[
                  Color(0XFF153E76),
                  Color(0XFF0076A7),
                  // Color(0XFF005B97),
                  // Color(0XFF0075BE),
                  // Color(0XFF1E9CD7),
                  // Color(0XFF3DA9F4),
                ],
              ),
            ),
          ),
        ),
        drawer: MenuPrincipal(users:widget.user!),
        body: Container(
          color: Colors.white,
          width: size.wScreen(100.0),
          height: size.hScreen(100.0),
          padding: EdgeInsets.only(
            top: size.iScreen(0.0),
            right: size.iScreen(0.0),
            left: size.iScreen(0.0),
          ),
          child: Stack(
            children: [
              Center(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        // color: Colors.red,
                        // margin: EdgeInsets.symmetric(horizontal:size.iScreen(8.0)),
                        // decoration: BoxDecoration(
                        //   borderRadius: BorderRadius.circular(100),
                        //   // border: Border.all(
                        //   //   color: Color(0xFF04559D),
                        //   // ),
                        // ),
                        width: size.wScreen(80),
                        // height: size.iScreen(15),
                        child: Image(
                          image: const AssetImage('assets/imgs/Logo_Oficial.png'),
                          fit: BoxFit.cover,
                          width: size.iScreen(100),
                        ),
                      ),
                      SizedBox(
                        height: size.iScreen(5),
                      ),
                      Wrap(
                        alignment: WrapAlignment.center,
                        children: [
                          ItemsMenuHome(
                            onTap: () {
                              controllerInfo.resetFormCoros();
                              controllerInfo.listarAllCoros('');
                              // context.read<HomeController>().listarAllCoros('');

                              Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (context) =>  ListaCoros(user: widget.user,)),
                              );
                            },
                           
                            label: 'Coros',
                            icon: 'read.png',
                            color: Colors.green.shade800,
                          ),
                          ItemsMenuHome(
                            onTap: () {
                              controllerInfo.resetFormCoros();
                              controllerInfo.listarAllHimnos('');
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (context) =>
                                         ListaCongregacionales(user: widget.user, )),
                              );
                              // Navigator.pushNamed(
                              //     context, 'novedades');
                            },
                            label: 'Himnos',
                            icon: 'choir.png',
                            color: const Color(0xffE42167),
                          ),
                          ItemsMenuHome(
                            onTap: () {
                              controllerInfo.resetFormCoros();
                              controllerInfo.listarAllAlabanzas('');
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (context) =>  ListaAlabanzas(user: widget.user,)),
                              );
                            },
                            label: 'Alabanzas',
                            icon: 'karaoke.png',
                            color: const Color(0XFFF8922A),
                          ),
                          ItemsMenuHome(
                            onTap: () {
                              controllerInfo.resetFormCoros();
                              controllerInfo.listarAllInfantiles('');

                              Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (context) =>
                                         ListaCorosInfantiles(user: widget.user,)),
                              );
                            },
                            label: 'Coros Niños',
                            icon: 'children.png',
                            color: const Color(0XFF9C3DB0),
                          ),
                          ItemsMenuHome(
                            onTap: () {

                                 controllerInfo.validaDataDispositivo();
                                 controllerInfo.getTodosLosibrosBiblia();
                              Navigator.pushNamed(context, 'librosBiblia');
                          
                            },
                            label: 'Santa Biblia',
                            icon: 'biblia.png',
                            color: Colors.red.shade900,
                          ),
                        ],
                      ),
 
                    ],
                  ),
                ),
              ),
              
                 
                  Positioned(
                    bottom: size.iScreen(1.0),
                    child: Container( 
                      width: size.wScreen(100.0),
                      // color: Colors.red,
                      child: Text('© ${DateTime.now().year} DavisSoft. Todos los derechos reservados.',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.roboto(
                                    fontSize: size.iScreen(1.5),
                                  
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold),),
                    ),
                  ),
            ],
          ),
        ),
    
    
      ),
         
    );
  }
}

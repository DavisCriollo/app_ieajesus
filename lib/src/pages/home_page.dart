import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ieanjesus/src/controllers/home_controller.dart';
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
  const HomePage({Key? key}) : super(key: key);

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
// final controller=HomeController();

// controller.getTodosLosibrosBiblia();
  }
  @override
  Widget build(BuildContext context) {
    print('====== RELOADS ========');
    final Responsive size = Responsive.of(context);
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
        drawer: MenuPrincipal(),
        body: Container(
          color: Colors.white,
          width: size.wScreen(100.0),
          height: size.hScreen(100.0),
          padding: EdgeInsets.only(
            top: size.iScreen(0.0),
            right: size.iScreen(0.0),
            left: size.iScreen(0.0),
          ),
          child: Center(
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
                          // Navigator.pushNamed(
                          //     context, 'ListaCoros');
                          Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => const ListaCoros()),
                          );
                        },
                        label: 'Coros',
                        icon: 'read.png',
                        color: Colors.green.shade800,
                      ),
                      ItemsMenuHome(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) =>
                                    const ListaCongregacionales()),
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
                          // Navigator.pushNamed(
                          //     context, 'novedades');
                          Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => const ListaAlabanzas()),
                          );
                        },
                        label: 'Alabanzas',
                        icon: 'karaoke.png',
                        color: const Color(0XFFF8922A),
                      ),
                      ItemsMenuHome(
                        onTap: () {
                          // Navigator.pushNamed(
                          //     context, 'novedades');
                          Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => const ListaCorosInfantiles()),
                          );
                        },
                        label: 'Coros Niños',
                        icon: 'children.png',
                        color: const Color(0XFF9C3DB0),
                      ),
                      ItemsMenuHome(
                        onTap: () {
                          // Navigator.pushNamed(
                          //     context, 'novedades');
                          Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => const ListaLibrosBiblia()),
                          );
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
        ),
      ),
    );
  }
}

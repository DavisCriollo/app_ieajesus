import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:ieanjesus/src/controllers/home_controller.dart';
import 'package:ieanjesus/src/utils/responsive.dart';
import 'package:provider/provider.dart';

class DetalleLibro extends StatefulWidget {
  final MapEntry<String, dynamic> libro;
  // final int idLibro;
  // final String nombreLibro;
  const DetalleLibro({Key? key, required this.libro}) : super(key: key);

  @override
  State<DetalleLibro> createState() => _DetalleLibroState();
}

class _DetalleLibroState extends State<DetalleLibro> {
  @override
  Widget build(BuildContext context) {
    final Responsive size = Responsive.of(context);
    // final controllerHome = context.read<HomeController>();

    // controllerHome.getDetallelibroBiblia[widget.idLibro];

    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: Text(
                widget.libro.key,
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
            body: Container(
              color: Colors.grey.shade100,
              width: size.wScreen(100.0),
              height: size.hScreen(100.0),
              padding: EdgeInsets.only(
                top: size.iScreen(0.0),
                right: size.iScreen(0.0),
                left: size.iScreen(0.0),
              ),
              child: ListView.builder(
                itemCount: widget.libro.value.length,
                itemBuilder: (BuildContext context, int index) {
                  final List<dynamic> _capitulo = widget.libro.value[index];

                  return ExpansionTile(
                      childrenPadding: EdgeInsets.symmetric(
                          horizontal: size.iScreen(0.5),
                          vertical: size.iScreen(0.0)),
                      tilePadding: EdgeInsets.symmetric(
                          horizontal: size.iScreen(1.0),
                          vertical: size.iScreen(0.0)),
                      title: Text('Capítulo ${index + 1}',
                          style: GoogleFonts.roboto(
                            fontSize: size.iScreen(1.8),
                            fontWeight: FontWeight.bold,
                            // color: Colors.grey,
                          )),
                      children: [
                        Wrap(
                            children: _capitulo.map((e) {
                          var index = _capitulo.indexOf(e);
                          return Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal: size.iScreen(0.1),
                                  vertical: size.iScreen(0.5)),
                              padding: EdgeInsets.symmetric(
                                  horizontal: size.iScreen(0.5),
                                  vertical: size.iScreen(0.0)),
                              child: Text.rich(
                                TextSpan(
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: '${index + 1} ',
                                        style: GoogleFonts.roboto(
                                          fontSize: size.iScreen(1.8),
                                          fontWeight: FontWeight.bold,
                                          // color: Colors.grey,
                                        )),
                                    TextSpan(
                                        text: ' $e ',
                                        style: GoogleFonts.roboto(
                                          fontSize: size.iScreen(1.8),
                                          fontWeight: FontWeight.normal,
                                          // color: Colors.grey,
                                        )),
                                  ],
                                ),
                              ));
                        }).toList())
                      ]);
                  //  [Text('Capítulo ${_capitulo[0]}')]);
                },
              ),
            )));
  }
}

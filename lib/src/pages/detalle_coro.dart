import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:ieanjesus/src/models/letra_musica_model.dart';
import 'package:ieanjesus/src/utils/responsive.dart';

class DetalleCoro extends StatelessWidget {
  final String titulo;
  final LetraMusica musica;
  const DetalleCoro({Key? key, required this.titulo, required this.musica})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Responsive size = Responsive.of(context);
    // final _musica=context.read<HomeController>();
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Letra de $titulo',
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
            margin: EdgeInsets.only(top: size.iScreen(0.0)),
            padding: EdgeInsets.symmetric(horizontal: size.iScreen(2.0)),
            width: size.wScreen(100.0),
            height: size.hScreen(100),
            child: SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.symmetric(vertical: size.iScreen(2.0)),
                width: size.wScreen(100.0),
                child: SelectableText(
                  '${musica.titulo}\n\n ${musica.letra!}',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.lexendDeca(
                      fontSize: size.iScreen(1.9),
                      // color: Colors.white,
                      fontWeight: FontWeight.normal),
                ),
              ),
            )));
  }
}

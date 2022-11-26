import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ieanjesus/src/controllers/home_controller.dart';

import 'package:ieanjesus/src/models/letra_musica_model.dart';
import 'package:ieanjesus/src/utils/responsive.dart';
import 'package:provider/provider.dart';

class DetalleCoro extends StatelessWidget {
  final String titulo;
  final LetraMusica musica;
  const DetalleCoro({Key? key, required this.titulo, required this.musica})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Responsive size = Responsive.of(context);
    final _musica = context.read<HomeController>();
    return Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              Text(
                'Letra de $titulo',
                style: GoogleFonts.roboto(
                    fontSize: size.iScreen(2.5),
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
                overflow: TextOverflow.ellipsis,
              ),
              const Spacer(),
              Consumer<HomeController>(
                builder: (_, valueSize, __) {
                  return Container(
                    width: size.iScreen(10.0),
                    // color: Colors.green,
                    child: Container(
                      // color: Colors.red,
                      child: Slider(
                          activeColor: Colors.green,
                          thumbColor: Colors.white,
                          inactiveColor: Colors.grey,
                          min: 2,
                          max: 10,
                          value: valueSize.getBtnSize,
                          onChanged: (_value) {
                            valueSize.setBtnSize(_value);
                          }),
                    ),
                  );
                },
              ),

              // Container(
              //   width: size.iScreen(10.0),
              //   // color: Colors.red,
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     children: [
              //       GestureDetector(
              //         onTap: () {
              //             if(_musica.getBtnSize>=1.5){

              //           _musica.setBtnSize(_musica.getBtnSize - 0.5);

              //               }
              //         },
              //         child: Text(
              //           "A",
              //           style: GoogleFonts.roboto(
              //               fontSize: size.iScreen(1.5),
              //               color: Colors.white,
              //               fontWeight: FontWeight.bold),
              //           overflow: TextOverflow.ellipsis,
              //         ),
              //       ),
              //       //***********************************************/
              //       SizedBox(
              //         width: size.iScreen(0.5),
              //       ),
              //       //*****************************************/
              //       GestureDetector(
              //         onTap: () {
              //           _musica.setBtnSize(1.9);
              //         },
              //         child: Text(
              //           "--",
              //           style: GoogleFonts.roboto(
              //               fontSize: size.iScreen(1.5),
              //               color: Colors.white,
              //               fontWeight: FontWeight.bold),
              //           overflow: TextOverflow.ellipsis,
              //         ),
              //       ),
              //       //***********************************************/
              //       SizedBox(
              //         width: size.iScreen(0.5),
              //       ),
              //       //*****************************************/
              //       GestureDetector(
              //         onTap: () {
              //            if(_musica.getBtnSize>=1.5 &&_musica.getBtnSize<=5.0){

              //              _musica.setBtnSize(_musica.getBtnSize + 0.5);

              //               }
              //         },
              //         child: Text(
              //           "A ",
              //           style: GoogleFonts.roboto(
              //               fontSize: size.iScreen(2.0),
              //               color: Colors.white,
              //               fontWeight: FontWeight.bold),
              //           overflow: TextOverflow.ellipsis,
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
            ],
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
                child: Consumer<HomeController>(
                  builder: (_, sizes, __) {
                    return GestureDetector(
                      onLongPress: () async {
                        await Clipboard.setData(ClipboardData(
                            text: "${musica.titulo}\n\n ${musica.letra!}"));

                        final snackBar = _sNackCopyLetra(
                            'Letra copiada', size, Colors.green);
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      },
                      child: Text(
                        '${musica.titulo}\n\n ${musica.letra!}',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.lexendDeca(
                            fontSize: size.iScreen(sizes.getBtnSize),
                            // color: Colors.white,
                            fontWeight: FontWeight.normal),
                      ),
                    );
                  },
                ),
              ),
            )));
  }

  //========================COPIA TEXTO=========================//
  SnackBar _sNackCopyLetra(String _info, Responsive size, Color _color) {
    return SnackBar(
      backgroundColor: _color,
      content: Text(_info,
          style: GoogleFonts.roboto(
              fontSize: size.iScreen(2.0), fontWeight: FontWeight.bold
              // color: Colors.white,
              )),
    );
  }
//=================================================//
}

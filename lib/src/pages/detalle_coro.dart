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
              Container(
                // color: Colors.red,
                // width: size.wScreen(50),
                child: Text(
                  titulo=='Coros Infantiles'?'Letra Coro Infantil':'Letra de $titulo',
                  style: GoogleFonts.roboto(
                      fontSize: size.iScreen(2.5),
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const Spacer(),
                 Container(
              margin: EdgeInsets.only(right: size.iScreen(1.0)),
              child: 
              Consumer<HomeController>(builder: (_, valueLetter, __) {  
                  return  IconButton(
                  splashRadius: 2.0,
                  icon: Icon(
                    Icons.text_increase_outlined,
                    size: size.iScreen(3.5),
                    color:valueLetter.getIsSizeText?Colors.green: Colors.white,
                  ),
                  onPressed: () {

                      valueLetter.setIsSizeText(!_musica.getIsSizeText);
                 });
              },)
             
            ),
            
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
            child: Stack(
              children: [
                SingleChildScrollView(
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
                ),
                Consumer<HomeController>(builder: (_, value, __) { 
return 
value.getIsSizeText
?Positioned(
                  right: 5.0,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Container(
                        // width: size.wScreen(100),
                        height: size.hScreen(15.0),
                        // margin: EdgeInsets.symmetric(horizontal: size.iScreen(3.0),vertical: size.iScreen(0.0)),
                        margin: EdgeInsets.only(
                            
                            left: size.wScreen(0.0)),
                        padding: EdgeInsets.symmetric(
                            horizontal: size.iScreen(0.0),
                            vertical: size.iScreen(0.0)),
                        color: const Color.fromARGB(72, 88, 85, 85),
                        child: 
                        Consumer<HomeController>(builder: (_, valueSize, __) {  
                            return  RotatedBox(
                                                  quarterTurns: 3,
                                                  child:
                                                  
                                                  
                                                  Slider(
                        activeColor: Colors.green,
                        thumbColor: Colors.white,
                        inactiveColor: Colors.grey,
                        min: 2,
                        max: 4,
                        value: valueSize.getBtnSize,
                        onChanged: (_value) {
                          valueSize.setBtnSize(_value);
                        }),
                                                );
                          
                        },),
                                               
                                                ),
                  ),
                ):Container();

                 },),
                
              ],
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

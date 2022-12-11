import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ieanjesus/src/urls/urls.dart';
import 'package:ieanjesus/src/utils/responsive.dart';
import 'package:intl/intl.dart';







class AcercaDePage extends StatelessWidget {
  const AcercaDePage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
      final Responsive size = Responsive.of(context);
     DateTime _now = DateTime.now();
     String _fechaYear = DateFormat.y().format(_now);
    return 
      Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title:const Text('Acerca de Nosotros'),
         flexibleSpace: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomCenter,
                  colors: <Color>[
                    Color(0XFF153E76),
                    Color(0XFF0076A7),
                   
                   
                  
                  ],
                ),
              ),
            ),
      ),
      body: SingleChildScrollView(
              child: Column(
          children: [
       
            SizedBox(
              height: size.iScreen(1),
            ),
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(
                  horizontal: size.iScreen(2.0), vertical: size.iScreen(0.0)),
              // color: Colors.blue,
              width: size.wScreen(100),
              child: Column(
                children: [
                  Column(
                    children: [
                 
                      Container(
                         margin: EdgeInsets.symmetric(
                  vertical: size.iScreen(1.6)),
                        child: Text(
                          'Esta aplicación, es diseñado por  "2JL Soluciones Integrales" , está protegido por derechos de autor y se distribuye bajo licencias que restringen la copia, distribución y descompilación.    ',
                          style: GoogleFonts.lexendDeca(
                              fontSize: size.iScreen(1.7),
                              color: Colors.black45,
                              fontWeight: FontWeight.normal),
                        ),
                      ),
                      
                    ],
                  ),
                  Container(
                     margin: EdgeInsets.only(
                  left: size.iScreen(2.0),right: size.iScreen(2.0), top: size.iScreen(5.0),bottom: size.iScreen(2.0)),
                    child: Text(
                      'Contáctenos:',
                      style: GoogleFonts.lexendDeca(
                          fontSize: size.iScreen(2.0),
                          color: Colors.black87,
                          fontWeight: FontWeight.normal),
                    ),
                  ),
                  SelectableText(
                            '0990421172',
                            style: GoogleFonts.lexendDeca(
                                fontSize: size.iScreen(2.0),
                                color: const Color(0xFF4064AD),
                                fontWeight: FontWeight.bold),
                          ),
                  Container(
                     margin: EdgeInsets.symmetric(
                   vertical: size.iScreen(1.0)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          child: Text(
                            'soporte@2jl.ec',
                            style: GoogleFonts.lexendDeca(
                                fontSize: size.iScreen(2.0),
                                color:const Color(0xFF4064AD),
                                fontWeight: FontWeight.bold),
                          ),
                          onTap: ()=>abrirPagina2Jl(),
                        ),
                        GestureDetector(
                                                child: Text(
                            'neitor2jl@gmail.com',
                            style: GoogleFonts.lexendDeca(
                                fontSize: size.iScreen(2.0),
                                color:const Color(0xFF4064AD),
                                fontWeight: FontWeight.bold),
                          ),
                          // onTap: ()=>abrirPaginaNeitor(),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      Container(
                         margin: EdgeInsets.symmetric(
                  horizontal: size.iScreen(2.0), vertical: size.iScreen(2.0)),
                        child: Text(
                          'Visita nuestra web',
                          style: GoogleFonts.lexendDeca(
                              fontSize: size.iScreen(2.0),
                              color: Colors.black87,
                              fontWeight: FontWeight.normal),
                        ),
                      ),
                      GestureDetector(
                                              child: Container(
                           margin: EdgeInsets.symmetric(
                  horizontal: size.iScreen(0.0), vertical: size.iScreen(0.5)),
                          child: Text(
                            'https://neitor.com',
                            style: GoogleFonts.lexendDeca(
                                fontSize: size.iScreen(2.0),
                                color:const Color(0xFF51C1E1),
                                fontWeight: FontWeight.normal),
                          ),
                        ),
                         onTap: ()=>abrirPaginaNeitor(),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                   
                      // INSTAGRAM
                _ItemsSocials(
                  size: size,
                  icon: FontAwesomeIcons.instagram,
                  color:const Color(0xFFD04768),
                  onTap: () => abrirPaginaNeitor(),
                ),
                //FACEBOOK
                _ItemsSocials(
                  size: size,
                  icon: FontAwesomeIcons.facebookF,
                  color:const Color(0xFF4064AD),
                  onTap: () => abrirPaginaNeitor(),
                ),

                //TWITTER
                _ItemsSocials(
                  size: size,
                  icon: FontAwesomeIcons.twitter,
                  color: const Color(0xFF00B1EA),
                  onTap: () => abrirPaginaNeitor(),
                ),
                    ],
                  ),
                  SizedBox(height: size.iScreen(5.0),),
  Container(
     margin: EdgeInsets.symmetric(
                  vertical: size.iScreen(1.6)),
    child: Text(
      'Copyright (c) $_fechaYear  "2JL Soluciones Integrales"  \n Reservados todos los derechos".',
      textAlign: TextAlign.center,
      style: GoogleFonts.lexendDeca(
          fontSize: size.iScreen(1.5),
          color: Colors.black,
          fontWeight: FontWeight.normal),
    ),
  ),



                ],
              ),
            ),
             
          ],
        ),
      ),
    );
  
  
  }
}
class _ItemsSocials extends StatelessWidget {
  final IconData icon;
  final Color color;
  final Function? onTap;

  const _ItemsSocials({
required this.size,
required this.icon,
required this.color,
    this.onTap,
  });

  final Responsive size;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
          margin: EdgeInsets.symmetric(
              horizontal: size.iScreen(1.0), vertical: size.iScreen(2.0)),
          padding: EdgeInsets.all(size.iScreen(1.2)),
          decoration: BoxDecoration(
              color: color, borderRadius: BorderRadius.circular(15.0)),
          child: Icon(
            icon,
            size: size.iScreen(3.0),
            color: Colors.white,
          )),
      onTap:()=> onTap ,
    );
  }
}

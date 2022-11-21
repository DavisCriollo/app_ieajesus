import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ieanjesus/src/urls/urls.dart';
import 'package:ieanjesus/src/utils/responsive.dart';
import 'package:intl/intl.dart';

class Dedicatoria extends StatelessWidget {
  const Dedicatoria({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Responsive size = Responsive.of(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Dedicatoria'),
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
        padding: EdgeInsets.symmetric(
            horizontal: size.iScreen(2.0), vertical: size.iScreen(1.0)),
        child: Text(
          'Quieremos agradecer principalmente a Dios, por ser el motivo de inspitación y darnos fuerzas necesarias para continuar en su camino y poder realizar este aporte.\n\nA nuestro pastor, por sus oraciones, consejos y guía mediante la palabra de Dios.\n\nA cada uno de los integrantes del comité de música de la congregación por su paciencia,colaboración y apoyo para que este proyecto se haga realidad.\n \n Dedicamos este proyecto a todos y cada uno de los hermanos en la fé de la IEANJESUS  "LA ALBORADA",quienes han sido mi motivo principal para la realización de este proyecto,el cual está compuesto por la letra de los coros, himnos y alabanzas que cantamos con gran amor y ferbor a nuestro salvador Jesucristo.\n\n Esperando que sea de apoyo para así juntos aprender estas hermosas letras y seguier cantando con entendimiento a la roca de nuestra salvación en el diario peregrinar por el camino del evangelio.   \n\n\n Dios les bendiga. \n\n\n Atentamente . \n\n\n El Comité de música  "La Alborada".',

          

          style: GoogleFonts.roboto(
              fontSize: size.iScreen(1.8),
              color: Colors.black,
              fontWeight: FontWeight.normal,
              letterSpacing: 0.3)
              ,
        ),
      ),
    );
  }
}

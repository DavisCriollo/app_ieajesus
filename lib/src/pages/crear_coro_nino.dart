import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ieanjesus/src/controllers/home_controller.dart';
import 'package:ieanjesus/src/utils/letras_mayusculas_minusculas.dart';
import 'package:ieanjesus/src/utils/responsive.dart';

import 'package:provider/provider.dart';

class CrearCoroNino extends StatefulWidget {
    final String estado;
  const CrearCoroNino({Key? key, required this.estado}) : super(key: key);

  @override
  State<CrearCoroNino> createState() => _CrearCoroNinoState();
}

class _CrearCoroNinoState extends State<CrearCoroNino> {
  @override
  Widget build(BuildContext context) {
    final Responsive size = Responsive.of(context);

    final controllerCoroNino = context.read<HomeController>();

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Crear Coro Infantil',
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
          actions: [
            // (logisticaController.getNombreCliente!.isNotEmpty &&
            //         logisticaController.getNombreGuardia!.isNotEmpty)
            //     ?
            Container(
              margin: EdgeInsets.only(right: size.iScreen(1.5)),
              child: IconButton(
                  splashRadius: 28,
                  onPressed: () {
                    _onSubmit(context);
                  },
                  icon: Icon(
                    Icons.save_outlined,
                    // Icons.done_outline,
                    size: size.iScreen(4.0),
                  )),
            )
            // : const SizedBox(),
          ],
        ),
        body: Container(
          color: Colors.grey.shade100,
          width: size.wScreen(100.0),
          height: size.hScreen(100.0),
          margin: EdgeInsets.symmetric(horizontal: size.iScreen(1.0)),
          padding: EdgeInsets.only(
            top: size.iScreen(0.0),
            right: size.iScreen(0.0),
            left: size.iScreen(0.0),
          ),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Form(
              key: controllerCoroNino.coroNinoFormKey,
              child: Column(
                children: [
                  //***********************************************/
                  SizedBox(
                    height: size.iScreen(1.0),
                  ),
                  //*****************************************/
                  SizedBox(
                    width: size.wScreen(100.0),

                    // color: Colors.blue,
                    child: Text('Título:',
                        style: GoogleFonts.lexendDeca(
                            // fontSize: size.iScreen(2.0),
                            fontWeight: FontWeight.normal,
                            color: Colors.grey)),
                  ),
                  TextFormField(
                     initialValue: controllerCoroNino.getTituloCoroNino,
                     inputFormatters: [
                        UpperCaseText(),
                      ],
                    decoration: const InputDecoration(
                        // suffixIcon: Icon(Icons.beenhere_outlined)
                        ),
                    textAlign: TextAlign.start,
                    style: const TextStyle(

                        ),
                    onChanged: (text) {
                      controllerCoroNino.setTituloCoroNino(text);
                    },
                    validator: (text) {
                      if (text!.trim().isNotEmpty) {
                        return null;
                      } else {
                        return 'Ingrese título del coro';
                      }
                    },
                  ),
                  //***********************************************/
                  SizedBox(
                    height: size.iScreen(1.0),
                  ),
                  //*****************************************/
                  Container(
                    width: size.wScreen(100.0),

                    // color: Colors.blue,
                    child: Text('Letra:',
                        style: GoogleFonts.lexendDeca(
                            // fontSize: size.iScreen(2.0),
                            fontWeight: FontWeight.bold,
                            color: Colors.grey)),
                  ),
                  TextFormField(
                     initialValue: controllerCoroNino.getletraCoroNino,
                    maxLines: 30,
                    minLines: 30,
                    decoration: const InputDecoration(
                        // suffixIcon: Icon(Icons.beenhere_outlined)
                        ),
                    textAlign: TextAlign.center,
                    style: const TextStyle(

                        // fontSize: size.iScreen(3.5),
                        // fontWeight: FontWeight.bold,
                        // letterSpacing: 2.0,
                        ),
                    onChanged: (text) {
                   controllerCoroNino.setLetraCoroNino(text);
                    },
                    validator: (text) {
                      if (text!.trim().isNotEmpty) {
                        return null;
                      } else {
                        return 'Ingrese letra del coro';
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
         
        ),
      ),
    );
  }

  //********************************************************************************************************************//
  void _onSubmit(BuildContext context,) async {
     final controllerInfantiles=context.read<HomeController>();
    final isValid = controllerInfantiles.validateFormCoroNino();
    if (!isValid) return;
    if (isValid) {
      
 if (widget.estado=='new') {
        await controllerInfantiles.crearInfantil();
      } else if (widget.estado=='edit')  {
        await controllerInfantiles.editarInfantil();
       
      }



      Navigator.pop(context);
    }
  }
}

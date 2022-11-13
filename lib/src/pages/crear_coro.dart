import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ieanjesus/src/controllers/home_controller.dart';
import 'package:ieanjesus/src/utils/letras_mayusculas_minusculas.dart';
import 'package:ieanjesus/src/utils/responsive.dart';

import 'package:provider/provider.dart';

class CrearCoro extends StatefulWidget {
  final String estado;
  const CrearCoro({Key? key, required this.estado}) : super(key: key);

  @override
  State<CrearCoro> createState() => _CrearCoroState();
}

class _CrearCoroState extends State<CrearCoro> {
  @override
  Widget build(BuildContext context) {
    final Responsive size = Responsive.of(context);

    final controllerCoro = context.read<HomeController>();

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Crear Coro',
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
              key: controllerCoro.coroFormKey,
              child: Column(
                children: [
                  //***********************************************/
                  SizedBox(
                    height: size.iScreen(1.0),
                  ),
                  //*****************************************/
                  Container(
                    width: size.wScreen(100.0),

                    // color: Colors.blue,
                    child: Text('Título:',
                        style: GoogleFonts.lexendDeca(
                            // fontSize: size.iScreen(2.0),
                            fontWeight: FontWeight.normal,
                            color: Colors.grey)),
                  ),
                  TextFormField(
                    initialValue: controllerCoro.getTituloCoro,
                    inputFormatters: [
                      UpperCaseText(),
                    ],
                    decoration: const InputDecoration(
                        // suffixIcon: Icon(Icons.beenhere_outlined)
                        ),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      // fontSize: size.iScreen(3.5),
                      fontWeight: FontWeight.bold,
                      // letterSpacing: 2.0,
                    ),
                    onChanged: (text) {
                      controllerCoro.setTituloCoro(text);
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
                            fontWeight: FontWeight.normal,
                            color: Colors.grey)),
                  ),
                  TextFormField(
                    initialValue: controllerCoro.getletraCoro,
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
                      controllerCoro.setLetraCoro(text);
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
  void _onSubmit(BuildContext context) async {
    final controllerCoro=context.read<HomeController>();
    final isValid = controllerCoro.validateFormCoro();
    if (!isValid) return;
    if (isValid) {
      if (widget.estado=='new') {
        await controllerCoro.crearCoro();
      } else if (widget.estado=='edit') {
        await controllerCoro.editarCoro();
      
      }

      Navigator.pop(context);
    }
  }
}

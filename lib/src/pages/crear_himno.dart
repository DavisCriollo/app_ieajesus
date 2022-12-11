import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ieanjesus/src/controllers/home_controller.dart';
import 'package:ieanjesus/src/utils/letras_mayusculas_minusculas.dart';
import 'package:ieanjesus/src/utils/responsive.dart';

import 'package:provider/provider.dart';

class CrearHimno extends StatefulWidget {
  final String estado;
  const CrearHimno({Key? key, required this.estado}) : super(key: key);

  @override
  State<CrearHimno> createState() => _CrearHimnoState();
}

class _CrearHimnoState extends State<CrearHimno> {
  @override
  Widget build(BuildContext context) {
    final Responsive size = Responsive.of(context);

    final controllerHimno = context.read<HomeController>();

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Crear Himno',
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
              key: controllerHimno.himnoFormKey,
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
                            fontWeight: FontWeight.bold,
                            color: Colors.grey)),
                  ),
                  TextFormField(
                     initialValue: controllerHimno.getTituloHimno,
                     inputFormatters: [
                        UpperCaseText(),
                      ],
                    decoration: const InputDecoration(
                        // suffixIcon: Icon(Icons.beenhere_outlined)
                        ),
                    textAlign: TextAlign.center,
                    style: const TextStyle(

                 
                        ),
                    onChanged: (text) {
                      controllerHimno.setTituloHimno(text);
                    },
                    validator: (text) {
                      if (text!.trim().isNotEmpty) {
                        return null;
                      } else {
                        return 'Ingrese título del himno';
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
                    initialValue: controllerHimno.getletraHimno,
                    maxLines: 30,
                    minLines: 30,
                    decoration: const InputDecoration(
                        // suffixIcon: Icon(Icons.beenhere_outlined)
                        ),
                    textAlign: TextAlign.center,
                    style: const TextStyle(

                   
                        ),
                    onChanged: (text) {
                      controllerHimno.setLetraHimno(text);
                    },
                    validator: (text) {
                      if (text!.trim().isNotEmpty) {
                        return null;
                      } else {
                        return 'Ingrese letra del himno';
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
          //
        ),
      ),
    );
  }

  //********************************************************************************************************************//
  void _onSubmit(BuildContext context) async {
    final controllerHimno=context.read<HomeController>();
    final isValid = controllerHimno.validateFormHimno();
    if (!isValid) return;
    if (isValid) {
     if (widget.estado=='new')  {
        await controllerHimno.crearHimno();
      } else if (widget.estado=='edit') {
        await controllerHimno.editarHimno();
       
      }
      Navigator.pop(context);
    }
  }
}

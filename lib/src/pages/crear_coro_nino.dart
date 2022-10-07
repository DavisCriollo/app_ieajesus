import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ieanjesus/src/controllers/home_controller.dart';
import 'package:ieanjesus/src/utils/responsive.dart';
import 'package:ieanjesus/src/utils/theme.dart';
import 'package:provider/provider.dart';

class CrearCoroNino extends StatefulWidget {
  const CrearCoroNino({Key? key}) : super(key: key);

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
                    _onSubmit(context, controllerCoroNino);
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
                    decoration: const InputDecoration(
                        // suffixIcon: Icon(Icons.beenhere_outlined)
                        ),
                    textAlign: TextAlign.start,
                    style: const TextStyle(

                        // fontSize: size.iScreen(3.5),
                        // fontWeight: FontWeight.bold,
                        // letterSpacing: 2.0,
                        ),
                    onChanged: (text) {
                      // avisoSalidaController.onDetalleChange(text);
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
                    maxLines: 30,
                    minLines: 1,
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
                      // avisoSalidaController.onDetalleChange(text);
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
          // ListView.builder(
          //      physics: const BouncingScrollPhysics(),
          //   itemCount: 50,
          //   itemBuilder: (BuildContext context, int index) {
          //     return

          //         Column(
          //       children: [
          //         Container(
          //          color: Colors.white,
          //           child: ListTile(
          //             dense: true,
          //             visualDensity:VisualDensity.compact,
          //             title: Text(
          //               'Coro $index',
          //               overflow: TextOverflow.ellipsis,
          //               style: GoogleFonts.roboto(
          //                   // fontSize: size.iScreen(1.8),
          //                   // color: Colors.black87,
          //                   fontWeight: FontWeight.normal),
          //             ),
          //             subtitle: Text(
          //               'Tono: Do+',
          //               overflow: TextOverflow.ellipsis,
          //               style: GoogleFonts.roboto(
          //                   // fontSize: size.iScreen(1.8),
          //                   // color: Colors.black87,
          //                   fontWeight: FontWeight.normal),
          //             ),
          //             trailing: const Icon(Icons.chevron_right),
          //           ),
          //         ),
          //        Container(width: size.wScreen(100),height:size.iScreen(0.2),)
          //       ],
          //     );
          //   },
          // ),
        ),
      ),
    );
  }

  //********************************************************************************************************************//
  void _onSubmit(BuildContext context, HomeController coroNinoFormKey) async {
    final isValid = coroNinoFormKey.validateFormCoroNino();
    if (!isValid) return;
    if (isValid) {
      // ProgressDialog.show(context);
      // await controllerCoro.crearAvisoSalida(context);
      // await controller.upLoadImagen();
      // ProgressDialog.dissmiss(context);
      Navigator.pop(context);
    }
  }
}

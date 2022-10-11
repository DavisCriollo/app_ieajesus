import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ieanjesus/src/controllers/home_controller.dart';
import 'package:ieanjesus/src/pages/detalle_libro_biblia.dart';
import 'package:ieanjesus/src/pages/no_data.dart';
import 'package:ieanjesus/src/utils/responsive.dart';
import 'package:ieanjesus/src/utils/theme.dart';
import 'package:provider/provider.dart';

class ListaLibrosBiblia extends StatefulWidget {
  const ListaLibrosBiblia({Key? key}) : super(key: key);

  @override
  State<ListaLibrosBiblia> createState() => _ListaLibrosBibliaState();
}

class _ListaLibrosBibliaState extends State<ListaLibrosBiblia> {
  @override
  Widget build(BuildContext context) {
    final Responsive size = Responsive.of(context);
    final controllerHome= context.read<HomeController>();
    controllerHome.getTodosLosibrosBiblia();
//  print('object asdasd ${controllerHome.getlistalibrosBiblia.length}');
    
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Santa Biblia',
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
          child: 
          
          Consumer<HomeController>(builder: (_, valueLibros, __) {  

// print('object ${valueLibros.getlistalibrosBiblia.length}');
 if (valueLibros.getErrorLibrosBliblia == null) {
                return Center(
                  // child: CircularProgressIndicator(),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Cargando Datos...',
                        style: GoogleFonts.lexendDeca(
                            fontSize: size.iScreen(1.5),
                            color: Colors.black87,
                            fontWeight: FontWeight.bold),
                      ),
                      //***********************************************/
                      SizedBox(
                        height: size.iScreen(1.0),
                      ),
                      //*****************************************/
                      const CircularProgressIndicator(),
                    ],
                  ),
                );
              } else if (valueLibros.getErrorLibrosBliblia == false) {
                return const NoData(
                  label: 'No existen datos para mostar',
                );
              } else if (valueLibros.getlistalibrosBiblia.isEmpty) {
                return const NoData(
                  label: 'No existen datos para mostar',
                );
                // Text("sin datos");
              }



            return  ListView.builder(
               physics: const BouncingScrollPhysics(),
            itemCount:valueLibros.getlistalibrosBiblia.length,
            itemBuilder: (BuildContext context, int index) {

                    final _libro=valueLibros.getlistalibrosBiblia[index];

              return
                 
                  Column(
                children: [
                  Container(
                   color: Colors.white,
                    child: ListTile(
                      dense: true,
                      visualDensity:VisualDensity.compact,
                      title: Text(
                        '$_libro',
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.roboto(
                            fontSize: size.iScreen(1.8),
                            // color: Colors.black87,
                            fontWeight: FontWeight.bold),
                      ),
                      // subtitle: Text(
                      //   'Tono: Do+',
                      //   overflow: TextOverflow.ellipsis,
                      //   style: GoogleFonts.roboto(
                      //       // fontSize: size.iScreen(1.8),
                      //       // color: Colors.black87,
                      //       fontWeight: FontWeight.normal),
                      // ),
                      trailing: const Icon(Icons.chevron_right),
                      onTap: (){
                         Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) =>  DetalleLibro( idLibro: index, nombreLibro: '$_libro',)),
                      );
                      },
                    ),
                  ),
                 Container(width: size.wScreen(100),height:size.iScreen(0.2),)
                ],
              );
          
          
          
          
            },
          );
       
          },)
          
         
        ),
      ),
    );
  }
}

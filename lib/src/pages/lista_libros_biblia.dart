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
  final TextEditingController _textSearchBibliaController =
      TextEditingController();

  @override
  void dispose() {
    _textSearchBibliaController.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Responsive size = Responsive.of(context);
    final controllerHome = context.read<HomeController>();
    // controllerHome.getTodosLosibrosBiblia();
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
          actions: [
            Consumer<HomeController>(builder: (_, _valueLikes, __) { 
 return  Container(
              margin: EdgeInsets.symmetric(horizontal: size.iScreen(0.5)),
              child: IconButton(
                  splashRadius: 2.0,
                  icon: 
                  Icon(
                   _valueLikes.getListaFavoritos.isNotEmpty?Icons.favorite: Icons.favorite_border,
                    size: size.iScreen(3.5),
                    color: _valueLikes.getListaFavoritos.isNotEmpty?Colors.red[900]: Colors.white,
                  ),
                  onPressed: _valueLikes.getListaFavoritos.isNotEmpty?() {
                   controllerHome.listarAllFavoritos('');
                    Navigator.pushNamed(context, 'favoritosBiblia');
                   
                  }:null),
            );
             },),
           
            Container(
              margin: EdgeInsets.symmetric(horizontal: size.iScreen(3.0)),
              child: IconButton(
                  splashRadius: 2.0,
                  icon: Icon(
                    Icons.search,
                    size: size.iScreen(3.5),
                    color: Colors.white,
                  ),
                  onPressed: () {

                    Navigator.pushNamed(context, 'buscarBiblia');
                     controllerHome.setlistaBibliaSearch([]);
                    // providerSearchBiblia.listarAllCoros('');
                    // providerSearchBiblia.setBtnSearchBiblia(!providerSearchBiblia.btnSearchBiblia);
                    // _textSearchBibliaController.text = "";
                  }),
            ),
          ],
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
        //  appBar: AppBar(


        body: Container(
            color: Colors.grey.shade100,
            width: size.wScreen(100.0),
            height: size.hScreen(100.0),
            padding: EdgeInsets.only(
              top: size.iScreen(0.0),
              right: size.iScreen(0.0),
              left: size.iScreen(0.0),
            ),
            child: Consumer<HomeController>(
              builder: (_, valueLibros, __) {
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
                } else if (valueLibros.getlistalibrosBibliaCompleta.isEmpty) {
                  return const NoData(
                    label: 'No existen datos para mostar',
                  );
                  // Text("sin datos");
                }

               

                return 
               
                
                SingleChildScrollView(
                  child: 
                  Wrap(
                      children:
                          valueLibros.getlistalibrosBibliaCompleta.entries.map(
                    (e) {
                    
                      return
                          // Text(e.key);
                          Container(
                        color: Colors.white,
                        child: ListTile(
                          dense: false,
                          visualDensity: VisualDensity.compact,
                          title: Text(
                          e.key.replaceAll('Ê', "É"),
                         
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.roboto(
                                fontSize: size.iScreen(1.8),
                                color: Colors.black87,
                                fontWeight: FontWeight.bold),
                          ),
                          trailing: const Icon(Icons.chevron_right),
                          onTap: () {

                            controllerHome.resetFormCoros();
                            final _data=
                            {
                              "libro":e.key,
                              "versiculo":e.value,

                            };
                              Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) => DetalleLibro(
                                    libro:_data,searchPage: 0,)
                            ),
                            );
                          },
                        ),
                      );
                    },
                  ).toList()));
               
               
                // );
               
              },
            )),
      ),
    );
  }
}

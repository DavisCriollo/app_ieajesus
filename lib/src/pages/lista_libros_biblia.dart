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
            Consumer<HomeController>(
              builder: (_, _valueLikes, __) {
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: size.iScreen(0.5)),
                  child: IconButton(
                      splashRadius: 2.0,
                      icon: Icon(
                        _valueLikes.getListAuxFavoritos.isNotEmpty
                            ? Icons.favorite
                            : Icons.favorite_border,
                        size: size.iScreen(3.5),
                        color: _valueLikes.getListAuxFavoritos.isNotEmpty
                            ? Colors.red[900]
                            : Colors.white,
                      ),
                      onPressed: _valueLikes.getListAuxFavoritos.isNotEmpty
                          ? () {
                              controllerHome.setIsSizeBiblia(false);
                              
                              controllerHome.setIsSizeText(false);
controllerHome.setIsSizeTextFavoritos(false);
                              controllerHome.validaDataDispositivo();
                              Navigator.pushNamed(context, 'favoritosBiblia');
                            }
                          : null),
                );
              },
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: size.iScreen(1.0)),
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
            Container(
              margin: EdgeInsets.only(right: size.iScreen(1.0)),
              child: IconButton(
                  splashRadius: 2.0,
                  icon: Icon(
                    Icons.text_increase_outlined,
                    size: size.iScreen(3.5),
                    color: Colors.white,
                  ),
                  onPressed: () {

                      controllerHome.setIsSizeBiblia(!controllerHome.getIsSizeBiblia);
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

                    //  SingleChildScrollView(
                    //     child: Wrap(
                    //         children: valueLibros
                    //             .getlistalibrosBibliaCompleta.entries
                    //             .map(
                    //   (e) {
                    //     return
                    //         // Text(e.key);
                    //         Container(
                    //       color: Colors.white,
                    //       child: ListTile(
                    //         dense: false,
                    //         visualDensity: VisualDensity.compact,
                    //         title: Text(
                    //           e.key.replaceAll('Ê', "É"),
                    //           overflow: TextOverflow.ellipsis,
                    //           style: GoogleFonts.roboto(
                    //               fontSize: size.iScreen(1.8),
                    //               color: Colors.black87,
                    //               fontWeight: FontWeight.bold),
                    //         ),
                    //         trailing: const Icon(Icons.chevron_right),
                    //         onTap: () {
                    //           controllerHome.resetFormCoros();
                    //           final _data = {
                    //             "libro": e.key,
                    //             "versiculo": e.value,
                    //           };
                    //           Navigator.of(context).push(
                    //             MaterialPageRoute(
                    //                 builder: (context) => DetalleLibro(
                    //                       libro: _data,
                    //                       searchPage: 0,
                    //                     )),
                    //           );
                    //         },
                    //       ),
                    //     );
                    //   },
                    // ).toList()));
                    Stack(
                      children: [
                       
                        ListView.builder(
                  itemCount: valueLibros.getlistalibrosBibliaCompleta.length,
                  itemBuilder: (BuildContext context, int index) {
                        List<Map<String, dynamic>> _librosBiblia = [];
                        for (var e
                            in valueLibros.getlistalibrosBibliaCompleta.entries) {
                          _librosBiblia.add({
                            "libro": e.key,
                            "versiculo": e.value,
                          });
                        }

                        final _libros = _librosBiblia;
                        // print('ESTE ES EL DATO:${_librosBiblia}');

                        return Card(
                          margin:EdgeInsets.symmetric(vertical: size.iScreen(0.3)),
                          child: Container(
                            color: Colors.white,
                            child: ListTile(
                              dense: false,
                              visualDensity: VisualDensity.compact,
                              title: Text(
                                // _libros[index].keys.replaceAll('Ê', "É"),
                                _libros[index]["libro"].replaceAll('Ê', "É"),
                                // "_libros",
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.roboto(
                                    // fontSize: size.iScreen(1.8),
                                    fontSize: size.iScreen( valueLibros.getSizeLetter),
                                    color: 
                                    index<=4
                                    ?Colors.green
                                    : index>=5 && index<=16
                                    ? Colors.brown
                                    :index>=17 && index<=21
                                    ?Colors.red
                                     :index>=21 && index<=26
                                    ?Colors.green[800]
                                    :index>=27 && index<=32
                                    ?Colors.blue
                                    :index>=31 && index<=38
                                    ?const Color.fromARGB(255, 16, 94, 104)
                                    :index>=39 && index<=42
                                    ?Colors.purple
                                    :index>=44 && index<=57
                                    ?const Color(0XFFC58940)
                                    :index>=58 && index<=64
                                    ?const Color.fromARGB(255, 32, 79, 233)
                                    :const Color(0XFFFF6D28),
                        
                        
                        
                                    fontWeight: FontWeight.bold),
                              ),
                              trailing: const Icon(Icons.chevron_right),
                              onTap: () {
                                controllerHome.resetFormCoros();
                                controllerHome.setAction(false);
                                controllerHome.setIsSizeText(false);
                                   controllerHome.setIsSizeBiblia(false);
                                    controllerHome.setIsSizeTextFavoritos(false);
                                final _data = {
                                  "libro": _libros[index]["libro"],
                                  "versiculo": _libros[index]["versiculo"],
                                };
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                      builder: (context) => DetalleLibro(
                                            libro: _data,
                                            searchPage: 0,
                                          )),
                                );
                              },
                            ),
                          ),
                        );
                  },
                ),
                Consumer<HomeController>(builder: (_, value, __) { 
return 
value.getIsSizeBiblia
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
                        max: 3,
                        value: valueSize.getSizeLetter,
                        onChanged: (_value) {
                          valueSize.setSizeLetter(_value);
                        }),
                                                );
                          
                        },),
                                               
                                                ),
                  ),
                ):Container();

                 },),
                
                      
                      
                      
                      
                      
                      ],
                    );

                // );
              },
            )),
      ),
    );
  }
PopupMenuItem _buildPopupMenuItem(
      String title) {
    return PopupMenuItem(
      child:  Text(title),
    );
  }


}

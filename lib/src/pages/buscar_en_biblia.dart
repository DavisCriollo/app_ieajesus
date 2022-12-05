import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:ieanjesus/src/controllers/home_controller.dart';
import 'package:ieanjesus/src/models/letra_musica_model.dart';
import 'package:ieanjesus/src/pages/crear_coro.dart';
import 'package:ieanjesus/src/pages/detalle_coro.dart';
import 'package:ieanjesus/src/pages/detalle_libro_biblia.dart';
import 'package:ieanjesus/src/pages/no_data.dart';
import 'package:ieanjesus/src/utils/responsive.dart';
import 'package:ieanjesus/src/utils/theme.dart';
import 'package:provider/provider.dart';

class BusquedasBiblia extends StatefulWidget {
  const BusquedasBiblia({Key? key}) : super(key: key);

  @override
  State<BusquedasBiblia> createState() => _BusquedasBibliaState();
}

class _BusquedasBibliaState extends State<BusquedasBiblia> {
  final TextEditingController _textSearchControllerBiblia =
      TextEditingController();
//  Map<String, dynamic> ? _textosBiblia={};

  @override
  void dispose() {
    _textSearchControllerBiblia.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Responsive size = Responsive.of(context);
    final controllerHome = context.read<HomeController>();

    // controllerHome.getTodosLosibrosBiblia();

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Colors.green.shade50,
        appBar: AppBar(
          title: Consumer<HomeController>(
            builder: (_, providerSearch, __) {
              return Row(
                children: [
                  Expanded(
                    child: Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: size.iScreen(0.1)),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(5.0),
                          child: Row(
                            children: [
                              Expanded(
                                child: Container(
                                  // margin: EdgeInsets.symmetric(
                                  //     horizontal: size.iScreen(0.0)),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: size.iScreen(0.5),
                                      vertical: size.iScreen(0.0)),
                                  color: Colors.white,
                                  height: size.iScreen(4.0),
                                  child: TextField(
                                    controller: _textSearchControllerBiblia,
                                    autofocus: true,
                                    onChanged: (text) {
                                      providerSearch.onSearchTextBiblia(text);
                                    },
                                    decoration: const InputDecoration(
                                      // icon: Icon(Icons.search),
                                      border: InputBorder.none,
                                      hintText: 'Buscar...',
                                    ),
                                  ),
                                ),
                              ),
                              GestureDetector(
                                child: Container(
                                  decoration: const BoxDecoration(
                                    color: Colors.grey,
                                    border:
                                        // Border.all(
                                        //     color: Colors.white)
                                        Border(
                                      left: BorderSide(
                                          width: 0.0, color: Colors.grey),
                                    ),
                                  ),
                                  height: size.iScreen(4.0),
                                  width: size.iScreen(3.0),
                                  child: const Icon(Icons.search,
                                      color: Colors.white),
                                ),
                                onTap: () {
                                  print('BUSCAR');
                                  _textSearchControllerBiblia.text = '';
                                  providerSearch.setlistaBibliaSearch([]);
                                },
                              )
                            ],
                          ),
                        )
                        // (providerSearch.btnSearch)
                        // ?
                        // :
                        // Container(
                        //     alignment: Alignment.center,
                        //     width: size.wScreen(90.0),
                        //     child: Text(
                        //       'Buscar texto',
                        //       style: GoogleFonts.lexendDeca(
                        //           fontSize: size.iScreen(2.45),
                        //           color: Colors.white,
                        //           fontWeight: FontWeight.normal),
                        //     ),
                        //   ),
                        ),
                  ),
                  //***********************************************/
                  SizedBox(
                    width: size.iScreen(1.0),
                  ),
                  //*****************************************/
                  Container(
                    alignment: Alignment.center,
                    // width: size.wScreen(90.0),
                    child: Text(
                      'Total: ${providerSearch.getlistaBibliaSearch.length}',
                      style: GoogleFonts.lexendDeca(
                          fontSize: size.iScreen(1.5),
                          color: Colors.white,
                          fontWeight: FontWeight.normal),
                    ),
                  ),
                ],
              );
            },
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
          child: Consumer<HomeController>(
            builder: (_, valueSearch, __) {
              if (valueSearch.getlistaBibliaSearch.isEmpty) {
                return const NoData(
                  label: 'No existen datos para mostar',
                );
                // Text("Error al cargar los datos");
              } else if (valueSearch.getlistaBibliaSearch.isEmpty) {
                return const NoData(
                  label: 'No existen datos para mostar',
                );
              }

              return ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: valueSearch.getlistaBibliaSearch.length,
                itemBuilder: (BuildContext context, int index) {
                  final _libro = valueSearch.getlistaBibliaSearch[index];

                  return Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          final _data = {
                            "libro": _libro['nombrelibro'],
                            "versiculo": _libro['libro'],
                          };
                          //  controllerHome.setPageCapitulo(controllerHome.getPageCapitulo! + 1);
                          valueSearch.setPageCapitulo(_libro['capitulo'] - 1);
                          // valueSearch.setPageCapitulo(5);

                          Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => DetalleLibro(
                                    libro: _data,
                                    searchPage: _libro['capitulo'] - 1,
                                    searchVersoPage: _libro['verso'])),
                          );

                          // print('ESTE ES EL LIBRO:${_data}');
                        },
                        child: Container(
                          margin: EdgeInsets.symmetric(
                              vertical: size.iScreen(0.1),
                              horizontal: size.iScreen(1.0)),
                          color: Colors.white,
                          child: ListTile(
                            dense: true,
                            visualDensity: VisualDensity.compact,
                            title: Text(
                              '${_libro['texto'].replaceAll("/n", "")}',
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.roboto(
                                  fontSize: size.iScreen(1.7),
                                  // color: Colors.black87,
                                  fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(
                              '${_libro['nombrelibro'].replaceAll('Ê', "É")} ${_libro['capitulo']}:${_libro['verso']}',
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.roboto(
                                  // fontSize: size.iScreen(1.8),
                                  // color: Colors.black87,
                                  fontWeight: FontWeight.normal),
                            ),
                            trailing: const Icon(Icons.chevron_right),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ieanjesus/src/controllers/home_controller.dart';
import 'package:ieanjesus/src/models/letra_musica_model.dart';
import 'package:ieanjesus/src/models/session.dart';
import 'package:ieanjesus/src/pages/crear_coro_nino.dart';
import 'package:ieanjesus/src/pages/detalle_coro.dart';
import 'package:ieanjesus/src/pages/no_data.dart';
import 'package:ieanjesus/src/utils/responsive.dart';
import 'package:ieanjesus/src/utils/theme.dart';
import 'package:provider/provider.dart';

class ListaCorosInfantiles extends StatefulWidget {
    final Session? user;
  const ListaCorosInfantiles({Key? key, this.user}) : super(key: key);

  @override
  State<ListaCorosInfantiles> createState() => _ListaCorosInfantilesState();
}

class _ListaCorosInfantilesState extends State<ListaCorosInfantiles> {
  final TextEditingController _textSearchController = TextEditingController();
  @override
  void dispose() {
    _textSearchController.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Responsive size = Responsive.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Consumer<HomeController>(
          builder: (_, providerSearch, __) {
            return Row(
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: size.iScreen(0.1)),
                    child: (providerSearch.btnSearchInfantiles)
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(5.0),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    // margin: EdgeInsets.symmetric(
                                    //     horizontal: size.iScreen(0.0)),
                                    padding: EdgeInsets.symmetric(
                                        horizontal: size.iScreen(1.5)),
                                    color: Colors.white,
                                    height: size.iScreen(4.0),
                                    child: TextField(
                                      controller: _textSearchController,
                                      autofocus: true,
                                      onChanged: (text) {
                                        providerSearch
                                            .onSearchTextInfantiles(text);
                                        // setState(() {});
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
                                    // _textSearchController.text = '';
                                  },
                                )
                              ],
                            ),
                          )
                        : Container(
                            alignment: Alignment.center,
                            width: size.wScreen(90.0),
                            child: Text(
                              'INFANTILES  ${providerSearch.getListaInfantiles.length}',
                              style: GoogleFonts.lexendDeca(
                                  fontSize: size.iScreen(2.45),
                                  color: Colors.white,
                                  fontWeight: FontWeight.normal),
                            ),
                          ),
                  ),
                ),
                
                IconButton(
                    splashRadius: 2.0,
                    icon: (!providerSearch.btnSearchInfantiles)
                        ? Icon(
                            Icons.search,
                            size: size.iScreen(3.5),
                            color: Colors.white,
                          )
                        : Icon(
                            Icons.clear,
                            size: size.iScreen(3.5),
                            color: Colors.white,
                          ),
                    onPressed: () {
                      // providerSearch.setBtnSearchInfantiles(
                      //     !providerSearch.btnSearchInfantiles);
                      // _textSearchController.text = "";
                        providerSearch.listarAllInfantiles('');
                        providerSearch.setBtnSearchInfantiles(!providerSearch.btnSearchInfantiles);
                        _textSearchController.text = "";
                    }),
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
          builder: (_, valueListaInfantiles, __) {
            if (valueListaInfantiles.getErrorListaInfantiles == null) {
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
            } else if (valueListaInfantiles.getErrorListaInfantiles == false) {
              return const NoData(
                label: 'No existen datos para mostar',
              );
              // Text("Error al cargar los datos");
            } else if (valueListaInfantiles.getListaInfantiles.isEmpty) {
              return const NoData(
                label: 'No existen datos para mostar',
              );
            }

            return ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: valueListaInfantiles.getListaInfantiles.length,
              itemBuilder: (BuildContext context, int index) {
                final _infantil =
                    valueListaInfantiles.getListaInfantiles[index];

                return Column(
                  children: [
                    Slidable(
                      startActionPane: ActionPane(
                        // A motion is a widget used to control how the pane animates.
                        motion: const ScrollMotion(),

                        children: [
                          widget.user!.tipo=='master'
                  ?SlidableAction(
                            backgroundColor: tercearyColor,
                            foregroundColor: Colors.white,
                            icon: Icons.edit,
                            // label: 'Editar',
                            onPressed: (context) {
                              valueListaInfantiles
                                  .getInfoDelInfantil(_infantil);
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => const CrearCoroNino(estado: 'edit')));
                            },
                          ):Container(),
                          widget.user!.tipo=='master'
                  ?SlidableAction(
                            onPressed: (context) async {
                              valueListaInfantiles.eliminaInfantil(_infantil);
                            },
                            backgroundColor: cuaternaryColor,
                            foregroundColor: Colors.white,
                            icon: Icons.delete_forever_outlined,
                            // label: 'Eliminar',
                          ):Container(),
                        ],
                      ),
                      child: GestureDetector(
                        onTap: () {
                          // valueListaInfantiles.getInfoDelCoro(_coro);
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => DetalleCoro(
                                    titulo: 'Coros Infantiles',
                                    musica: _infantil,
                                  )));
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
                              '${_infantil.titulo}',
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.roboto(
                              fontSize: size.iScreen(1.7),
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
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: size.wScreen(100),
                      height: size.iScreen(0.2),
                    )
                  ],
                );
              },
            );
          },
        ),
      ),
      floatingActionButton: 
       widget.user!.tipo=='master'
                  ?FloatingActionButton(
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
          onPressed: () {
              LetraMusica(id:0,tipo:"",titulo:"",letra: "");
            context.read<HomeController>().resetFormCoros();
            Navigator.push(context,
                MaterialPageRoute(builder: (BuildContext context) {
              return const CrearCoroNino(estado: 'new',);
            }));
          }):Container(),
    );
  }
}

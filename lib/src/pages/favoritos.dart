import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ieanjesus/src/controllers/home_controller.dart';
import 'package:ieanjesus/src/pages/detalle_libro_biblia.dart';
import 'package:ieanjesus/src/pages/no_data.dart';
import 'package:ieanjesus/src/utils/responsive.dart';
import 'package:ieanjesus/src/utils/theme.dart';
import 'package:provider/provider.dart';

class FavoritosBiblia extends StatelessWidget {
  const FavoritosBiblia({Key? key}) : super(key: key);

  get cuaternaryColor => null;

  @override
  Widget build(BuildContext context) {
    final Responsive size = Responsive.of(context);
    final controllerHome = context.read<HomeController>();
    final _listaBiblia = controllerHome.getlistalibrosBibliaCompleta;
    print('ESTA ES LA BIBLIA:$_listaBiblia');

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text(
              'Mis Favoritos',
              style: GoogleFonts.roboto(
                  fontSize: size.iScreen(2.5),
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(width: size.iScreen(3.0)),
            Icon(
              Icons.favorite,
              color: Colors.red[900],
              size: size.iScreen(4.0),
            )
          ],
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
          builder: (_, valueFavoritos, __) {
            if (valueFavoritos.getErrorListaFavoritos == null) {
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
            } else if (valueFavoritos.getErrorListaFavoritos == false) {
              return const NoData(
                label: 'No tiene Favoritos',
              );
              // Text("Error al cargar los datos");
            } else if (valueFavoritos.getListaFavoritos.isEmpty) {
              return const NoData(
                label: 'No tiene Favoritos',
              );
            }

            return ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: valueFavoritos.getListaFavoritos.length,
              itemBuilder: (BuildContext context, int index) {
                final _favorito = valueFavoritos.getListaFavoritos[index];

                return Column(
                  children: [
                    Slidable(
                          startActionPane: ActionPane(
                          // A motion is a widget used to control how the pane animates.
                          motion: const ScrollMotion(),

                          children: [
                 SlidableAction(
                              onPressed: (context) async {
                                valueFavoritos.eliminaFavorito(_favorito['texto']);
                              },
                           backgroundColor: const Color(0xFFE61B58),
                              foregroundColor: Colors.white,
                              icon: Icons.delete_forever_outlined,
                              // label: 'Eliminar',
                            )
                          ],
                        ),
                      child: GestureDetector(
                        onTap: () {
                          Map<String, dynamic> _data = {};
                    
                          controllerHome.resetFormCoros();
                          controllerHome.setTextSelect(true);
                          //  List _listCapitulo =  List.from(_favorito['data']);
                    
                          _listaBiblia.forEach((key, value) {
                            if (key == _favorito['libro']) {
                              // print("SI ES EL LIBRO:${key} ");
                              _data = {
                                "libro": key,
                                "versiculo": value,
                              };
                            }
                          });
                    
                          Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => DetalleLibro(
                                    libro: _data,
                                    searchPage: _favorito['capitulo'] - 1,
                                    searchVersoPage:
                                        int.parse(_favorito['verso']))),
                          );
                          // print("ESTA ES LA LISTA:${_favorito['data'].runtimeType} ");
                          // print("ESTA ES LA LISTA:${_listaBiblia.keys} ");
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
                              '${_favorito['texto']}  ',
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.roboto(
                                  fontSize: size.iScreen(1.7),
                                  // color: Colors.black87,
                                  fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(
                              '${_favorito['libro']} :${_favorito['capitulo']}:${_favorito['verso']} ',
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
    );
  }
}

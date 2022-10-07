import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ieanjesus/src/controllers/home_controller.dart';
import 'package:ieanjesus/src/pages/crear_coro.dart';
import 'package:ieanjesus/src/utils/responsive.dart';
import 'package:ieanjesus/src/utils/theme.dart';
import 'package:provider/provider.dart';

class ListaCoros extends StatefulWidget {
  const ListaCoros({Key? key}) : super(key: key);

  @override
  State<ListaCoros> createState() => _ListaCorosState();
}

class _ListaCorosState extends State<ListaCoros> {

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
      // appBar: AppBar(
      //   title: Text(
      //     'COROS',
      //     style: GoogleFonts.roboto(
      //         fontSize: size.iScreen(2.5),
      //         color: Colors.white,
      //         fontWeight: FontWeight.bold),
      //     overflow: TextOverflow.ellipsis,
      //   ),
      //   flexibleSpace: Container(
      //     decoration: const BoxDecoration(
      //       gradient: LinearGradient(
      //         begin: Alignment.topLeft,
      //         end: Alignment.bottomCenter,
      //         colors: <Color>[
      //           Color(0XFF153E76),
      //           Color(0XFF0076A7),
               
      //         ],
      //       ),
      //     ),
      //   ),
      // ),
      appBar: AppBar(
              // backgroundColor: primaryColor,
              // title: Text(
              //   'Mis Ausencias',
              //   style: GoogleFonts.lexendDeca(
              //       fontSize: size.iScreen(2.45),
              //       color: Colors.white,
              //       fontWeight: FontWeight.normal),
              // ),
              title: Consumer<HomeController>(
                builder: (_, providerSearch, __) {
                  return Row(
                    children: [
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: size.iScreen(0.1)),
                          child: (providerSearch.btnSearch)
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
                                              providerSearch.onSearchText(text);
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
                                                  width: 0.0,
                                                  color: Colors.grey),
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
                                    'COROS',
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
                          icon: (!providerSearch.btnSearch)
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
                            providerSearch
                                .setBtnSearch(!providerSearch.btnSearch);
                            _textSearchController.text = "";
                            // providerSearch.buscaAusencias('', 'false');
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
        child: ListView.builder(
             physics: const BouncingScrollPhysics(),
          itemCount: 50,
          itemBuilder: (BuildContext context, int index) {
            return
               
                Column(
              children: [
                Container(
                 color: Colors.white,
                  child: ListTile(
                    dense: true,
                    visualDensity:VisualDensity.compact,
                    title: Text(
                      'Coro $index',
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.roboto(
                          // fontSize: size.iScreen(1.8),
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
               Container(width: size.wScreen(100),height:size.iScreen(0.2),)
              ],
            );
          },
        ),
      ),
      floatingActionButton:  FloatingActionButton(
                 child: const Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                  onPressed:
                       () {
                          // bottomSheetVideo(avisoSalidaController, context, size);
                          Navigator.push(context,
                              MaterialPageRoute(builder: (BuildContext context) {
                            return const CrearCoro(
                             
                            );
                          }));
                        }
                     
                ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ieanjesus/src/controllers/home_controller.dart';
// import 'package:ieanjesus/src/controllers/home_controller.dart';
import 'package:ieanjesus/src/utils/responsive.dart';
import 'package:provider/provider.dart';

class DetalleLibro extends StatefulWidget {
  final MapEntry<String, dynamic> libro;
  // final int idLibro;
  // final String nombreLibro;
  const DetalleLibro({Key? key, required this.libro}) : super(key: key);

  @override
  State<DetalleLibro> createState() => _DetalleLibroState();
}

class _DetalleLibroState extends State<DetalleLibro> {
  final PageController _controllerPage = PageController();
  final TextEditingController _textCapitulo = TextEditingController();
  @override
  void dispose() {
    _controllerPage.dispose();
    _textCapitulo.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Responsive size = Responsive.of(context);
    final controllerHome = context.read<HomeController>();

    // controllerHome.getDetallelibroBiblia[widget.idLibro];

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Consumer<HomeController>(
            builder: (_, itemValue, __) {
              return Row(
                children: [
                  Text(
                    "${widget.libro.key}",
                    style: GoogleFonts.roboto(
                        fontSize: size.iScreen(2.5),
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                    overflow: TextOverflow.ellipsis,
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: () {
                      _showMyDialog(size ,widget.libro.value.length);
                    },
                    child: Text(
                      "Verso :   ${itemValue.getPageCapotulo! + 1}   ",
                      style: GoogleFonts.roboto(
                          fontSize: size.iScreen(2.0),
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                      overflow: TextOverflow.ellipsis,
                    ),
                  )

                  // const Spacer(),
                  // ClipRRect(
                  //   borderRadius: BorderRadius.circular(5.0),
                  //   child: Container(
                  //     width:size.wScreen(25) ,
                  //                       // margin: EdgeInsets.symmetric(
                  //                       //     horizontal: size.iScreen(0.0)),
                  //                       padding: EdgeInsets.symmetric(
                  //                           horizontal: size.iScreen(1.5)),
                  //                       color: Colors.white,
                  //                       height: size.iScreen(4.0),
                  //                       child: TextField(
                  //                         controller: _textCapitulo,
                  //                         textAlign: TextAlign.center,
                  //                         // controller: _textSearchControllerBiblia,
                  //                         autofocus: true,
                  //                         onChanged: (text) {
                  //                           if(int.parse(text.trim())>0){
                  //                           controllerHome.setPageCapitulo(int.parse(text));
                  //                             _controllerPage.animateToPage(controllerHome.getPageCapotulo!.toInt(), duration: Duration(milliseconds: 50), curve: Curves.easeIn);

                  //                           }

                  //                         },
                  //                         decoration: const InputDecoration(
                  //                           // icon: Icon(Icons.search),
                  //                           border: InputBorder.none,
                  //                           hintText: 'Capítulo',
                  //                         ),
                  //                       ),
                  //                     ),
                  // ),
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
            child: PageView.builder(
                controller: _controllerPage,
                itemBuilder: (context, index) {
                  final List<dynamic> _capitulo = widget.libro.value[index];

                  return ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: _capitulo.length,
                      itemBuilder: (context, i) {
                        return Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: size.iScreen(0.1),
                                vertical: size.iScreen(0.5)),
                            padding: EdgeInsets.symmetric(
                                horizontal: size.iScreen(0.5),
                                vertical: size.iScreen(0.0)),
                            child: Text.rich(
                              TextSpan(
                                children: <TextSpan>[
                                  TextSpan(
                                      text: '${i + 1} ',
                                      style: GoogleFonts.roboto(
                                        fontSize: size.iScreen(1.8),
                                        fontWeight: FontWeight.bold,
                                        // color: Colors.grey,
                                      )),
                                  TextSpan(
                                      text: ' ${_capitulo[i].replaceAll("/n","")} ',
                                      style: GoogleFonts.roboto(
                                        fontSize: size.iScreen(1.8),
                                        fontWeight: FontWeight.normal,
                                        // color: Colors.grey,
                                      )),
                                ],
                              ),
                            )

                            //          Wrap(
                            //     children: _capitulo.map((e) {
                            //   var index = _capitulo.indexOf(e);
                            //   return Container(
                            //       margin: EdgeInsets.symmetric(
                            //           horizontal: size.iScreen(0.1),
                            //           vertical: size.iScreen(0.5)),
                            //       padding: EdgeInsets.symmetric(
                            //           horizontal: size.iScreen(0.5),
                            //           vertical: size.iScreen(0.0)),
                            //       child: Text.rich(
                            //         TextSpan(
                            //           children: <TextSpan>[
                            //             TextSpan(
                            //                 text: '${index + 1} ',
                            //                 style: GoogleFonts.roboto(
                            //                   fontSize: size.iScreen(1.8),
                            //                   fontWeight: FontWeight.bold,
                            //                   // color: Colors.grey,
                            //                 )),
                            //             TextSpan(
                            //                 text: ' ${_capitulo[index]} ',
                            //                 style: GoogleFonts.roboto(
                            //                   fontSize: size.iScreen(1.8),
                            //                   fontWeight: FontWeight.normal,
                            //                   // color: Colors.grey,
                            //                 )),
                            //           ],
                            //         ),
                            //       ));
                            // }).toList())
                            // Text.rich(
                            //   TextSpan(
                            //     children: <TextSpan>[
                            //       TextSpan(
                            //           text: '${index + 1} ',
                            //           style: GoogleFonts.roboto(
                            //             fontSize: size.iScreen(1.8),
                            //             fontWeight: FontWeight.bold,
                            //             // color: Colors.grey,
                            //           )),
                            //       TextSpan(
                            //           text: '\n${index + 1} ${_capitulo[index]} ',
                            //           style: GoogleFonts.roboto(
                            //             fontSize: size.iScreen(1.8),
                            //             fontWeight: FontWeight.normal,
                            //             // color: Colors.grey,
                            //           )),
                            //     ],
                            //   ),
                            // ),
                            );
                      });
                },
                itemCount: widget.libro.value.length,
                onPageChanged: (_page) {
                  // print('LA PAAGINA ES:$_page');
                  controllerHome.setPageCapitulo(_page);
                  // PageController(keepPage: true,initialPage: controllerHome.getPageCapotulo!.toInt());
                  // _controllerPage.animateToPage(4, duration: Duration(milliseconds: 2000), curve: Curves.easeIn);

                  //  _controllerPage.animateTo(offset, duration: duration, curve: curve);
                } // Can be null
                )

            // ListView.builder(
            //   itemCount: widget.libro.value.length,
            //   itemBuilder: (BuildContext context, int index) {
            //     final List<dynamic> _capitulo = widget.libro.value[index];

            //     return
            //     ExpansionTile(
            //         childrenPadding: EdgeInsets.symmetric(
            //             horizontal: size.iScreen(0.5),
            //             vertical: size.iScreen(0.0)),
            //         tilePadding: EdgeInsets.symmetric(
            //             horizontal: size.iScreen(1.0),
            //             vertical: size.iScreen(0.0)),
            //         title: Text('Capítulo ${index + 1}',
            //             style: GoogleFonts.roboto(
            //               fontSize: size.iScreen(1.8),
            //               fontWeight: FontWeight.bold,
            //               // color: Colors.grey,
            //             )),
            //         children: [
            //           Wrap(
            //               children: _capitulo.map((e) {
            //             var index = _capitulo.indexOf(e);
            //             return Container(
            //                 margin: EdgeInsets.symmetric(
            //                     horizontal: size.iScreen(0.1),
            //                     vertical: size.iScreen(0.5)),
            //                 padding: EdgeInsets.symmetric(
            //                     horizontal: size.iScreen(0.5),
            //                     vertical: size.iScreen(0.0)),
            //                 child: Text.rich(
            //                   TextSpan(
            //                     children: <TextSpan>[
            //                       TextSpan(
            //                           text: '${index + 1} ',
            //                           style: GoogleFonts.roboto(
            //                             fontSize: size.iScreen(1.8),
            //                             fontWeight: FontWeight.bold,
            //                             // color: Colors.grey,
            //                           )),
            //                       TextSpan(
            //                           text: ' $e ',
            //                           style: GoogleFonts.roboto(
            //                             fontSize: size.iScreen(1.8),
            //                             fontWeight: FontWeight.normal,
            //                             // color: Colors.grey,
            //                           )),
            //                     ],
            //                   ),
            //                 ));
            //           }).toList())
            //         ]);

            //   },
            // ),

            ),
        //  floatingActionButton:  FloatingActionButton(
        //        child: const Icon(
        //                 Icons.add,
        //                 color: Colors.white,
        //               ),
        //         onPressed:
        //              () {

        //               controllerHome.setPageCapitulo(3);
        //                    _controllerPage.animateToPage(controllerHome.getPageCapotulo!.toInt(), duration: Duration(milliseconds: 50), curve: Curves.easeIn);

        //               }

        //       ),
      ),
    );
  }

  Future<void> _showMyDialog(Responsive size,int _libro) async {
   final contexto= context.read<HomeController>();
    return showDialog<void>(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Center(child: const Text('Versículos')),
          content: Container(
            width: size.wScreen(20),
            height: size.hScreen(50),
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: _libro,
              itemBuilder: (BuildContext context, int index) {

                    final _item=index+1;

                return InkWell(
                  onTap: (){
                    //  contexto.setPageCapitulo(index);
                     _controllerPage.animateToPage(index, duration: Duration(milliseconds: 50), curve: Curves.easeIn);
                      Navigator.of(context).pop();
                  },
                  child: Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: size.iScreen(3.0),
                          vertical: size.iScreen(0.5)),
                      // color: Colors.red,
                      child: Center(
                        child: Text('$_item' ,style: GoogleFonts.roboto(
                                          fontSize: size.iScreen(1.8),
                                          fontWeight: FontWeight.bold,
                                          // color: Colors.grey,
                                        )),
                      )),
                );
              },
            ),
          ),
          // actions: <Widget>[
          //   TextButton(
          //     child: const Text('Approve'),
          //     onPressed: () {
          //       Navigator.of(context).pop();
          //     },
          //   ),
          // ],
        );
      },
    );
  }
}

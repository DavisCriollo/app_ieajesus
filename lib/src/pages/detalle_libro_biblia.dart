import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ieanjesus/src/controllers/home_controller.dart';
// import 'package:ieanjesus/src/controllers/home_controller.dart';
import 'package:ieanjesus/src/utils/responsive.dart';
import 'package:ieanjesus/src/utils/theme.dart';
import 'package:provider/provider.dart';

class DetalleLibro extends StatefulWidget {
  final Map<String, dynamic> libro;
  final int searchPage;
  final int? searchVersoPage;
  // final int idLibro;
  // final String nombreLibro;
  const DetalleLibro(
      {Key? key,
      required this.libro,
      required this.searchPage,
      this.searchVersoPage})
      : super(key: key);

  @override
  State<DetalleLibro> createState() => _DetalleLibroState();
}

class _DetalleLibroState extends State<DetalleLibro> {
  final controllerHome = HomeController();
  final PageController _controllerPage = PageController();
  final TextEditingController _textCapitulo = TextEditingController();
  final FlutterTts _flutterTts = FlutterTts();
  @override
  void dispose() {
    _controllerPage.dispose();
    _textCapitulo.clear();
    _flutterTts.stop();
        //  controllerHome.setAction(false);
    super.dispose();
  }

  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      if (_controllerPage.hasClients) {
        _controllerPage.jumpToPage(widget.searchPage);
   
      }
    });
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    final Responsive size = Responsive.of(context);
    final controllerHome = context.read<HomeController>();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Consumer<HomeController>(
            builder: (_, itemValue, __) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      '${widget.libro['libro'].replaceAll('Ê', "É")}',
                      style: GoogleFonts.roboto(
                          fontSize: size.iScreen(2.5),
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                      overflow: TextOverflow.fade,
                    ),
                  ),
                  // const Spacer(),
                  TextButton(
                    onPressed: () {
                      _flutterTts.stop();
                      controllerHome.setAction(false);
                      controllerHome.setTextSelect(false);
                      _showMyDialog(size, widget.libro['versiculo'].length);
                    },
                    child: Text(
                      "Capítulo : ${itemValue.getPageCapitulo! + 1}   ",
                      // "f   ",
                      style: GoogleFonts.roboto(
                          fontSize: size.iScreen(2.0),
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),

                  SizedBox(
                    width: size.iScreen(10.0),
                    // color: Colors.green,
                    child: Slider(
                        activeColor: Colors.green,
                        thumbColor: Colors.white,
                        inactiveColor: Colors.grey,
                        min: 2,
                        max: 10,
                        value: itemValue.getBtnSize,
                        onChanged: (_value) {
                          itemValue.setBtnSize(_value);
                        }),
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
            child:
                // Text('data')
                Stack(
              children: [
                PageView.builder(
                    controller: _controllerPage,
                    itemBuilder: (context, index) {
                      final List<dynamic> _capitulo =
                          widget.libro['versiculo'][index];
                      return ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          itemCount: _capitulo.length,
                          itemBuilder: (context, i) {
                            return GestureDetector(
                              onLongPress: () async {
                                showCupertinoModalPopup(
                                  context: context,
                                  builder: (BuildContext context) =>
                                      CupertinoActionSheet(
                                    // title: const Text('Selecciones Acción'),
                                    actions: <Widget>[
                                      CupertinoActionSheetAction(
                                        child: SizedBox(
                                          width: size.iScreen(25.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Text(
                                                'Agregar a Favoritos',
                                                style: GoogleFonts.roboto(
                                                    fontSize: size.iScreen(2.0),
                                                    // color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.normal),
                                              ),
                                              Icon(
                                                Icons.favorite,
                                                color: Colors.red[900],
                                                size: size.iScreen(4.0),
                                              )
                                            ],
                                          ),
                                        ),
                                        onPressed: () async {
                                          controllerHome.setItemFavorito({
                                            "libro": widget.libro['libro'],
                                            "capitulo": controllerHome
                                                    .getPageCapitulo! +
                                                1,
                                            "verso": "${i + 1} ",
                                            "texto":
                                                "${_capitulo[i].replaceAll("/n", "")}",
                                            "data": "$_capitulo",
                                          });
                                           final snackBar = _sNackCopy(
                                              'Agregado a favoritos',
                                              size,
                                              tercearyColor);
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(snackBar);
                                          Navigator.pop(context, 'Cancel');
                                        },
                                      ),
                                      CupertinoActionSheetAction(
                                        child: Text(
                                          'Copiar Verso',
                                          style: GoogleFonts.roboto(
                                              fontSize: size.iScreen(2.0),
                                              // color: Colors.white,
                                              fontWeight: FontWeight.normal),
                                        ),
                                        onPressed: () async {
                                          await Clipboard.setData(ClipboardData(
                                              text:
                                                  "${widget.libro['libro']} ${controllerHome.getPageCapitulo! + 1}:${i + 1} ${_capitulo[i].replaceAll("/n", "")}"));

                                          final snackBar = _sNackCopy(
                                              'Verso copiado',
                                              size,
                                              tercearyColor);
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(snackBar);
                                          Navigator.pop(context, 'Cancel');
                                        },
                                      ),
                                      CupertinoActionSheetAction(
                                        child: Text(
                                          'Escuchar Capítulo',
                                          style: GoogleFonts.roboto(
                                              fontSize: size.iScreen(2.0),
                                              // color: Colors.white,
                                              fontWeight: FontWeight.normal),
                                        ),
                                        onPressed: () async {
                                          await _flutterTts
                                              .setLanguage('es-ES');
                                          await _flutterTts.setPitch(1);
                                          await _flutterTts.setVolume(10);

                                          await _flutterTts
                                              .speak('$_capitulo ');
                                          controllerHome.setAction(true);
                                          Navigator.pop(context, 'Cancel');
                                        },
                                      )
                                    ],
                                  
                                  ),
                                );

                             
                              },
                              child: Consumer<HomeController>(
                                builder: (_, valueSize, __) {
                                  return Container(
                                      color: widget.searchVersoPage == i + 1 &&
                                              valueSize.getTextSelect
                                          ? Colors.orange[100]
                                          : Colors.transparent,
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
                                                  fontSize: size.iScreen(
                                                      valueSize.getBtnSize),
                                                  fontWeight: FontWeight.bold,
                                                  // color: Colors.grey,
                                                )),
                                            TextSpan(
                                                text:
                                                    ' ${_capitulo[i].replaceAll("/n", "")} ',
                                                style: GoogleFonts.roboto(
                                                  fontSize: size.iScreen(
                                                      valueSize.getBtnSize),
                                                  fontWeight: FontWeight.normal,
                                                  // color: Colors.grey,
                                                )),
                                          ],
                                        ),
                                      ));
                                },
                              ),
                            );
                          });
                    },
                    itemCount: widget.libro['versiculo'].length,
                    onPageChanged: (_page) async {

                      // controllerHome.setTextSelect(false);
                      // controllerHome.setPageCapitulo(_page);
                      // if (controllerHome.getAaction) {
                      //   await _flutterTts.stop();
                      //   await _flutterTts
                      //       .speak('${widget.libro['versiculo'][_page]}');
                      //   controllerHome.setAction(true);
                      // } else {
                      //   controllerHome.setAction(false);
                      // }

                       final controllerHome = context.read<HomeController>();
                      controllerHome.setPageCapitulo(_page);
  if (controllerHome.getAaction) {
                        await _flutterTts.stop();
                        await _flutterTts
                            .speak('${widget.libro['versiculo'][_page]}');
                        controllerHome.setAction(true);
                      } else {
                        controllerHome.setAction(false);
                      }
                      if (widget.searchVersoPage != null) {
                        if (widget.searchPage + 1 == _page + 1) {
                          controllerHome.setTextSelect(true);
                        } else {
                          controllerHome.setTextSelect(false);
                        }

// _isBook=true;
                      } else {
                        controllerHome.setTextSelect(false);
// _isBook=false;

                      }
  




                    } // Can be null
                    ),
                Consumer<HomeController>(
                  builder: (_, valueStates, __) {
                    return valueStates.getAaction
                        ? Positioned(
                            bottom: 5.0,
                            left: size.iScreen(18.0),
                            right: size.iScreen(18.0),
                            child: Center(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Container(
                                    width: size.wScreen(100),
                                    // margin: EdgeInsets.symmetric(horizontal: size.iScreen(3.0),vertical: size.iScreen(0.0)),
                                    padding: EdgeInsets.symmetric(
                                        horizontal: size.iScreen(0.0),
                                        vertical: size.iScreen(0.0)),
                                    color: const Color.fromARGB(72, 88, 85, 85),
                                    child: IconButton(
                                      padding: const EdgeInsets.all(0.0),
                                      onPressed: () {
                                        _flutterTts.stop();
                                        controllerHome.setAction(false);
                                      },
                                      icon: Icon(
                                        Icons.stop_circle_outlined,
                                        size: size.iScreen(4.5),
                                        // color: Colors.blue[900],
                                      ),
                                    )),
                              ),
                            ))
                        : Container();
                  },
                ),
              ],
            )),
      ),
    );
  }

//========================COPIA TEXTO=========================//
  SnackBar _sNackCopy(String _info, Responsive size, Color _color) {
    return SnackBar(
      backgroundColor: _color,
      content: Text(_info,
          style: GoogleFonts.roboto(
              fontSize: size.iScreen(2.0), fontWeight: FontWeight.bold
              // color: Colors.white,
              )),
    );
  }

//=================================================//

  Future<void> _showMyDialog(Responsive size, int _libro) async {
    // final contexto = context.read<HomeController>();
    return showDialog<void>(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Center(
              child: Text('Capítulos',
                  style: GoogleFonts.roboto(
                    fontSize: size.iScreen(2.5),
                    fontWeight: FontWeight.bold,
                    // color: Colors.grey,
                  ))),
          content: SizedBox(
            width: size.wScreen(20),
            height: size.hScreen(50),
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: _libro,
              itemBuilder: (BuildContext context, int index) {
                final _item = index + 1;

                return InkWell(
                  onTap: () {
                    //  contexto.setPageCapitulo(index);

                    _controllerPage.animateToPage(index,
                        duration: const Duration(milliseconds: 50),
                        curve: Curves.easeIn);
                    Navigator.of(context).pop();
                  },
                  child: Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: size.iScreen(3.0),
                          vertical: size.iScreen(0.5)),
                      // color: Colors.red,
                      child: Center(
                        child: Text('$_item',
                            style: GoogleFonts.roboto(
                              fontSize: size.iScreen(2.5),
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

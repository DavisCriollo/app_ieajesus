import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ieanjesus/src/pages/crear_himno.dart';
import 'package:ieanjesus/src/utils/responsive.dart';
import 'package:ieanjesus/src/utils/theme.dart';

class ListaCongregacionales extends StatefulWidget {
  const ListaCongregacionales({Key? key}) : super(key: key);

  @override
  State<ListaCongregacionales> createState() => _ListaCongregacionalesState();
}

class _ListaCongregacionalesState extends State<ListaCongregacionales> {
  @override
  Widget build(BuildContext context) {
    final Responsive size = Responsive.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'CONGREGACIONALES',
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
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: 50,
          itemBuilder: (BuildContext context, int index) {
            return Column(
              children: [
                Container(
                  color: Colors.white,
                  child: ListTile(
                    dense: true,
                    visualDensity: VisualDensity.compact,
                    title: Text(
                      'HIMNO $index',
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.roboto(
                          // fontSize: size.iScreen(1.8),
                          // color: Colors.black87,
                          fontWeight: FontWeight.normal),
                    ),
                    subtitle: Text(
                      'Tono: Do+',
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.roboto(
                          // fontSize: size.iScreen(1.8),
                          // color: Colors.black87,
                          fontWeight: FontWeight.normal),
                    ),
                    trailing: const Icon(Icons.chevron_right),
                  ),
                ),
                Container(
                  width: size.wScreen(100),
                  height: size.iScreen(0.2),
                )
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
                            return const CrearHimno(
                             
                            );
                          }));
                        }
                     
                ),
    );
  }
  
}

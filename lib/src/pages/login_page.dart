import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ieanjesus/src/controllers/login_controller.dart';
import 'package:ieanjesus/src/utils/responsive.dart';
import 'package:ieanjesus/src/utils/theme.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final Responsive size = Responsive.of(context);

    // final loginController = context.read<LoginController>();

    return 

    SafeArea(
      child: ChangeNotifierProvider(create: (_) =>LoginController(),
      
      builder: (context,_){


final loginController=context.read<LoginController>();

        return Scaffold(
        body: Container(
          color: Colors.white,
          width: size.wScreen(100.0),
          height: size.hScreen(100.0),
          padding: EdgeInsets.only(
            top: size.iScreen(0.0),
            right: size.iScreen(0.0),
            left: size.iScreen(0.0),
          ),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    // color: Colors.red,
                    // margin: EdgeInsets.symmetric(horizontal:size.iScreen(8.0)),
                    // decoration: BoxDecoration(
                    //   borderRadius: BorderRadius.circular(100),
                    //   // border: Border.all(
                    //   //   color: Color(0xFF04559D),
                    //   // ),
                    // ),
                    width: size.wScreen(80),
                    // height: size.iScreen(15),
                    child: Image(
                      image: const AssetImage('assets/imgs/Logo_Oficial.png'),
                      fit: BoxFit.cover,
                      width: size.iScreen(100),
                    ),
                  ),
                  SizedBox(
                    height: size.iScreen(5),
                  ),
                   Container(
                    margin: EdgeInsets.symmetric(horizontal: size.iScreen(3.0)),
                     child: Column(
                       children: [
                         Container(
                          width: size.wScreen(100.0),

                          // color: Colors.blue,
                          child: Text('Ingrese código de acceso',
                          textAlign: TextAlign.center,
                              style: GoogleFonts.lexendDeca(
                                  fontSize: size.iScreen(1.7),
                                  fontWeight: FontWeight.normal,
                                  color: Colors.grey)),
                  ),
                  Container(
                      width: size.wScreen(30.0),
                      child: Form(
                        key: loginController.loginFormKey,
                        child: TextFormField(
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: size.iScreen(3.0),
                            letterSpacing: 2.0,
                          ),
                          onChanged: (text) {
                            loginController.onCodeChange(text);
                          },
                          validator: (text) {
                            if (text!.trim().length > 0) {
                              return null;
                            } else {
                              return 'Código Invalido';
                            }
                          },
                          // onSaved: (value) {
                          //   loginControler. = value;
                          // },
                        ),
                      ),
                  ),
                SizedBox(height: size.iScreen(5.0)),
                    
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: primaryColor,
                                        border: Border.all(
                                            width: 1.5, color: Colors.white),
                                        borderRadius:
                                            BorderRadius.circular(8.0)),
                                    width: size.wScreen(50),
                                    height: size.iScreen(4.5),
                                    child: TextButton(
                                      // splashColor: Colors.transparent,
                                      // padding: EdgeInsets.symmetric(horizontal: size.iScreen(2.0)),
                                      onPressed: () {
                                        // Navigator.pushReplacementNamed(
                                        //     context, 'home');
                    
                    
                                       
                    
                    
                    
                    
                    
                                      },
                                      child: Text(
                                        'Ingresar',
                                        style: GoogleFonts.lexendDeca(
                                          fontSize: size.iScreen(2.0),
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
               
                       ],
                     ),
                   ),
                 
               
                ],
              ),
            ),
          ),
        ),
      );
   
      },
      ),
      
      
      
      
   
    );
  }
}

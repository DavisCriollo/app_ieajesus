
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ieanjesus/src/controllers/home_controller.dart';
import 'package:ieanjesus/src/routes/routes.dart';
import 'package:ieanjesus/src/utils/theme.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
    );
    return MultiProvider(
      providers: [
  ChangeNotifierProvider(create: (_) => HomeController()),


      ],
      child: MaterialApp(
         debugShowCheckedModeBanner: false,
    
        //  CONFIGURACION PARA EL DATEPICKER
        //  localizationsDelegates: [
        //   GlobalWidgetsLocalizations.delegate,
        //   GlobalMaterialLocalizations.delegate,
        //   GlobalCupertinoLocalizations.delegate,
        // ],
        // supportedLocales: const [
        //   Locale('en', 'US'), // English, no country code
        //   Locale('es', 'ES'), // Hebrew, no country code
        // ],
    
        theme: ThemeData(
          primaryColor: primaryColor,
          // floatingActionButtonTheme:FloatingActionButtonThemeData(backgroundColor: secondaryColor),
          colorScheme: ColorScheme.fromSeed(seedColor: primaryColor,secondary: primaryColor,tertiary: tercearyColor),
          ),
        initialRoute: 'home',
    
        // initialRoute: 'compras',
        routes: appRoutes,
        // navigatorKey: homeController.navigatorKey,
        // scaffoldMessengerKey: No
      ),
    );
  }
}
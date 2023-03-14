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
        theme: ThemeData(
          primaryColor: primaryColor,
          colorScheme: ColorScheme.fromSeed(
              seedColor: primaryColor,
              secondary: primaryColor,
              tertiary: tercearyColor),
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        initialRoute: 'splash',
        routes: appRoutes,
      ),
    );
  }
}

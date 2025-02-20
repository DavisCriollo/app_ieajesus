import 'package:flutter/material.dart';
import 'package:ieanjesus/src/pages/acerca_page.dart';
import 'package:ieanjesus/src/pages/buscar_en_biblia.dart';

import 'package:ieanjesus/src/pages/dedicatoria_page.dart';
import 'package:ieanjesus/src/pages/favoritos.dart';
import 'package:ieanjesus/src/pages/home_page.dart';
import 'package:ieanjesus/src/pages/lista_coros_page.dart';
import 'package:ieanjesus/src/pages/lista_libros_biblia.dart';
import 'package:ieanjesus/src/pages/login_page.dart';
import 'package:ieanjesus/src/pages/splash_page.dart';




final Map<String, Widget Function(BuildContext)> appRoutes = {
  'splash': (_) =>  SplashPage(),
  'login': (_) =>  LoginPage(),
  'home': (_) =>   const HomePage(),
  'listaCoros': (_) =>  const ListaCoros(),
  // 'crearCoros': (_) =>  const CrearCoro(),
  'acercaDePage': (_) =>  const AcercaDePage(),
  'dedicatoria': (_) =>  const Dedicatoria(),
  'buscarBiblia': (_) =>  const BusquedasBiblia(),
  'librosBiblia': (_) =>  const ListaLibrosBiblia(),
  'favoritosBiblia': (_) =>  const FavoritosBiblia(),
};


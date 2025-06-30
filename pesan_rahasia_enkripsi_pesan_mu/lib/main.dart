import 'package:flutter/material.dart';
import 'package:pesan_rahasia_enkripsi_pesan_mu/screens/home_screen.dart';
import 'screens/splash_screen.dart';
//import 'screens/home_screen.dart';
//import 'screens/enkripsi_screen.dart';
//import 'screens/dekripsi_screen.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    routes: {
      '/': (context) => SplashScreen(),
      '/home': (context) => HomeScreen(),
      //'/enkripsi': (context) => EnkripsiScreen(),
      //'/dekripsi': (context) => DekripsiScreen(),
    },
  ));
}

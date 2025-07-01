import 'package:flutter/material.dart';
import '/screens/home_screen.dart';
import 'screens/splash_screen.dart';
import 'screens/enkripsi_screen.dart';
import 'screens/dekripsi_screen.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        '/home': (context) => HomeScreen(),
        '/enkripsi': (context) => SetelanMatriksEnkripsiPage(),
        '/dekripsi': (context) => SetelanMatriksDekripsiPage(),
      },
    ),
  );
}

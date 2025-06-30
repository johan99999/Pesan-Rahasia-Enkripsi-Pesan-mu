import 'package:flutter/material.dart';
import 'package:pesan_rahasia_enkripsi_pesan_mu/screens/home_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    // Timer 3 detik lalu pindah ke HomeScreen
    Future.delayed(Duration(seconds: 10), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => HomeScreen(),
        ), // Ganti ke nama screen berikutnya
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/download.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            Center(
              child: Image.asset(
                'assets/images/logo.jpg',
                width: 300,
                height: 300,
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(height: 10),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Text(
                'VERSI 1.0.0',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                  shadows: [
                    Shadow(
                      blurRadius: 4.0,
                      color: Colors.black,
                      offset: Offset(1, 1),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

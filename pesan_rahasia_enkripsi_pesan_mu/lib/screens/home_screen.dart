import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pesan Rahasia',
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomeScreen extends StatelessWidget {
  final TextEditingController inputController = TextEditingController();
  final TextEditingController outputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Background binari kamu
      body: Stack(
        children: [
          // Gambar latar belakang
          Positioned.fill(
            child: Image.asset('assets/images/download.jpg', fit: BoxFit.cover),
          ),
          // Konten utama dengan padding
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildTextBox("Masukkan Pesan", inputController),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                      ),
                      onPressed: () {
                        // Logika Enkripsi
                      },
                      child: const Text(
                      "ENKRIPSI",
                      style: TextStyle(color: Colors.white),
                    ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                      ),
                      onPressed: () {
                        // Logika Dekripsi
                      },
                      child: const Text(
                      "DEKRIPSI",
                      style: TextStyle(color: Colors.white),
                    ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                buildTextBox("Hasil", outputController),
                const SizedBox(height: 10),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      Clipboard.setData(
                        ClipboardData(text: outputController.text),
                      );
                    },
                    child: const Text(
                      "SALIN",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildTextBox(String hint, TextEditingController controller) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextField(
        controller: controller,
        maxLines: 4,
        decoration: InputDecoration(
          hintText: hint,
          contentPadding: const EdgeInsets.all(12),
          border: InputBorder.none,
        ),
      ),
    );
  }
}

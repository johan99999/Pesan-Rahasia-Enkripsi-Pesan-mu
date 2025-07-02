import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pesan_rahasia_enkripsi_pesan_mu/screens/dekripsi_screen.dart';
import 'package:pesan_rahasia_enkripsi_pesan_mu/screens/enkripsi_screen.dart';

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
  backgroundColor: Colors.black,
  appBar: AppBar(
    backgroundColor: Colors.black,
    elevation: 0,
    iconTheme: IconThemeData(color: Colors.white),
  ),
  drawer: Drawer(
    backgroundColor: Color(0xFF1A005D),
    child: ListView(
      padding: EdgeInsets.zero,
      children: [
        DrawerHeader(
          decoration: BoxDecoration(
            color: Color(0xFF1A005D),
          ),
          child: Column(
            children: [
              Image.asset('assets/images/logo.jpg', width: 100, height: 100),
              SizedBox(height: 10),
              Text('VERSI 1.0.0', style: TextStyle(color: Colors.white)),
            ],
          ),
        ),
       ListTile(
          title: Text('Ganti Matriks Kunci', style: TextStyle(color: Colors.white)),
          onTap: () {
          Navigator.pushNamed(context, '/enkripsi');
        },
      ),

        ListTile(
          title: Text('Tentang', style: TextStyle(color: Colors.white)),
          onTap: () {
          },
        ),
        ListTile(
          title: Text('Keluar', style: TextStyle(color: Colors.white)),
          onTap: () {
            SystemNavigator.pop();
          },
        ),
      ],
    ),
  ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset('assets/images/download.jpg', fit: BoxFit.cover),
          ),
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
                        final input = inputController.text;
                        final output = prosesEnkripsi(input, enkripsi: true); 
                        outputController.text = output;
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
                        final input = inputController.text;
                        final output = prosesEnkripsi(input, enkripsi: false);
                        outputController.text = output;
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

String cleanText(String input) {
  return input.replaceAll(RegExp(r'[^a-zA-Z]'), '').toUpperCase();
}

List<int> convertToNumber(String text) {
  return text.codeUnits.map((c) => c - 65).toList();
}

String angkaKeHuruf(int angka) {
  return String.fromCharCode((angka % 26) + 65);
}

List<int> enkripsi2x2(int a, int b) {
  final k = MatriksKunciGlobalEnkripsi.kunci2x2;
  final e1 = (k[0] * a + k[1] * b) % 26;
  final e2 = (k[2] * a + k[3] * b) % 26;
  return [e1, e2];
}

List<int> enkripsi3x3(int a, int b, int c) {
  final k = MatriksKunciGlobalEnkripsi.kunci3x3;
  final e1 = (k[0] * a + k[1] * b + k[2] * c) % 26;
  final e2 = (k[3] * a + k[4] * b + k[5] * c) % 26;
  final e3 = (k[6] * a + k[7] * b + k[8] * c) % 26;
  return [e1, e2, e3];
}

List<int> dekripsi2x2(int a, int b) {
  final k = MatriksKunciGlobalDekripsi.kunci2x2;
  final d1 = (k[0] * a + k[1] * b) % 26;
  final d2 = (k[2] * a + k[3] * b) % 26;
  return [d1, d2];
}

List<int> dekripsi3x3(int a, int b, int c) {
  final k = MatriksKunciGlobalDekripsi.kunci3x3;
  final d1 = (k[0] * a + k[1] * b + k[2] * c) % 26;
  final d2 = (k[3] * a + k[4] * b + k[5] * c) % 26;
  final d3 = (k[6] * a + k[7] * b + k[8] * c) % 26;
  return [d1, d2, d3];
}

String prosesEnkripsi(String input, {bool enkripsi = true}) {
  final angka = convertToNumber(cleanText(input));
  final hasil = <int>[];
  int i = 0;

  while (i < angka.length) {
    final sisa = angka.length - i;

    if (sisa >= 6 || sisa == 3) {
      final bagian = angka.sublist(i, i + 3);
      hasil.addAll(enkripsi ? enkripsi3x3(bagian[0], bagian[1], bagian[2])
                             : dekripsi3x3(bagian[0], bagian[1], bagian[2]));
      i += 3;
    } else if (sisa == 5) {
      final b3 = angka.sublist(i, i + 3);
      final b2 = angka.sublist(i + 3, i + 5);
      hasil.addAll(enkripsi ? enkripsi3x3(b3[0], b3[1], b3[2])
                            : dekripsi3x3(b3[0], b3[1], b3[2]));
      hasil.addAll(enkripsi ? enkripsi2x2(b2[0], b2[1])
                            : dekripsi2x2(b2[0], b2[1]));
      i += 5;
    } else if (sisa == 4) {
      hasil.addAll(enkripsi ? enkripsi2x2(angka[i], angka[i + 1])
                            : dekripsi2x2(angka[i], angka[i + 1]));
      hasil.addAll(enkripsi ? enkripsi2x2(angka[i + 2], angka[i + 3])
                            : dekripsi2x2(angka[i + 2], angka[i + 3]));
      i += 4;
    } else if (sisa == 2) {
      hasil.addAll(enkripsi ? enkripsi2x2(angka[i], angka[i + 1])
                            : dekripsi2x2(angka[i], angka[i + 1]));
      i += 2;
    } else {
      break;
    }
  }

  return hasil.map(angkaKeHuruf).join();
}


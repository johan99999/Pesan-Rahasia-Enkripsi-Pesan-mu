import 'package:flutter/material.dart';

class SetelanMatriksDekripsiPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Setelan Matriks Enkripsi'),
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset('assets/images/download.jpg', fit: BoxFit.cover),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                toggleButtons(context),
                const SizedBox(height: 20),
                Text("2 X 2", style: styleWhite()),
                matrixGrid(["15", "17", "20", "9"], 2),
                const SizedBox(height: 20),
                Text("3 X 3", style: styleWhite()),
                matrixGrid([
                  "8",
                  "5",
                  "10",
                  "21",
                  "8",
                  "21",
                  "21",
                  "12",
                  "18",
                ], 3),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget toggleButtons(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/enkripsi');
          }, // Sudah di halaman Enkripsi
          child: Text("ENKRIPSI"),
        ),
        const SizedBox(width: 10),
        ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
          onPressed: () {},
          child: Text("DEKRIPSI"),
        ),
      ],
    );
  }

  Widget matrixGrid(List<String> values, int size) {
    return GridView.count(
      crossAxisCount: size,
      shrinkWrap: true,
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      children: values
          .map(
            (val) => Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              alignment: Alignment.center,
              child: Text(val, style: TextStyle(fontSize: 18)),
            ),
          )
          .toList(),
    );
  }

  TextStyle styleWhite() {
    return TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    );
  }
}

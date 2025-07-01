import 'package:flutter/material.dart';

class SetelanMatriksDekripsiPage extends StatelessWidget {
  // Dummy controller list, bisa kamu sambungkan dengan logika nanti
  final List<TextEditingController> matrix2x2Controllers = List.generate(
    4,
    (_) => TextEditingController(),
  );
  final List<TextEditingController> matrix3x3Controllers = List.generate(
    9,
    (_) => TextEditingController(),
  );

  SetelanMatriksDekripsiPage({super.key}) {
    // Default value sesuai desain kamu
    final default2x2 = ['15', '17', '20', '9'];
    final default3x3 = ['8', '5', '10', '21', '8', '21', '21', '12', '8'];

    for (int i = 0; i < 4; i++) {
      matrix2x2Controllers[i].text = default2x2[i];
    }
    for (int i = 0; i < 9; i++) {
      matrix3x3Controllers[i].text = default3x3[i];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Setelan Matriks Enkripsi'),
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                'assets/images/download.jpg',
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: SingleChildScrollView(
                padding: const EdgeInsets.only(bottom: 20),
                child: Column(
                  children: [
                    toggleButtons(context),
                    const SizedBox(height: 20),
                    Text("2 X 2", style: styleWhite()),
                    matrixGridEditable(matrix2x2Controllers, 2),
                    const SizedBox(height: 20),
                    Text("3 X 3", style: styleWhite()),
                    matrixGridEditable(matrix3x3Controllers, 3),
                  ],
                ),
              ),
            ),
          ],
        ),
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
          child: const Text("ENKRIPSI"),
        ),
        const SizedBox(width: 10),
        ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
          onPressed: () {},
          child: const Text("DEKRIPSI"),
        ),
      ],
    );
  }

  Widget matrixGridEditable(List<TextEditingController> controllers, int size) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          maxWidth: 250,
        ), // Kontrol lebar maksimal
        child: GridView.builder(
          itemCount: controllers.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: size,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            childAspectRatio: 1, // Pastikan kotak persegi
          ),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(6),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 3,
                    offset: const Offset(1, 1),
                  ),
                ],
              ),
              alignment: Alignment.center,
              child: TextField(
                controller: controllers[index],
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  isDense: true,
                  contentPadding: EdgeInsets.symmetric(vertical: 10),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  TextStyle styleWhite() {
    return const TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    );
  }
}

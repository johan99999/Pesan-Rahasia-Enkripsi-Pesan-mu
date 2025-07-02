import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pesan Rahasia',
      home: const SetelanMatriksEnkripsiPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MatriksKunciGlobalEnkripsi {
  static List<int> kunci2x2 = [3, 3, 2, 5];
  static List<int> kunci3x3 = [6, 24, 1, 13, 16, 10, 20, 17, 15];

  static void resetToDefault() {
    kunci2x2 = [3, 3, 2, 5];
    kunci3x3 = [6, 24, 1, 13, 16, 10, 20, 17, 15];
  }
}

class SetelanMatriksEnkripsiPage extends StatefulWidget {
  const SetelanMatriksEnkripsiPage({super.key});

  @override
  State<SetelanMatriksEnkripsiPage> createState() => _SetelanMatriksEnkripsiPageState();
}

class _SetelanMatriksEnkripsiPageState extends State<SetelanMatriksEnkripsiPage> {
  final List<TextEditingController> matrix2x2Controllers = List.generate(4, (_) => TextEditingController());
  final List<TextEditingController> matrix3x3Controllers = List.generate(9, (_) => TextEditingController());

  @override
  void initState() {
    super.initState();
    setControllersFromGlobal();
  }

  void setControllersFromGlobal() {
    for (int i = 0; i < 4; i++) {
      matrix2x2Controllers[i].text = MatriksKunciGlobalEnkripsi.kunci2x2[i].toString();
    }
    for (int i = 0; i < 9; i++) {
      matrix3x3Controllers[i].text = MatriksKunciGlobalEnkripsi.kunci3x3[i].toString();
    }
  }

  void simpanKunci() {
    MatriksKunciGlobalEnkripsi.kunci2x2 = matrix2x2Controllers.map((c) => int.tryParse(c.text) ?? 0).toList();
    MatriksKunciGlobalEnkripsi.kunci3x3 = matrix3x3Controllers.map((c) => int.tryParse(c.text) ?? 0).toList();
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Matriks kunci berhasil disimpan")),
    );
  }

  void resetDefault() {
    setState(() {
      MatriksKunciGlobalEnkripsi.resetToDefault();
      setControllersFromGlobal();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Setelan Matriks Enkripsi', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Positioned.fill(
              child: Image.asset('assets/images/download.jpg', fit: BoxFit.cover),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: SingleChildScrollView(
                padding: const EdgeInsets.only(bottom: 20),
                child: Column(
                  children: [
                    toggleButtons(context),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                          onPressed: simpanKunci,
                          child: const Text("SIMPAN", style: TextStyle(color: Colors.white)),
                        ),
                        const SizedBox(width: 10),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(backgroundColor: Colors.grey),
                          onPressed: resetDefault,
                          child: const Text("DEFAULT", style: TextStyle(color: Colors.white)),
                        ),
                      ],
                    ),
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
          },
          child: const Text("ENKRIPSI", style: TextStyle(color: Colors.white)),
        ),
        const SizedBox(width: 10),
        ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/dekripsi');
          },
          child: const Text("DEKRIPSI", style: TextStyle(color: Colors.white)),
        ),
      ],
    );
  }

  Widget matrixGridEditable(List<TextEditingController> controllers, int size) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 250),
        child: GridView.builder(
          itemCount: controllers.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: size,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            childAspectRatio: 1,
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
                  )
                ],
              ),
              alignment: Alignment.center,
              child: TextField(
                controller: controllers[index],
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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
    return const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white);
  }
}

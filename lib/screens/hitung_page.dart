import 'package:flutter/material.dart';

class HitungPage extends StatefulWidget {
  const HitungPage({super.key});

  @override
  HitungPageState createState() => HitungPageState();
}

class HitungPageState extends State<HitungPage> {
  final TextEditingController num1Controller = TextEditingController();
  final TextEditingController num2Controller = TextEditingController();
  double result = 0.0;
  final int maxLength = 15; // Batas maksimum digit angka

  void validateAndCalculate(Function(double, double) operation) {
    double num1 =
        double.tryParse(num1Controller.text.replaceAll(',', '.')) ?? 0.0;
    double num2 =
        double.tryParse(num2Controller.text.replaceAll(',', '.')) ?? 0.0;

    setState(() {
      result = operation(num1, num2);
    });
  }

  void clearInput() {
    setState(() {
      num1Controller.clear();
      num2Controller.clear();
      result = 0.0;
    });
  }

  String? validateInput(String value) {
    if (value.isEmpty) return "Masukkan angka";
    if (value.length > maxLength) return "Maksimum $maxLength digit";
    if (!RegExp(r'^[0-9.,]+$').hasMatch(value))
      return "Hanya angka yang diperbolehkan";
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "HITUNG PAGE",
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF5B0583),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF1D1C4C), Color(0xFFC474E6)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 320,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: const Color(0xFFE5E5E5),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 10,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      TextFormField(
                        controller: num1Controller,
                        decoration: InputDecoration(
                          labelText: "Angka Pertama",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30)),
                          filled: true,
                          fillColor: Colors.white,
                        ),
                        keyboardType:
                            TextInputType.numberWithOptions(decimal: true),
                        maxLength: maxLength,
                        validator: (value) => validateInput(value ?? ""),
                      ),
                      const SizedBox(height: 15),
                      TextFormField(
                        controller: num2Controller,
                        decoration: InputDecoration(
                          labelText: "Angka Kedua",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30)),
                          filled: true,
                          fillColor: Colors.white,
                        ),
                        keyboardType:
                            TextInputType.numberWithOptions(decimal: true),
                        maxLength: maxLength,
                        validator: (value) => validateInput(value ?? ""),
                      ),
                      const SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ElevatedButton(
                            onPressed: clearInput,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30)),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 12),
                            ),
                            child: const Text("CLEAR",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white)),
                          ),
                          ElevatedButton(
                            onPressed: () =>
                                validateAndCalculate((a, b) => a - b),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.orange,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30)),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 12),
                            ),
                            child: const Text("-",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white)),
                          ),
                          ElevatedButton(
                            onPressed: () =>
                                validateAndCalculate((a, b) => a + b),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF5B0583),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30)),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 12),
                            ),
                            child: const Text("+",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white)),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: const Color(0xFF5B0583)),
                        ),
                        child: Text(
                          "Hasil: $result",
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF5B0583)),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class TotalDigitsPage extends StatefulWidget {
  const TotalDigitsPage({super.key});

  @override
  _TotalDigitsPageState createState() => _TotalDigitsPageState();
}

class _TotalDigitsPageState extends State<TotalDigitsPage> {
  final TextEditingController controller = TextEditingController();
  int totalDigits = 0;

  void countDigits() {
    String input = controller.text.replaceAll(RegExp(r'[^0-9]'), ''); // Hanya angka
    setState(() {
      totalDigits = input.length; // Hitung jumlah angka dalam input
    });
  }

  void clearInput() {
    setState(() {
      controller.clear();
      totalDigits = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "CEK DIGIT",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Color(0xFF5B0583), // Warna AppBar ungu tua
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF1D1C4C), // Warna atas
              Color(0xFFC474E6), // Warna bawah
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 320,
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Color(0xFFE5E5E5), // Warna putih keabu-abuan
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 10,
                        offset: Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      // Label
                      Text(
                        "Teks atau Angka",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF5B0583),
                        ),
                      ),
                      SizedBox(height: 15),

                      // Input Field
                      TextField(
                        controller: controller,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(color: Color(0xFF5B0583)),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                        ),
                        keyboardType: TextInputType.text,
                      ),
                      SizedBox(height: 15),

                      // Tombol Cek dan Clear
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ElevatedButton(
                            onPressed: clearInput,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              padding:
                                  EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                            ),
                            child: Text(
                              "CLEAR",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: countDigits,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFF5B0583),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              padding:
                                  EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                            ),
                            child: Text(
                              "CEK",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),

                      // Output
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Color(0xFF5B0583)),
                        ),
                        child: Text(
                          "Jumlah Total Angka: $totalDigits",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF5B0583),
                          ),
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

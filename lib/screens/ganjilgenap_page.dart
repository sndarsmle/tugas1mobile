import 'package:flutter/material.dart';

class GanjilGenapPage extends StatefulWidget {
  const GanjilGenapPage({super.key});

  @override
  GanjilGenapPageState createState() => GanjilGenapPageState();
}

class GanjilGenapPageState extends State<GanjilGenapPage> {
  final TextEditingController controller = TextEditingController();
  String result = "";
  final int maxLength = 15;

  void checkGanjilGenap() {
    String input = controller.text.trim();
    double? number = double.tryParse(input);

    setState(() {
      if (number == null) {
        result = "Masukkan angka yang valid";
      } else if (number % 1 != 0) {
        result = "Masukkan bilangan bulat";
      } else {
        int intNumber = number.toInt();
        result = (intNumber % 2 == 0)
            ? "Angka $intNumber adalah Genap"
            : "Angka $intNumber adalah Ganjil";
      }
    });
  }

  void clearInput() {
    setState(() {
      controller.clear();
      result = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "GANJIL GENAP",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Color(0xFF5B0583),
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
              Color(0xFF1D1C4C),
              Color(0xFFC474E6),
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
                    color: Color(0xFFE5E5E5),
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
                      Text(
                        "Masukkan Angka",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF5B0583),
                        ),
                      ),
                      SizedBox(height: 15),
                      TextField(
                        controller: controller,
                        onChanged: (text) => setState(() {}),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(color: Color(0xFF5B0583)),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          counterText: "${controller.text.length}/$maxLength",
                        ),
                        maxLength: maxLength,
                        keyboardType: TextInputType.number,
                      ),
                      SizedBox(height: 5),
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
                              padding: EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 12),
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
                            onPressed: checkGanjilGenap,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFF5B0583),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 12),
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
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Color(0xFF5B0583)),
                        ),
                        child: Text(
                          result,
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

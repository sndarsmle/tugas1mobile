import 'package:flutter/material.dart';
import 'package:tugas1mobile/screens/ganjilgenap_page.dart';
import 'package:tugas1mobile/screens/profil_page.dart';
import 'total_digits_page.dart';
import 'hitung_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'HOME PAGE',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xFF1D1C4C), // Warna AppBar diperbarui
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
        child: Column(
          children: [
            SizedBox(height: 40),
            Text(
              'Pilih Menu',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                crossAxisSpacing: 15.0,
                mainAxisSpacing: 15.0,
                children: [
                  _buildMenuItem(context, 'Profil', Icons.group),
                  _buildMenuItem(context, 'Hitung', Icons.calculate),
                  _buildMenuItem(
                      context, 'Ganjil Genap', Icons.format_list_numbered),
                  _buildMenuItem(context, 'Total Digit', Icons.numbers),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 40),
              child: Center(
                child: ElevatedButton(
                  onPressed: () {
                    _showExitDialog(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding:
                        EdgeInsets.symmetric(horizontal: 100, vertical: 15),
                  ),
                  child: Text(
                    "KELUAR",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem(BuildContext context, String title, IconData icon) {
    return MouseRegion(
      onEnter: (_) {},
      onExit: (_) {},
      child: Card(
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        color: Color(0xFFE5E5E5),
        child: InkWell(
          onTap: () {
            if (title == 'Profil') {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfilePage()),
              );
            } else if (title == 'Hitung') {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HitungPage()),
              );
            } else if (title == 'Ganjil Genap') {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => GanjilGenapPage()),
              );
            } else if (title == 'Total Digit') {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TotalDigitsPage()),
              );
            }
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 60, color: Color(0xFF5B0583)),
              SizedBox(height: 10),
              Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF5B0583),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showExitDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Keluar Aplikasi'),
          content: Text('Apakah Anda yakin ingin keluar dari aplikasi?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Batal'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).pop();
              },
              child: Text('Ya'),
            ),
          ],
        );
      },
    );
  }
}

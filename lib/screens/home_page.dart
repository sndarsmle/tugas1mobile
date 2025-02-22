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
        backgroundColor: Color(0xFF5B0583), // Warna AppBar ungu tua
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Grid Menu
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

            // Tombol Keluar
            Padding(
              padding: EdgeInsets.only(bottom: 20),
              child: ElevatedButton(
                onPressed: () {
                  _showExitDialog(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red, // Warna tombol merah terang
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 100, vertical: 15),
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
          ],
        ),
      ),
    );
  }

  // Widget untuk setiap menu item
  Widget _buildMenuItem(BuildContext context, String title, IconData icon) {
    return Card(
      elevation: 5.0, // Efek bayangan ringan
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15), // Sudut membulat
      ),
      color: Color(0xFFE5E5E5), // Warna putih keabu-abuan
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
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('$title dipilih')),
            );
          }
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon,
                size: 60, color: Color(0xFF5B0583)), // Warna ikon ungu tua
            SizedBox(height: 10),
            Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color(0xFF5B0583), // Warna teks ungu tua
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Menampilkan dialog konfirmasi keluar
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
                Navigator.of(context).pop(); // Menutup dialog
              },
              child: Text('Batal'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Menutup dialog
                Navigator.of(context).pop(); // Keluar halaman
              },
              child: Text('Ya'),
            ),
          ],
        );
      },
    );
  }
}

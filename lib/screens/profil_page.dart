import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'PROFIL ANGGOTA',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Color(0xFF1D1C4C),
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildProfileCard(
                    imagePath: 'assets/images/anggota1.jpg',
                    name: 'Ageng Sandar',
                    nim: '123220011',
                  ),
                  SizedBox(width: 20),
                  _buildProfileCard(
                    imagePath: 'assets/images/anggota2.jpg',
                    name: 'Mohamad Risqi',
                    nim: '123220021',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileCard({
    required String imagePath,
    required String name,
    required String nim,
  }) {
    return Container(
      width: 160,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
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
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              imagePath,
              height: 160, // Mengatur aspek rasio 3x4
              width: 120,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 10),
          Text(
            name,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF5B0583),
            ),
          ),
          SizedBox(height: 5),
          Text(
            nim,
            style: TextStyle(fontSize: 16, color: Colors.black54),
          ),
        ],
      ),
    );
  }
}

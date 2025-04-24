import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: PageView(
        // Menambahkan controller untuk kontrol swipe
        controller: PageController(),
        children: [
          // Halaman pertama: HomeScreen
          Column(
            children: [
              // Gambar header full atas kiri-kanan, tinggi 600px
              SizedBox(
                width: double.infinity,
                height: 600,
                child: Image.asset('assets/header.png', fit: BoxFit.cover),
              ),
              SizedBox(height: 30),
              // Logo dan Teks CashFlow.com dalam satu baris (Row)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Logo
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.transparent,
                      backgroundImage: AssetImage('assets/cashflow.png'),
                    ),
                    SizedBox(width: 16), // Jarak antara logo dan teks
                    // Teks
                    Text(
                      "CashFlow.com",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),
              // Tombol Get Started
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(
                      context,
                      '/login',
                    ); // Arahkan ke halaman login
                  },
                  child: Text('Get Started'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    minimumSize: Size(
                      double.infinity,
                      50,
                    ), // Tombol selebar layar
                    textStyle: TextStyle(fontSize: 16),
                  ),
                ),
              ),
              SizedBox(height: 64),
            ],
          ),
          // Halaman onboarding
          OnboardingPage(),
        ],
      ),
    );
  }
}

class OnboardingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: [
          OnboardingScreen(
            image: 'assets/cartoonca.jpg',
            title: 'Kelola Kasir dengan Mudah',
            description:
                'Kelola kasir dengan mudah. Pantau transaksi, atur stok, dan tingkatkan efisiensi bisnis hanya dalam satu aplikasi.',
          ),
          OnboardingScreen(
            image: 'assets/onboarding.png',
            title: 'Proses Cepat & Praktis',
            description:
                'Catat transaksi langsung dari aplikasi dan kelola semua kebutuhan operasional bisnismu dengan mudah. Nikmati pengalaman mengelola kasir yang lebih praktis dan bebas ribet!',
          ),
        ],
      ),
    );
  }
}

class OnboardingScreen extends StatelessWidget {
  final String image;
  final String title;
  final String description;

  OnboardingScreen({
    required this.image,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(image, height: 250, fit: BoxFit.contain),
          SizedBox(height: 20),
          Text(
            title,
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 16),
          Text(
            description,
            style: TextStyle(fontSize: 16, color: Colors.grey[700]),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

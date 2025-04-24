import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final PageController _controller = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: PageView(
        controller: _controller,
        children: [
          // Halaman 0: HomeScreen
          Column(
            children: [
              SizedBox(
                width: double.infinity,
                height: 600,
                child: Image.asset('assets/header.png', fit: BoxFit.cover),
              ),
              SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.transparent,
                      backgroundImage: AssetImage('assets/cashflow.png'),
                    ),
                    SizedBox(width: 16),
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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/login');
                  },
                  child: Text('Get Started'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    minimumSize: Size(double.infinity, 50),
                    textStyle: TextStyle(fontSize: 18),
                  ),
                ),
              ),
              SizedBox(height: 64),
            ],
          ),

          // Halaman 1: Onboarding 1
          OnboardingScreen(
            image: 'assets/cartoonca.jpg',
            title: 'Kelola Kasir dengan Mudah',
            description:
                'Kelola kasir dengan mudah. Pantau transaksi, atur stok, dan tingkatkan efisiensi bisnis hanya dalam satu aplikasi.',
          ),

          // Halaman 2: Onboarding 2
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
          Image.asset(image, height: 400, fit: BoxFit.contain),
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

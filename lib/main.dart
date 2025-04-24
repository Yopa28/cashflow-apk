import 'package:flutter/material.dart';
import 'page/splash_screen.dart';
import 'page/homescreen.page.dart';
import 'page/login_page.dart'; // Pastikan Anda memiliki file login_page.dart

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CashFlow',
      theme: ThemeData(primarySwatch: Colors.teal),
      debugShowCheckedModeBanner: false,
      initialRoute: '/', // Splash screen sebagai awal
      routes: {
        '/': (context) => SplashScreen(), // Splash screen
        '/home': (context) => HomeScreen(), // Home screen setelah onboarding
        '/login': (context) => LoginPage(), // Halaman login
      },
    );
  }
}

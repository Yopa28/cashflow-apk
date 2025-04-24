import 'package:cashflow_app/page/dashboard_page.dart';
import 'package:flutter/material.dart';
import 'nota.dart'; // Import NotaPage untuk navigasi

class BookingDonePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Booking Done'), backgroundColor: Colors.teal),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Success Icon
            Icon(Icons.check_circle_outline, color: Colors.teal, size: 80),
            SizedBox(height: 16),
            // Congratulations Text
            Text(
              'Congratulations!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 8),
            // Order Success Text
            Text(
              'Pesanan makanannmu berhasil dilakukan. Kamu bisa cek pesananmu di menu Profil.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            SizedBox(height: 16),
            // Date & Time
            Text(
              'Fri, April 28, 10:10 PM',
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            SizedBox(height: 32),
            // Buttons at the bottom
            ElevatedButton(
              onPressed: () {
                // Navigate to NotaPage when "View E-Receipt" is clicked
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NotaPage()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
                padding: EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text(
                'View E-Receipt',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Navigate back to DashboardPage when "Go to Home" is clicked
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => DashboardPage()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal.withOpacity(0.7),
                padding: EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text(
                'Go to Home',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'register_page.dart'; // Import RegisterPage
import 'dashboard_page.dart'; // Import DashboardPage

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Masuk lewat Email'),
        backgroundColor: Colors.teal,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 40),

            // Email Field
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey.shade300), // Border color
              ),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Email',
                  hintText: 'Enter your email',
                  border: InputBorder.none, // No border for TextField
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 10.0,
                    horizontal: 12.0,
                  ),
                ),
              ),
            ),
            SizedBox(height: 16),

            // Password Field
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey.shade300), // Border color
              ),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Kata sandi',
                  hintText: 'Enter your password',
                  border: InputBorder.none, // No border for TextField
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 10.0,
                    horizontal: 12.0,
                  ),
                ),
              ),
            ),
            SizedBox(height: 8),

            // Forgot Password Link
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  // Add your logic for "Lupa kata sandi?"
                },
                child: Text('Lupa kata sandi?'),
              ),
            ),
            SizedBox(height: 16),

            // Login Button
            ElevatedButton(
              onPressed: () {
                // Use push instead of pushReplacement to see if the page loads correctly
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder:
                        (context) =>
                            DashboardPage(), // Navigasi ke DashboardPage
                  ),
                );
              },
              child: Text('Masuk'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
                padding: EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            SizedBox(height: 24),

            // Or Divider
            Row(
              children: <Widget>[
                Expanded(child: Divider()),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text('Atau'),
                ),
                Expanded(child: Divider()),
              ],
            ),
            SizedBox(height: 24),

            // Google Login Button
            OutlinedButton.icon(
              onPressed: () {
                // Add your Google sign-in logic here
              },
              icon: Icon(Icons.account_circle),
              label: Text('Masuk dengan Google'),
              style: OutlinedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            SizedBox(height: 16),

            // Register Link - Navigate to RegisterPage using pushReplacement
            Center(
              child: TextButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RegisterPage(),
                    ), // Replace current page with RegisterPage
                  );
                },
                child: Text('Belum punya akun? Daftar'),
              ),
            ),
            SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}

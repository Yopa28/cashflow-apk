import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RegisterPage extends StatefulWidget {
  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool _obscurePassword1 = true;
  bool _obscurePassword2 = true;
  bool _agreeTerms = false;
  bool _isRegistered = false; // Track registration status

  // Controllers for the form fields
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  // Registration function
  void _register() {
    // Basic validation to check if passwords match
    if (passwordController.text == confirmPasswordController.text) {
      setState(() {
        _isRegistered = true; // Show success message
      });
      // Show the success message in SnackBar
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Berhasil membuat akun'),
              TextButton(
                onPressed: () {
                  // Navigate to Login Page
                  Navigator.pushReplacementNamed(context, '/login');
                },
                child: Text('Login', style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
          backgroundColor: Colors.green,
          duration: Duration(seconds: 4),
        ),
      );
    } else {
      // Show error message if passwords do not match
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('Password tidak cocok!'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('Tutup'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Daftar lewat Email'),
        backgroundColor: Colors.teal,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: _buildRegisterForm(),
      ),
    );
  }

  // Registration Form UI
  Widget _buildRegisterForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(height: 20),

        // Email Field with Radius
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.grey.shade300), // Border color
          ),
          child: TextField(
            controller: emailController,
            decoration: InputDecoration(
              labelText: 'Email',
              hintText: 'Masukan email',
              border: InputBorder.none, // Remove border from TextField itself
              contentPadding: EdgeInsets.symmetric(
                vertical: 10.0,
                horizontal: 12.0,
              ),
            ),
          ),
        ),
        SizedBox(height: 16),

        // Password Field with Radius
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.grey.shade300), // Border color
          ),
          child: TextField(
            controller: passwordController,
            obscureText: _obscurePassword1,
            decoration: InputDecoration(
              labelText: 'Kata sandi',
              hintText: 'Masukan kata sandi',
              border: InputBorder.none, // Remove border from TextField itself
              contentPadding: EdgeInsets.symmetric(
                vertical: 10.0,
                horizontal: 12.0,
              ),
              suffixIcon: IconButton(
                icon: Icon(
                  _obscurePassword1 ? Icons.visibility_off : Icons.visibility,
                ),
                onPressed: () {
                  setState(() {
                    _obscurePassword1 = !_obscurePassword1;
                  });
                },
              ),
            ),
          ),
        ),
        SizedBox(height: 16),

        // Confirm Password Field with Radius
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.grey.shade300), // Border color
          ),
          child: TextField(
            controller: confirmPasswordController,
            obscureText: _obscurePassword2,
            decoration: InputDecoration(
              labelText: 'Ulangi kata sandi',
              hintText: 'Masukan kata sandi',
              border: InputBorder.none, // Remove border from TextField itself
              contentPadding: EdgeInsets.symmetric(
                vertical: 10.0,
                horizontal: 12.0,
              ),
              suffixIcon: IconButton(
                icon: Icon(
                  _obscurePassword2 ? Icons.visibility_off : Icons.visibility,
                ),
                onPressed: () {
                  setState(() {
                    _obscurePassword2 = !_obscurePassword2;
                  });
                },
              ),
            ),
          ),
        ),
        SizedBox(height: 16),

        // Checkbox & Terms
        Row(
          children: [
            Checkbox(
              value: _agreeTerms,
              onChanged: (value) {
                setState(() {
                  _agreeTerms = value ?? false;
                });
              },
            ),
            Text('Setuju dengan '),
            GestureDetector(
              onTap: () {
                // Navigate to terms and conditions
              },
              child: Text(
                'Syarat & Ketentuan',
                style: TextStyle(
                  color: Colors.teal,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 16),

        // Daftar Button with Radius
        ElevatedButton(
          onPressed: _agreeTerms ? _register : null,
          child: Text('Daftar'),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.teal,
            padding: EdgeInsets.symmetric(vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8), // Button radius
            ),
          ),
        ),
        SizedBox(height: 40),
      ],
    );
  }
}

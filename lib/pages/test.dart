// lib/login_screen.dart
/*
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'pages/login.dart'; // replace with the correct path
import 'pages/singup.dart'; // replace with the correct path


void main() {
  runApp(const MyApp());
}

class DiabetesLoginScreen extends StatelessWidget {
  const DiabetesLoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF9D84E8),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 60),
              const Text(
                "Welcome to Diabetes App",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),

              // Create Account Button
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const SignupScreen()),
                  );
                },
                child: _buildButton("Create Account", Colors.black87, Colors.white),
              ),
              const SizedBox(height: 20),

              // Sign In Button
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const SignupScreen()),
                  );
                },
                child: _buildButton("Sign In", Colors.white, Colors.black87),
              ),
              const SizedBox(height: 40),

              // Optional: social login buttons
              _buildSocialButton(
                "Continue with Google",
                Colors.white,
                Colors.black87,
                FontAwesomeIcons.google,
                Colors.red,
              ),
              const SizedBox(height: 15),
              _buildSocialButton(
                "Continue with Facebook",
                Color(0xFF3b5998),
                Colors.white,
                FontAwesomeIcons.facebookF,
                Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildButton(String text, Color bgColor, Color textColor) {
    return Container(
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            color: textColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildSocialButton(
      String text, Color bgColor, Color textColor, IconData icon, Color iconColor) {
    return Container(
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: iconColor),
          const SizedBox(width: 10),
          Text(
            text,
            style: TextStyle(
              color: textColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
*/
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:codeminds_mobile_application/screens/home_screen.dart';
import 'package:codeminds_mobile_application/screens/register_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _buildLogo(),
              const SizedBox(height: 24.0),
              _buildTitle(),
              const SizedBox(height: 32.0),
              _buildForm(context),
              const SizedBox(height: 16.0),
              _buildRegisterText(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLogo() {
    return Image.asset(
      'assets/images/CodeMinds-Logo.png',
      height: 150,
      width: 150,
    );
  }

  Widget _buildTitle() {
    return Column(
      children: const [
        Text(
          'Log In',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8.0),
        Text(
          'Enter your login credentials',
          style: TextStyle(fontSize: 14, color: Colors.black54),
        ),
      ],
    );
  }

  Widget _buildForm(BuildContext context) {
    return Column(
      children: [
        _buildTextField(label: 'Username'),
        const SizedBox(height: 16.0),
        _buildTextField(label: 'Password', obscureText: true),
        const SizedBox(height: 24.0),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const HomeScreen()),
              );
            },
            child: const Text('Log In'),
          ),
        ),
      ],
    );
  }

  Widget _buildRegisterText(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: "Don't have an account? ",
        style: const TextStyle(fontSize: 16.0, color: Colors.black54),
        children: [
          TextSpan(
            text: 'Register',
            style: const TextStyle(
              color: Colors.blue,
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.underline,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const RegisterScreen()),
                );
              },
          ),
        ],
      ),
    );
  }

  Widget _buildTextField({required String label, bool obscureText = false}) {
    return TextField(
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: label,
        filled: true,
        fillColor: const Color(0xFFFFFDE7),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
      ),
    );
  }
}
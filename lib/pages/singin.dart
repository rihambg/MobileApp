import 'package:flutter/material.dart';
import 'login.dart';
import 'package:google_fonts/google_fonts.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  final _fullNameController = TextEditingController();
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isPasswordVisible = false;
  String? selectedRole;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF9F8FEF),
              Color(0xFF9F8FEF),
              Color(0xFFB8A5F2),
              Color(0x00000000),
            ],
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        child: SafeArea(
          child: LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                reverse: true,
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: constraints.maxHeight),
                  child: IntrinsicHeight(
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // App Bar Row
                          Padding(
                            padding: const EdgeInsets.only(top: 16.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'DIABETES APP',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                IconButton(
                                  icon: const Icon(Icons.menu, color: Colors.white),
                                  onPressed: () {},
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 32),

                          // Centered Heading
                          Center(
                            child: Column(
                              children: [
                                Text(
                                  'CREATE ACCOUNT NOW!',
                                  style: GoogleFonts.jockeyOne(
                                    color: const Color(0xFF333333),
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  'signup to get started ...',
                                  style: GoogleFonts.jockeyOne(
                                    color: const Color(0xFF666666),
                                    fontSize: 14,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 32),

                          // Full Name field
                          const Row(
                            children: [
                              Icon(Icons.person, color: Colors.black, size: 20),
                              SizedBox(width: 8),
                              Text('Full Name', style: TextStyle(color: Colors.black, fontSize: 14)),
                            ],
                          ),
                          const SizedBox(height: 8),
                          TextFormField(
                            controller: _fullNameController,
                            decoration: _inputDecoration('Enter your full name'),
                            validator: (value) => (value == null || value.isEmpty) ? 'Please enter your full name' : null,
                          ),
                          const SizedBox(height: 18),

                          // Username field
                          const Row(
                            children: [
                              Icon(Icons.account_circle, color: Colors.black, size: 20),
                              SizedBox(width: 8),
                              Text('Username', style: TextStyle(color: Colors.black, fontSize: 14)),
                            ],
                          ),
                          const SizedBox(height: 8),
                          TextFormField(
                            controller: _usernameController,
                            decoration: _inputDecoration('Create a username'),
                            validator: (value) => (value == null || value.isEmpty) ? 'Please enter a username' : null,
                          ),
                          const SizedBox(height: 18),

                          // Email field
                          const Row(
                            children: [
                              Icon(Icons.email, color: Colors.black, size: 20),
                              SizedBox(width: 8),
                              Text('Email', style: TextStyle(color: Colors.black, fontSize: 14)),
                            ],
                          ),
                          const SizedBox(height: 8),
                          TextFormField(
                            controller: _emailController,
                            decoration: _inputDecoration('Enter your email'),
                            validator: (value) => (value == null || value.isEmpty) ? 'Please enter your email' : null,
                          ),
                          const SizedBox(height: 18),

                          // Password field
                          const Row(
                            children: [
                              Icon(Icons.lock, color: Colors.black, size: 20),
                              SizedBox(width: 8),
                              Text('Password', style: TextStyle(color: Colors.black, fontSize: 14)),
                            ],
                          ),
                          const SizedBox(height: 8),
                          TextFormField(
                            controller: _passwordController,
                            obscureText: !_isPasswordVisible,
                            decoration: _inputDecoration('Enter your password').copyWith(
                              suffixIcon: IconButton(
                                icon: Icon(
                                  _isPasswordVisible ? Icons.visibility_off : Icons.visibility,
                                  color: Colors.black54,
                                ),
                                onPressed: () => setState(() => _isPasswordVisible = !_isPasswordVisible),
                              ),
                            ),
                            validator: (value) => (value == null || value.length < 6)
                                ? 'Password must be at least 6 characters'
                                : null,
                          ),
                          const SizedBox(height: 18),

                          // Role dropdown
                          const Row(
                            children: [
                              Icon(Icons.group, color: Colors.black, size: 20),
                              SizedBox(width: 8),
                              Text('Role', style: TextStyle(color: Colors.black, fontSize: 14)),
                            ],
                          ),
                          const SizedBox(height: 8),
                          DropdownButtonFormField<String>(
                            decoration: _inputDecoration('Choose your role'),
                            hint: const Text('Select Role'),
                            value: selectedRole,
                            items: const [
                              DropdownMenuItem(child: Text('Patient'), value: 'Patient'),
                              DropdownMenuItem(child: Text('Doctor'), value: 'Doctor'),
                              DropdownMenuItem(child: Text('Other'), value: 'Other'),
                            ],
                            onChanged: (value) => setState(() => selectedRole = value),
                          ),
                          const SizedBox(height: 28),

                          // Signup button
                          Center(
                            child: ElevatedButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(content: Text('Signing up...')),
                                  );
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.black87,
                                foregroundColor: Colors.white,
                                minimumSize: const Size(double.infinity, 48),
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
                              ),
                              child: const Text('Signup', style: TextStyle(fontSize: 18)),
                            ),
                          ),
                          const SizedBox(height: 16),

                          // Go to login link
                          Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text('Already have an account? ',
                                    style: TextStyle(color: Colors.white, fontSize: 12)),
                                GestureDetector(
                                  onTap: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => const LoginScreen()),
                                  ),
                                  child: const Text(
                                    'LOG IN',
                                    style: TextStyle(
                                        color: Colors.blueAccent, decoration: TextDecoration.underline),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 24),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  InputDecoration _inputDecoration(String hint) {
    return InputDecoration(
      hintText: hint,
      filled: true,
      fillColor: Colors.white.withOpacity(0.2),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      errorStyle: const TextStyle(color: Colors.redAccent, fontSize: 12, height: 1.5),
    );
  }
}

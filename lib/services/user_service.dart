import 'package:http/http.dart' as http;
import 'dart:convert';

class UserService {
  static Future<void> signupUser({
    required String fullName,
    required String username,
    required String email,
    required String password,
    required String role,
  }) async {
    final url = Uri.parse('http://localhost:5000/api/signup'); // Update to your actual backend URL

    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'full_name': fullName,
        'username': username,
        'email': email,
        'password': password,
        'role': role,
      }),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to signup');
    }
  }
}

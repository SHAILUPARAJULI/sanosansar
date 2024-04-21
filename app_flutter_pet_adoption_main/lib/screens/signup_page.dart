import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    late String _username = '';
    late String _email = '';
    late String _password = '';

    void _handleSignUp(BuildContext context) async {
      try {
        final response = await http.post(
          Uri.parse('http://192.168.1.66/dashboard/php_scripts/signup.php'),
          headers: <String, String>{
            'Content-Type': 'application/json',
          },
          body: jsonEncode(<String, String>{
            'username': _username,
            'email': _email,
            'password': _password,
          }),
        );

        if (response.statusCode == 200) {
          // Account created successfully
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text('Account Created'),
                content: const Text('Your account has been created successfully!'),
                actions: <Widget>[
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('OK'),
                  ),
                ],
              );
            },
          );
        } else {
          // Account creation failed
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text('Error'),
                content: const Text('Failed to create account. Please try again.'),
                actions: <Widget>[
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('OK'),
                  ),
                ],
              );
            },
          );
        }
      } catch (e) {
        // Handle any errors or exceptions
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Error'),
              content: Text('An error occurred: $e'),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('OK'),
                ),
              ],
            );
          },
        );
      }
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Sign Up',
              style: TextStyle(
                fontSize: 36,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Enter Your Sign Up Details',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              onChanged: (value) => _username = value,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                labelText: 'Username',
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              onChanged: (value) => _email = value,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                labelText: 'Email',
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              onChanged: (value) => _password = value,
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                labelText: 'Password',
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 50,
              width: 250,
              child: ElevatedButton(
                onPressed: () => _handleSignUp(context),
                child: const Text('Sign Up'),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    title: 'Sign Up Demo',
    home: SignUpPage(),
  ));
}

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pet_app/screens/signup_page.dart';
import 'root_app.dart'; // Importing the file where RootApp is defined

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late String _username;
  late String _password;

  @override
  void initState() {
    super.initState();
    _username = '';
    _password = '';
  }

  void _handleUsernameChange(String value) {
    setState(() {
      _username = value;
    });
  }

  void _handlePasswordChange(String value) {
    setState(() {
      _password = value;
    });
  }

  void _handleLogin(BuildContext context) async {
    // Create a map containing login data
    Map<String, String> loginData = {
      'username': _username,
      'password': _password,
    };

    // Send the login data to the PHP script using HTTP POST request
    var url = 'http://192.168.1.66/dashboard/php_scripts/login.php'; // Replace with your PHP script URL
    var response = await http.post(Uri.parse(url), body: loginData);

    // Check the response from the PHP script
    if (response.statusCode == 200) {
      // Parse the response JSON
      Map<String, dynamic> data = jsonDecode(response.body);

      // Check if login was successful
      if (data['success']) {
        // If login successful, navigate to the root app
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const RootApp()),
        );
      } else {
        // If login failed, show error message
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Error'),
              content: Text(data['message']),
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
    } else {
      // If request failed, show error message
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Error'),
            content: Text('Failed to login. Please try again.'),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset('images\paw.png'),
            const Text(
              'Log In',
              style: TextStyle(
                fontSize: 36,
                color: Colors.black,
              ),
            ),
            const Text(
              'Enter Your LogIn Details',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              onChanged: _handleUsernameChange,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                labelText: 'Username',
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              onChanged: _handlePasswordChange,
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
                onPressed: () => _handleLogin(context),
                child: const Text('Login'),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Text(
                  "Don't have an account?",
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(width: 5),
                InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const SignUpPage()));
                  },
                  child: const Text(
                    "Create an account",
                    style: TextStyle(fontSize: 16, color: Colors.blue),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
<<<<<<< Updated upstream
=======
import 'login_page.dart'; // Importing the login page
>>>>>>> Stashed changes

class SignUpPage extends StatelessWidget {
  final String? title;

<<<<<<< Updated upstream
  const SignUpPage({Key? key, this.title}) : super(key: key);
=======
  final String title;

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  late String _username;
  late String _email;
  late String _password;

  @override
  void initState() {
    super.initState();
    _username = '';
    _email = '';
    _password = '';
  }

  void _handleUsernameChange(String value) {
    setState(() {
      _username = value;
    });
  }

  void _handleEmailChange(String value) {
    setState(() {
      _email = value;
    });
  }

  void _handlePasswordChange(String value) {
    setState(() {
      _password = value;
    });
  }

  void _handleSignUp(BuildContext context) async {
    // Create a map containing signup data
    Map<String, String> signUpData = {
      'username': _username,
      'email': _email,
      'password': _password,
    };

    try {
      // Send the signup data to the PHP script using HTTP POST request
      var url = 'http://192.168.1.66/dashboard/php_scripts/signup.php';
      var response = await http.post(Uri.parse(url), body: signUpData);

      // Check the response status code
      if (response.statusCode == 200) {
        // If signup successful, show success dialog
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Account Created'),
              content:
                  const Text('Your account has been created successfully!'),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    // Navigate back to the login page
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            const LoginPage(title: 'Login Page'),
                      ),
                    );
                  },
                  child: const Text('OK'),
                ),
              ],
            );
          },
        );
      } else {
        // If server responded with an error, show error message
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Error'),
              content: Text(
                  'Failed to create account. Server Error: ${response.statusCode}'),
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
      // If an exception occurs (e.g., network error), show generic error message
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Error'),
            content: const Text(
                'Failed to create account. Please check your internet connection and try again.'),
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
>>>>>>> Stashed changes

  @override
  Widget build(BuildContext context) {
    String _username = '';
    String _email = '';
    String _password = '';

    void _handleSignUp(BuildContext context) async {
      try {
        final response = await http.post(
          Uri.parse('http://localhost:3000/auth/signup'),
          headers: <String, String>{
            'Content-Type': 'application/json',
          },
          body: jsonEncode(<String, String>{
            'username': _username,
            'email': _email,
            'password': _password,
          }),
        );

        if (response.statusCode == 201) {
          // Account created successfully
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text('Account Created'),
                content:
                const Text('Your account has been created successfully!'),
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
                content:
                const Text('Failed to create account. Please try again.'),
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
<<<<<<< Updated upstream
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
=======
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
>>>>>>> Stashed changes
                labelText: 'Username',
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              onChanged: (value) => _email = value,
              decoration: InputDecoration(
<<<<<<< Updated upstream
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
=======
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
>>>>>>> Stashed changes
                labelText: 'Email',
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              onChanged: (value) => _password = value,
              obscureText: true,
              decoration: InputDecoration(
<<<<<<< Updated upstream
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
=======
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
>>>>>>> Stashed changes
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
<<<<<<< Updated upstream
=======
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Already have an account?",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center,
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const LoginPage(title: 'Login Page')),
                    );
                  },
                  child: const Text(
                    " Log in",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.blue,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
>>>>>>> Stashed changes
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

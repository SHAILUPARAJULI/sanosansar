import 'package:flutter/material.dart';
import 'login_page.dart'; // Importing the login page

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key, required this.title}) : super(key: key);

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

  void _handleSignUp(BuildContext context) {
    // For simplicity, I'm just printing the entered values
    print('Username: $_username');
    print('Email: $_email');
    print('Password: $_password');

    // Show dialog indicating account creation
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
                // Navigate back to the login page
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoginPage(title: 'Login Page'),
                  ),
                );
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
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
              onChanged: _handleUsernameChange,
              decoration: InputDecoration(
                border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                labelText: 'Username',
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              onChanged: _handleEmailChange,
              decoration: InputDecoration(
                border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                labelText: 'Email',
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              onChanged: _handlePasswordChange,
              obscureText: true,
              decoration: InputDecoration(
                border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
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
          ],
        ),
      ),
    );
  }
}

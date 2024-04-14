import 'package:flutter/material.dart';
import 'package:pet_app/screens/login_page.dart';
import 'screens/root_app.dart';
import 'theme/color.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pet App',
      theme: ThemeData(
        primaryColor: AppColor.primary,
      ),
      home: const LoginPage(title: 'LogIn Page'),
    );
  }
}

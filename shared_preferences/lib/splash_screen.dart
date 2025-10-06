import 'dart:async';

import 'package:flutter/material.dart';
import 'package:learning_shared_preferences/home_screen.dart';
import 'package:learning_shared_preferences/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () => isLogin());
  }

  void isLogin() async {
    SharedPreferences instance = await SharedPreferences.getInstance();
    if (instance.getString("username") == null) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => LoginPage()),
      );
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Image(
        height: double.infinity,
        fit: BoxFit.fitHeight,
        image: NetworkImage(
          "https://images.pexels.com/photos/33435611/pexels-photo-33435611.jpeg",
        ),
      ),
    );
  }
}

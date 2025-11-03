import 'package:flutter/material.dart';
import 'package:learning_navigation/screen_two.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Learning Navigation")),
      body: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ScreenTwo(title: "Conventional Method"),
            ),
          );
        },
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Container(
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(color: Colors.green),
              child: Center(child: Text("Click Me")),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:learning_routes/utils/route_name.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Learning Routes")),
      body: Center(
        child: InkWell(
          onTap: () {
            Navigator.pushNamed(
              context,
              RouteName.screenTwo,
              arguments: {'name': 'Bhavya', 'age': 21},
            );
          },
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(color: Colors.green),
              child: Center(child: Text("Home Screen")),
            ),
          ),
        ),
      ),
    );
  }
}

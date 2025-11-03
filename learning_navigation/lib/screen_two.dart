import 'package:flutter/material.dart';
import 'package:learning_navigation/screen_three.dart';

class ScreenTwo extends StatefulWidget {
  final String title;
  const ScreenTwo({super.key, required this.title});

  @override
  State<ScreenTwo> createState() => _ScreenTwoState();
}

class _ScreenTwoState extends State<ScreenTwo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title.toString())),
      body: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ScreenThree(title: widget.title),
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
              child: Center(child: Text("Screen two")),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class ScreenThree extends StatefulWidget {
  final String title;
  final int val;
  const ScreenThree({super.key, required this.title, this.val = 3});

  @override
  State<ScreenThree> createState() => _ScreenThreeState();
}

class _ScreenThreeState extends State<ScreenThree> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title.toString() + widget.val.toString()),
      ),
      body: InkWell(
        onTap: () {
          Navigator.pop(context);
        },
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Container(
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(color: Colors.green),
              child: Center(child: Text("Screen three")),
            ),
          ),
        ),
      ),
    );
  }
}

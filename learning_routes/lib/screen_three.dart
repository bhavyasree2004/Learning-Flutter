import 'package:flutter/material.dart';
import 'package:learning_routes/utils/route_name.dart';

class ScreenThree extends StatefulWidget {
  const ScreenThree({super.key});

  @override
  State<ScreenThree> createState() => _ScreenThreeState();
}

class _ScreenThreeState extends State<ScreenThree> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Third Screen")),
      body: Center(
        child: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(color: Colors.green),
              child: Center(child: Text("Screen Three")),
            ),
          ),
        ),
      ),
    );
    ;
  }
}

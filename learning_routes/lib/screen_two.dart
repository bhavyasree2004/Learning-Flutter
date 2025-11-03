import 'package:flutter/material.dart';
import 'package:learning_routes/utils/route_name.dart';

class ScreenTwo extends StatefulWidget {
  dynamic arguments;
  ScreenTwo({super.key,required this.arguments});

  @override
  State<ScreenTwo> createState() => _ScreenTwoState();
}

class _ScreenTwoState extends State<ScreenTwo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.arguments['name'])),
      body: Center(
        child: InkWell(
          onTap: () {
            Navigator.pushNamed(context, RouteName.screenThree);
          },
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(color: Colors.green),
              child: Center(child: Text("Screen Two")),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    int count = 0;
    return Scaffold(
      appBar: AppBar(
        title: Text("Stateless Widget"),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Text(count.toString(), style: TextStyle(fontSize: 24)),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print(count);
          count++;
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

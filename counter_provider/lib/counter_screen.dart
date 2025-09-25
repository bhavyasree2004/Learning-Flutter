import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'counter_provider.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _CounterScreenState();
  }
}

class _CounterScreenState extends State<StatefulWidget> {
  @override
  Widget build(BuildContext context) {
    print("this is main build");
    final countProvider = Provider.of<CounterProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(title: Text("Counter App"), backgroundColor: Colors.blue),
      body: Consumer<CounterProvider>(
        builder: (BuildContext context, value, Widget? child) {
          print("Only this is rebuilding");
          return Center(
            child: Text(value.count.toString(), style: TextStyle(fontSize: 24)),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          countProvider.setCount();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

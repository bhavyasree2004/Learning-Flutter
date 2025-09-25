import 'package:counter_app_provider/counter_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    print("Calling top level build");
    final counterProvider = Provider.of<CounterProvider>(
      context,
      listen: false,
    );
    return Scaffold(
      appBar: AppBar(title: Text("Counter App"), backgroundColor: Colors.blue),
      body: Center(
        child: Consumer<CounterProvider>(
          builder: (BuildContext context, value, Widget? child) {
            print("Rebuilding text");
            return Text(value.count.toString(), style: TextStyle(fontSize: 24));
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          counterProvider.setCount();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

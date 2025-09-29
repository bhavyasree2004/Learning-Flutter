import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final nameProvider = Provider<String>((ref) => "Sample");
final valProvider = Provider<int>((ref) => 29);

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final name = ref.watch(nameProvider);
    final val = ref.watch(valProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text("Basic Provider"),
        backgroundColor: Colors.blue,
      ),
      body: Center(child: Text("$name $val", style: TextStyle(fontSize: 46))),
    );
  }
}

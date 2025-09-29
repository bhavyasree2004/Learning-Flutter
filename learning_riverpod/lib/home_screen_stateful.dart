import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final nameProvider = Provider<String>((ref) => "Sample");
final valProvider = Provider<int>((ref) => 29);

class HomeScreenStateful extends ConsumerStatefulWidget {
  const HomeScreenStateful({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _HomeScreenStateful();
  }
}

class _HomeScreenStateful extends ConsumerState<ConsumerStatefulWidget> {
  @override
  Widget build(BuildContext context) {
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

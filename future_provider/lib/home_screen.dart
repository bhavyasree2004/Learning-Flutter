import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:future_provider/future_provider.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(futureProvider);
    return Scaffold(
      body: Center(
        child: provider.when(
          data: (int data) {
            return Text(data.toString());
          },
          error: (Object error, StackTrace stackTrace) {
            return Center(child: Text(error.toString()));
          },
          loading: () {
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stream_provider/stream_provider.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: Consumer(
          builder: (context, ref, child) {
            final provider = ref.watch(streamProvider);
            return provider.when(
              data: (data) {
                return Text(data.toString(), style: TextStyle(fontSize: 46));
              },
              error: (error, stackTrace) {
                return Text(error.toString());
              },
              loading: () {
                return CircularProgressIndicator();
              },
            );
          },
        ),
      ),
    );
  }
}

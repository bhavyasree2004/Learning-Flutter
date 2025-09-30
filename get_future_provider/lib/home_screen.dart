import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_future_provider/future_provider.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final responseList = ref.watch(futureProvider);
    return Scaffold(
      body: Center(
        child: responseList.when(
          data: (data) => ListView.builder(
            itemCount: data.length,
            itemBuilder: (builder, index) {
              return Card(
                child: ListTile(
                  title: Text(data[index].title),
                  subtitle: Text(data[index].body),
                ),
              );
            },
          ),
          error: (error, st) => Center(child: Text(error.toString())),
          loading: () => Center(child: CircularProgressIndicator()),
        ),
      ),
    );
  }
}

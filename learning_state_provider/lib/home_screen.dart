import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learning_state_provider/search_provider.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              onChanged: (val) {
                ref.read(searchProvider.notifier).search(val);
              },
            ),
            Consumer(
              builder: (context, ref, child) {
                final search = ref.watch(
                  searchProvider.select((state) => state.search),
                );
                return Text(search);
              },
            ),
            Consumer(
              builder: (context, ref, child) {
                final isOn = ref.watch(
                  searchProvider.select((state) => state.isOn),
                );
                return Switch(
                  value: isOn,
                  onChanged: (val) {
                    ref.read(searchProvider.notifier).toggle(val);
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

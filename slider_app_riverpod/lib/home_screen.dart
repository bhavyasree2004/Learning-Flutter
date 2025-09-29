import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:slider_app_riverpod/slider_provider.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print("Build");
    return Scaffold(
      appBar: AppBar(title: Text("Slider App")),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer(
              builder: (BuildContext context, WidgetRef ref, Widget? child) {
                final toggle = ref.watch(
                  sliderProvider.select((state) => state.toggle),
                );
                print("Toggle build");
                return InkWell(
                  onTap: () {
                    final stateProvider = ref.read(sliderProvider.notifier);
                    stateProvider.state = stateProvider.state.copyWith(
                      toggle: !toggle,
                    );
                  },
                  child: toggle
                      ? Icon(Icons.image)
                      : Icon(Icons.remove_red_eye),
                );
              },
            ),
            Row(
              children: [
                Consumer(
                  builder:
                      (BuildContext context, WidgetRef ref, Widget? child) {
                        final val = ref.watch(
                          sliderProvider.select((state) => state.val),
                        );
                        return Expanded(
                          child: Container(
                            height: 100,
                            decoration: BoxDecoration(
                              color: Colors.pinkAccent.withOpacity(val),
                            ),
                            child: Center(child: Text("Sample text 1")),
                          ),
                        );
                      },
                ),
                Consumer(
                  builder:
                      (BuildContext context, WidgetRef ref, Widget? child) {
                        final val = ref.watch(
                          sliderProvider.select((state) => state.val),
                        );
                        return Expanded(
                          child: Container(
                            height: 100,
                            decoration: BoxDecoration(
                              color: Colors.purple.withOpacity(val),
                            ),
                            child: Center(child: Text("Sample text 2")),
                          ),
                        );
                      },
                ),
              ],
            ),
            Consumer(
              builder: (context, ref, child) {
                final val = ref.watch(
                  sliderProvider.select((state) => state.val),
                );
                print("slider build");
                return Slider(
                  value: val,
                  onChanged: (value) {
                    final stateProvider = ref.read(sliderProvider.notifier);
                    stateProvider.state = stateProvider.state.copyWith(
                      val: value,
                    );
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

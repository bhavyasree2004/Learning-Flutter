import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:slider_app/slider_provider.dart';

class SliderScreen extends StatelessWidget {
  const SliderScreen({super.key});
  @override
  Widget build(BuildContext context) {
    print("Build is getting called");
    final sliderProvider = Provider.of<SliderProvider>(context, listen: false);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Consumer<SliderProvider>(
            builder: (BuildContext context, value, Widget? child) {
              print("Slider is getting build");
              return Slider(
                value: value.value,
                onChanged: (val) {
                  value.setValue(val);
                },
              );
            },
          ),
          Consumer<SliderProvider>(
            builder: (context, value, child) {
              print("Containers are rebuilding");
              return Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.red.withOpacity(value.value),
                      ),
                      child: Center(child: Text("Container 1")),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.green.withOpacity(value.value),
                      ),
                      child: Center(child: Text("Container 2")),
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}

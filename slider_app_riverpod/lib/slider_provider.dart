import 'package:flutter_riverpod/legacy.dart';

final sliderProvider = StateProvider<AppState>(
  (ref) => AppState(val: 0.5, toggle: false),
);

class AppState {
  final double val;
  final bool toggle;
  AppState({required this.val, required this.toggle});

  AppState copyWith({double? val, bool? toggle}) {
    return AppState(val: val ?? this.val, toggle: toggle ?? this.toggle);
  }
}

import 'package:flutter_riverpod/legacy.dart';

final searchProvider = StateNotifierProvider<SearchNotifier, SearchState>(
  (ref) => SearchNotifier(),
);

class SearchNotifier extends StateNotifier<SearchState> {
  SearchNotifier() : super(SearchState(search: '', isOn: false));
  void search(String str) {
    state = state.copyWith(search: str);
  }

  void toggle(bool isOn) {
    state = state.copyWith(isOn: isOn);
  }
}

class SearchState {
  final String search;
  final bool isOn;
  SearchState({required this.search, required this.isOn});
  SearchState copyWith({String? search, bool? isOn}) {
    return SearchState(search: search ?? this.search, isOn: isOn ?? this.isOn);
  }
}

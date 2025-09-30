class ToDo {
  final String title;
  final bool isDone;
  ToDo({required this.title, required this.isDone});

  ToDo copyWith({String? title, bool? isDone}) {
    return ToDo(title: title ?? this.title, isDone: isDone ?? this.isDone);
  }
}

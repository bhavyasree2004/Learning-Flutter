import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

final futureProvider = FutureProvider<List<UserData>>((ref) async {
  try {
    final response = await http.get(
      Uri.parse("https://jsonplaceholder.typicode.com/posts"),
      headers: {
        "Accept": "application/json",
        "User-Agent": "FlutterApp/1.0.0"
      },
    );
    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      List<UserData> postsData = data
          .map((item) => UserData.fromJson(item))
          .toList();
      return postsData;
    } else {
      throw "Something went wrong";
    }
  } catch (e) {
    rethrow;
  }
});

class UserData {
  final int userId;
  final int id;
  final String title;
  final String body;
  UserData({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });
  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }
}

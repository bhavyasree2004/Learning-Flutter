import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:learning_apis/models/users_model.dart';
import 'package:http/http.dart' as http;

class HomeScreen2 extends StatefulWidget {
  const HomeScreen2({super.key});

  @override
  State<HomeScreen2> createState() => _HomeScreen2State();
}

class _HomeScreen2State extends State<HomeScreen2> {
  Future<List<UsersModel>> getUsersApi() async {
    final response = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/users'),
    );

    if (response.statusCode == 200) {
      final List json = jsonDecode(response.body.toString());
      return json.map((i) => UsersModel.fromJson(i)).toList();
    } else {
      throw Exception('Failed to load users');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Users")),
      body: FutureBuilder<List<UsersModel>>(
        future: getUsersApi(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            print("Error: ${snapshot.error}");
            return const Center(child: Text("Something went wrong"));
          } else if (snapshot.hasData) {
            final users = snapshot.data!;
            return ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) {
                return Card(
                  child: Column(
                    children: [
                      customisedRow("Name:", users[index].name!),
                      customisedRow("Email:", users[index].email!),
                      customisedRow("City:", users[index].address!.city!),
                      customisedRow("Lat:", users[index].address!.geo!.lat!),
                    ],
                  ),
                );
              },
            );
          } else {
            return const Center(child: Text("No data found"));
          }
        },
      ),
    );
  }
}

Widget customisedRow(String text, String description) {
  return Row(children: [Text("$text "), Text(description)]);
}

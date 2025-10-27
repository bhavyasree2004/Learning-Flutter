import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<List<Photos>> getPhotosApi() async {
    final response = await http.get(
      Uri.parse('https://dummyjson.com/products'),
    );

    if (response.statusCode == 200) {
      final decoded = jsonDecode(response.body);
      final List products = decoded['products'];

      return products.map((e) {
        return Photos(title: e['title'], url: e['thumbnail'], id: e['id'], description: e['description']);
      }).toList();
    } else {
      throw Exception('Failed with status: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Products',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),backgroundColor: Colors.blue,),
      body: FutureBuilder<List<Photos>>(
        future: getPhotosApi(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            print('Error occurred: ${snapshot.error}');
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No products found'));
          }

          final photos = snapshot.data!;
          return ListView.builder(
            itemCount: photos.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: Image.network(
                  photos[index].url,
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                ),
                title: Text(photos[index].title),
                subtitle: Text(photos[index].description),
                trailing: Text('ID: ${photos[index].id}'),
              );
            },
          );
        },
      ),
    );
  }
}

class Photos {
  final String title, url,description;
  final int id;
  Photos({required this.title, required this.url,required this.description, required this.id});
}

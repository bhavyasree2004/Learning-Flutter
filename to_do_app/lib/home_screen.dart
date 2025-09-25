import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/todo.dart';
import 'package:to_do_app/todo_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final todoProvider = Provider.of<TodoProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "To Do App",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Consumer<TodoProvider>(
        builder: (BuildContext context, val, Widget? child) {
          if (val.todoList.isEmpty) {
            return Center(child: Text("No tasks!"));
          }
          return ListView.builder(
            itemCount: val.todoList.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(val.todoList[index].title),
                leading: Checkbox(
                  value: val.todoList[index].isDone,
                  onChanged: (value) {
                    val.toggleCheckBox(index);
                  },
                ),
                trailing: InkWell(
                  child: Icon(Icons.delete),
                  onTap: () {
                    val.removeTask(index);
                  },
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _createTask(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

Future<void> _createTask(BuildContext context) {
  final todoProvider = Provider.of<TodoProvider>(context, listen: false);
  final TextEditingController controller = TextEditingController();
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text("Task", style: TextStyle(fontWeight: FontWeight.bold)),
        content: TextField(
          controller: controller,
          decoration: InputDecoration(hintText: "Enter task details"),
        ),
        actions: [
          ElevatedButton(
            onPressed: () {
              String title = controller.text;
              todoProvider.addTask(Todo(title: title));
              controller.clear();
              Navigator.pop(context);
            },
            child: Text("Add"),
          ),
        ],
      );
    },
  );
}

import 'package:dynamicapp/utils/size_config.dart';
import 'package:flutter/material.dart';

class TodoApp extends StatefulWidget {
  const TodoApp({super.key});

  @override
  TodoAppState createState() => TodoAppState();
}

class TodoAppState extends State<TodoApp> {
  List<String> todos = [];
  TextEditingController todoController = TextEditingController();

  void addTodo() {
    setState(() {
      String newTodo = todoController.text.trim();
      if (newTodo.isNotEmpty) {
        todos.add(newTodo);
        todoController.clear();
      }
    });
  }

  void removeTodo(int index) {
    setState(() {
      todos.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Todo App')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: todoController,
              style: const TextStyle(color: kWhite),
              decoration: const InputDecoration(
                  hintStyle: TextStyle(color: kWhite),
                  border: OutlineInputBorder(),
                  labelText: 'New Todo'),
            ),
          ),
          h16,
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            alignment: Alignment.bottomRight,
            child: FilledButton.icon(
              style: FilledButton.styleFrom(
                  shape: shape8, minimumSize: const Size(double.infinity, 50)),
              onPressed: addTodo,
              icon: const Icon(Icons.add),
              label: const Text('Add Todo'),
            ),
          ),
          const SizedBox(height: 16.0),
          Expanded(
            child: ListView.builder(
              itemCount: todos.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    leading: CircleAvatar(child: Text('${index + 1}')),
                    title: Text(
                      todos[index],
                      style: const TextStyle(color: kWhite),
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () => removeTodo(index),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

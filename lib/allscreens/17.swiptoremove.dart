import 'package:flutter/material.dart';

class SwipeToDeleteArchiveDemo extends StatefulWidget {
  const SwipeToDeleteArchiveDemo({super.key});

  @override
  SwipeToDeleteArchiveDemoState createState() =>
      SwipeToDeleteArchiveDemoState();
}

class SwipeToDeleteArchiveDemoState extends State<SwipeToDeleteArchiveDemo> {
  List<String> items = List.generate(30, (index) => "Item ${index + 1}");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Swipe to Delete & Archive'),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return Card(
            child: Dismissible(
              key: Key(item),
              direction: DismissDirection.horizontal,
              onDismissed: (direction) {
                setState(() {
                  items.removeAt(index);
                });
                if (direction == DismissDirection.startToEnd) {
                  // Archive item
                  _showSnackBar(context, 'Archived $item');
                } else if (direction == DismissDirection.endToStart) {
                  // Delete item
                  _showSnackBar(context, 'Deleted $item');
                }
              },
              background: Container(
                color: Colors.green,
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: const Icon(
                  Icons.archive,
                  color: Colors.white,
                ),
              ),
              secondaryBackground: Container(
                color: Colors.red,
                alignment: Alignment.centerRight,
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: const Icon(
                  Icons.delete,
                  color: Colors.white,
                ),
              ),
              child: ListTile(
                leading: CircleAvatar(child: Text('${index + 1}')),
                title: Text(item),
                subtitle: Text(item),
              ),
            ),
          );
        },
      ),
    );
  }

  void _showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 0.0),
          behavior: SnackBarBehavior.floating,
          content: Text(message)),
    );
  }
}

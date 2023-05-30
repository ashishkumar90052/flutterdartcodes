import 'package:flutter/material.dart';

class CustomSearchBar extends StatefulWidget {
  const CustomSearchBar({super.key});

  @override
  CustomSearchBarState createState() => CustomSearchBarState();
}

class CustomSearchBarState extends State<CustomSearchBar> {
  List<String> items = [
    'John Doe',
    'Jane Smith',
    'Robert Johnson',
    'Alice Brown',
    'David Lee',
    'Lily Mitchell',
    "Benjamin Turner",
    "Alexander Hall",
    "Charlotte Adams",
    "Joseph Wilson",
    "James Rodriguez"
  ];

  List<String> filteredItems = [];

  void filterSearchResults(String query) {
    filteredItems.clear();
    if (query.isNotEmpty) {
      for (var item in items) {
        if (item.toLowerCase().contains(query.toLowerCase())) {
          filteredItems.add(item);
        }
      }
    } else {
      filteredItems.addAll(items);
    }
    setState(() {});
  }

  @override
  void initState() {
    filteredItems.addAll(items);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Custom Search Bar'),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              onChanged: (value) {
                filterSearchResults(value);
              },
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Search',
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredItems.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  child: ListTile(
                    title: Text(filteredItems[index]),
                    subtitle: const Text(
                        'Subname'), // Replace with your desired subname
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

void main() {
  runApp(MaterialApp(
    home: CustomSearchBar(),
  ));
}

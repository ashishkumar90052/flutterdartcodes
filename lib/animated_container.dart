import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey();
  List<String> _data = ['Item 1', 'Item 2', 'Item 3'];

  void _addItem() {
    setState(() {
      _data.insert(0, 'Item ${_data.length + 1}');
      _listKey.currentState!.insertItem(0);
    });
  }

  void _removeItem(int index) {
    setState(() {
      _listKey.currentState!.removeItem(index, (context, animation) {
        return Container(
          height: animation.value,
          color: Colors.red,
        );
      });
      _data.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animated List'),
      ),
      body: AnimatedList(
        key: _listKey,
        initialItemCount: _data.length,
        itemBuilder: (context, index, animation) {
          return _buildItem(_data[index], animation);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addItem,
        child: Icon(Icons.add),
      ),
    );
  }

  Widget _buildItem(String item, animation) {
    return SizeTransition(
      sizeFactor: animation,
      child: Card(
        child: ListTile(
          title: Text(item),
          onTap: () => _removeItem(_data.indexOf(item)),
        ),
      ),
    );
  }
}

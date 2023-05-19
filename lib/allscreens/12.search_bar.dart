import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:dynamicapp/utils/const.dart';
import 'package:flutter/material.dart';

class SearchBars extends StatefulWidget {
  @override
  _SearchBarsState createState() => _SearchBarsState();
}

class _SearchBarsState extends State<SearchBars> {
  TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        elevation: 5,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: AnimSearchBar(
              width: 350,
              textController: textController,
              onSuffixTap: () {
                setState(() {
                  textController.clear();
                });
              },
              onSubmitted: (String) {},
            ),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: newMusicList.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: ListTile(
              leading: CircleAvatar(child: Text('${index + 1}')),
              title: Text(newMusicList[index]['title']),
              subtitle: Text(newMusicList[index]['subtitle']),
            ),
          );
        },
      ),
    );
  }
}

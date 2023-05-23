import 'package:dynamicapp/utils/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class SliverListGridExample extends StatefulWidget {
  const SliverListGridExample({Key? key}) : super(key: key);

  @override
  SliverListGridExampleState createState() => SliverListGridExampleState();
}

class SliverListGridExampleState extends State<SliverListGridExample> {
  bool isGrid = false;
  List<String> items =
      List.generate(newMusicList.length, (index) => 'Item ${index + 1}');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            flexibleSpace:
                const FlexibleSpaceBar(title: Text('Sliver List and Grid')),
            actions: [
              IconButton(
                tooltip: isGrid ? 'Grid' : 'List',
                onPressed: () {
                  setState(() {
                    isGrid = !isGrid;
                  });
                  debugPrint(isGrid.toString());
                },
                icon: Icon(
                  isGrid ? Icons.view_list_rounded : Icons.grid_on_rounded,
                ),
              ),
            ],
          ),
          if (isGrid)
            AnimationLimiter(
              child: SliverGrid(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10.0,
                  crossAxisSpacing: 10.0,
                ),
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    return AnimationConfiguration.staggeredGrid(
                      position: index,
                      duration: const Duration(milliseconds: 300),
                      columnCount: 2,
                      child: ScaleAnimation(
                        child: buildGridItem(index),
                      ),
                    );
                  },
                  childCount: items.length,
                ),
              ),
            ),
          if (!isGrid)
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return AnimationConfiguration.staggeredList(
                    position: index,
                    duration: const Duration(milliseconds: 300),
                    child: SlideAnimation(
                      verticalOffset: 50.0,
                      child: FadeInAnimation(
                        child: buildListItem(index),
                      ),
                    ),
                  );
                },
                childCount: items.length,
              ),
            ),
        ],
      ),
    );
  }

  Widget buildGridItem(int index) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          SizedBox(
            height: 150.0,
            width: double.infinity,
            child: Image.network(
              newMusicList[index]['img'],
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 8.0),
          Text(newMusicList[index]['title']),
          const SizedBox(height: 4.0),
          Text(newMusicList[index]['subtitle']),
        ],
      ),
    );
  }

  Widget buildListItem(int index) {
    return Card(
      child: ListTile(
        leading: Image.network(
          newMusicList[index]['img'],
          width: 60,
          fit: BoxFit.cover,
        ),
        title: Text(newMusicList[index]['title']),
        subtitle: Text(newMusicList[index]['subtitle']),
      ),
    );
  }
}

import 'package:dynamicapp/utils/const.dart';
import 'package:dynamicapp/utils/photo_view.dart';
import 'package:flutter/material.dart';

class BottomAppBarUI extends StatefulWidget {
  const BottomAppBarUI({super.key});

  @override
  State<BottomAppBarUI> createState() => _BottomAppBarUIState();
}

class _BottomAppBarUIState extends State<BottomAppBarUI> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(),
      appBar: AppBar(
        elevation: 5,
        title: const Text('Bottom app bar'),
      ),
      bottomNavigationBar: BottomAppBar(
        height: 120,
        child: Row(
          children: [
            IconButton(
                onPressed: () {}, icon: const Icon(Icons.search_rounded)),
            IconButton(
                onPressed: () {}, icon: const Icon(Icons.delete_rounded)),
            IconButton(
                onPressed: () {}, icon: const Icon(Icons.archive_rounded)),
            IconButton(onPressed: () {}, icon: const Icon(Icons.share)),
            const Spacer(),
            FloatingActionButton(
              onPressed: () {},
              child: const Icon(Icons.add),
            ),
          ],
        ),
      ),
      body: ListView.separated(
        itemCount: dataList.length,
        shrinkWrap: true,
        padding: const EdgeInsets.all(16),
        separatorBuilder: (context, index) {
          return const SizedBox(height: 8.0);
        },
        itemBuilder: (BuildContext context, int index) {
          return Card(
              child: InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      fullscreenDialog: true,
                      builder: (context) =>
                          ImgPreview(img: dataList[index]['img'])));
            },
            child: Column(
              children: [
                ListTile(
                  leading: CircleAvatar(
                      backgroundImage: NetworkImage(dataList[index]['img'])),
                  title: Text(dataList[index]['title']),
                  subtitle: Text(dataList[index]['time'] ?? ""),
                  trailing: Like(isLiked: isSelected),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(dataList[index]['post'] ?? ""),
                    ),
                    const SizedBox(height: 8.0),
                    Container(
                      height: 200,
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 8.0),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Image.network(
                            dataList[index]['img'],
                            fit: BoxFit.cover,
                          )),
                    ),
                  ],
                )
              ],
            ),
          ));
        },
      ),
    );
  }
}

// ignore: must_be_immutable
class Like extends StatefulWidget {
  bool isLiked;
  Like({super.key, required this.isLiked});

  @override
  State<Like> createState() => _LikeState();
}

class _LikeState extends State<Like> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.onSecondary,
          shape: BoxShape.circle),
      child: IconButton(
          onPressed: () {
            setState(() {
              if (widget.isLiked == true) widget.isLiked = false;
            });
          },
          icon: Icon(
            widget.isLiked == true ? Icons.favorite : Icons.favorite_border,
          )),
    );
  }
}

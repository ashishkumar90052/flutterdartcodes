import 'package:dynamicapp/utils/const.dart';
import 'package:flutter/material.dart';

class SpotifyUI extends StatefulWidget {
  const SpotifyUI({super.key});

  @override
  State<SpotifyUI> createState() => _SpotifyUIState();
}

class _SpotifyUIState extends State<SpotifyUI> {
  bool isLiked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: const ScrollPhysics(),
        slivers: <Widget>[
          SliverAppBar.large(
            floating: true,
            snap: true,
            expandedHeight: 260,
            title: const Text('Liked Songs'),
            flexibleSpace: FlexibleSpaceBar(
              stretchModes: const [StretchMode.fadeTitle],
              collapseMode: CollapseMode.parallax,
              title: const Text('Liked Songs'),
              background: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.indigo.withOpacity(.25),
                      Colors.indigo.withOpacity(.16),
                      Colors.indigo.withOpacity(.045),
                      Colors.black.withOpacity(.04),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: const [0, 0.5, 0.8, .9],
                  ),
                ),
              ),
            ),
          ),

          // background: Image.network(
          //     'https://i.scdn.co/image/ab67616d0000b27336fb92e4fd4da9df2afaa2d2')),
          // ),
          const SliverToBoxAdapter(child: SizedBox(height: 16.0)),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return ListTile(
                  leading: Image.network(
                    musicList[index]['img'],
                    width: 70,
                  ),
                  title: Text(
                    musicList[index]['title'],
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                  subtitle: const Text('Smile'),
                  trailing: Wrap(
                    children: [
                      LikeButton(isLiked: isLiked),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.more_vert_rounded))
                    ],
                  ),
                );
              },
              childCount: musicList.length,
            ),
          ),
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class LikeButton extends StatefulWidget {
  bool isLiked;
  LikeButton({super.key, required this.isLiked});

  @override
  State<LikeButton> createState() => _LikeButtonState();
}

class _LikeButtonState extends State<LikeButton> {
  @override
  Widget build(BuildContext context) {
    const addedMsg = 'Added to Your Library.';
    const removedMsg = 'Removed from Your Library.';
    const added = SnackBar(
      content: Text(addedMsg),
      margin: EdgeInsets.all(20),
      behavior: SnackBarBehavior.floating,
    );
    const removed = SnackBar(
      content: Text(removedMsg),
      margin: EdgeInsets.all(20),
      behavior: SnackBarBehavior.floating,
    );

    return IconButton(
        onPressed: () {
          setState(() {
            widget.isLiked = !widget.isLiked;
            widget.isLiked == true
                ? ScaffoldMessenger.of(context).showSnackBar(added)
                : ScaffoldMessenger.of(context).showSnackBar(removed);
          });
        },
        icon: Icon(
          widget.isLiked == true
              ? Icons.favorite_rounded
              : Icons.favorite_border_outlined,
          color: widget.isLiked == true ? Colors.green : null,
        ));
  }
}

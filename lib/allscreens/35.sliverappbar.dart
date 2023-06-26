import 'package:flutter/material.dart';

class FancyAppBar extends StatelessWidget {
  const FancyAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(
        child: SafeArea(
          child: ListTile(title: Text('Fancy SliverAppBar')),
        ),
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
              actions: [
                IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.account_circle_rounded, size: 32))
              ],
              expandedHeight: 240,
              stretchTriggerOffset: 200,
              backgroundColor: Colors.indigo.shade700,
              stretch: true,
              flexibleSpace:
                  const FlexibleSpaceBar(title: Text('Fancy SliverAppBar')),
              floating: false,
              pinned: true),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Container(
                  margin: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
                  height: 128,
                  child: const Card(),
                );
              },
              childCount:
                  20, // Replace with the actual number of items in the list
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:dynamicapp/allscreens/13.gridvslist.dart';
import 'package:dynamicapp/allscreens/29.parallax.dart';
import 'package:dynamicapp/allscreens/4.profile.dart';
import 'package:dynamicapp/allscreens/7.music.dart';
import 'package:flutter/material.dart';
import 'package:motion_tab_bar_v2/motion-tab-bar.dart';

import '../settingsUI/settings.dart';

class MyHomePagee extends StatefulWidget {
  const MyHomePagee({Key? key}) : super(key: key);

  @override
  MyHomePageeState createState() => MyHomePageeState();
}

class MyHomePageeState extends State<MyHomePagee>
    with TickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      initialIndex: 0,
      length: 3,
      vsync: this,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _tabController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(''),
      // ),
      bottomNavigationBar: MotionTabBar(
        initialSelectedTab: "Dashboard",
        useSafeArea: true,
        labels: const ["Dashboard", "Profile", "Settings"],
        icons: const [Icons.dashboard, Icons.people_alt, Icons.settings],

        tabSize: 50,
        tabBarHeight: 55,
        textStyle: const TextStyle(
            fontSize: 12, color: Colors.black, fontWeight: FontWeight.w500),
        tabIconColor: Colors.deepPurple.withOpacity(.9),
        tabIconSize: 28.0,
        tabIconSelectedSize: 26.0,
        tabSelectedColor: Colors.deepPurple,
        // tabIconSelectedColor: Colors.white,
        // tabBarColor: Colors.white,
        onTabItemSelected: (int value) {
          setState(() {
            _tabController!.index = value;
          });
        },
      ),
      body: TabBarView(
        physics:
            const NeverScrollableScrollPhysics(), // swipe navigation handling is not supported
        controller: _tabController,
        // ignore: prefer_const_literals_to_create_immutables
        children: <Widget>[
          const SliverListGridExample(),
          const ProfileScreen(),
          const Settings()
        ],
      ),
    );
  }
}

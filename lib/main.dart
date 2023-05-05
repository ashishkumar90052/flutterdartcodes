// import 'package:dynamic_color/dynamic_color.dart';
// import 'package:dynamicapp/login/2.0%20login.dart';
// import 'package:dynamicapp/login/login.dart';
// import 'package:dynamicapp/models/cart.dart';
// import 'package:dynamicapp/models/catalog.dart';
// import 'package:dynamicapp/settingsUI/settings.dart';
// import 'package:dynamicapp/theme/apptheme.dart';
// import 'package:dynamicapp/ticket/ticket.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:provider/provider.dart';

// void main() {
//   SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
//     statusBarColor: Colors.transparent,
//   ));
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return DynamicColorBuilder(
//         builder: (ColorScheme? lightColorScheme, ColorScheme? darkColorScheme) {
//       return MultiProvider(
//           providers: [
//             Provider(create: (context) => CatalogModel()),
//             ChangeNotifierProxyProvider<CatalogModel, CartModel>(
//               create: (context) => CartModel(),
//               update: (context, catalog, cart) {
//                 if (cart == null) throw ArgumentError.notNull('cart');
//                 cart.catalog = catalog;
//                 return cart;
//               },
//             ),
//           ],
//           child: MaterialApp(
//               title: 'Flutter Demo',
//               debugShowCheckedModeBanner: false,
//               theme: ThemeData(useMaterial3: true),

//               // theme: AppTheme.lightTheme(lightColorScheme),
//               // darkTheme: AppTheme.darkTheme(darkColorScheme),
//               // routerConfig: router(),

//               home: const Settings()));
//     });
//   }
// }

// Copyright 2013 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:dynamicapp/animation/fade_scale_transition.dart';
import 'package:dynamicapp/animation/shared_axis_transition.dart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'allscreens/1.tab_bar.dart';
import 'animation/container_transition.dart';
import 'animation/fade_through_transition.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      theme: ThemeData.dark(
        useMaterial3: true,

        // colorSchemeSeed: Colors.deepOrange,
        // colorScheme: const ColorScheme.dark(),
      ).copyWith(
        useMaterial3: true,
        pageTransitionsTheme: const PageTransitionsTheme(
          builders: <TargetPlatform, PageTransitionsBuilder>{
            TargetPlatform.android: ZoomPageTransitionsBuilder(),
          },
        ),
      ),
      home: const Tabbar(),
    ),
  );
}

class TransitionsHomePage extends StatefulWidget {
  const TransitionsHomePage({super.key});

  @override
  TransitionsHomePageState createState() => TransitionsHomePageState();
}

class TransitionsHomePageState extends State<TransitionsHomePage> {
  bool _slowAnimations = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Material Transitions')),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView(
              children: <Widget>[
                _TransitionListTile(
                  title: 'Container transform',
                  subtitle: 'OpenContainer',
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) {
                          return const OpenContainerTransformDemo();
                        },
                      ),
                    );
                  },
                ),
                _TransitionListTile(
                  title: 'Shared axis',
                  subtitle: 'SharedAxisTransition',
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) {
                          return const SharedAxisTransitionDemo();
                        },
                      ),
                    );
                  },
                ),
                _TransitionListTile(
                  title: 'Fade through',
                  subtitle: 'FadeThroughTransition',
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) {
                          return const FadeThroughTransitionDemo();
                        },
                      ),
                    );
                  },
                ),
                _TransitionListTile(
                  title: 'Fade',
                  subtitle: 'FadeScaleTransition',
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) {
                          return const FadeScaleTransitionDemo();
                        },
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          const Divider(height: 0.0),
          SafeArea(
            child: SwitchListTile(
              value: _slowAnimations,
              onChanged: (bool value) async {
                setState(() {
                  _slowAnimations = value;
                });
                // Wait until the Switch is done animating before actually slowing
                // down time.
                if (_slowAnimations) {
                  await Future<void>.delayed(const Duration(milliseconds: 300));
                }
                timeDilation = _slowAnimations ? 20.0 : 1.0;
              },
              title: const Text('Slow animations'),
            ),
          ),
        ],
      ),
    );
  }
}

class _TransitionListTile extends StatelessWidget {
  const _TransitionListTile({
    this.onTap,
    required this.title,
    required this.subtitle,
  });

  final GestureTapCallback? onTap;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 15.0,
      ),
      leading: Container(
        width: 40.0,
        height: 40.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          border: Border.all(
            color: Colors.black54,
          ),
        ),
        child: const Icon(
          Icons.play_arrow,
          size: 35,
        ),
      ),
      onTap: onTap,
      title: Text(title),
      subtitle: Text(subtitle),
    );
  }
}

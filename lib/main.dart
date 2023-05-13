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

import 'package:dynamicapp/allscreens/4.profile.dart';
import 'package:dynamicapp/allscreens/5.bottom_app_bar.dart';
import 'package:dynamicapp/allscreens/6.razor_pay.dart';
import 'package:dynamicapp/allscreens/7.music.dart';
import 'package:dynamicapp/animation/fade_scale_transition.dart';
import 'package:dynamicapp/animation/shared_axis_transition.dart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'allscreens/2.spotify_ui.dart';
import 'allscreens/todo.dart';
import 'animation/container_transition.dart';
import 'animation/fade_through_transition.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      darkTheme: ThemeData.dark(
        useMaterial3: true,
      ),
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.white,
        // colorScheme: const ColorScheme.dark(),
      ).copyWith(
        pageTransitionsTheme: const PageTransitionsTheme(
          builders: <TargetPlatform, PageTransitionsBuilder>{
            TargetPlatform.android: ZoomPageTransitionsBuilder(),
          },
        ),
      ),
      home: Music(),
    ),
  );
}

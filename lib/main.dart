import 'package:dynamicapp/allscreens/23.share_plus.dart';
import 'package:dynamicapp/allscreens/25.list_img_color.dart';
import 'package:flutter/material.dart';

import 'allscreens/24.animated_theme_switcher.dart';

void main() {
  runApp(
    MaterialApp(
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.dark,
        theme: ThemeData(
          useMaterial3: true,
          brightness: Brightness.light,
        ),
        darkTheme: ThemeData(
          useMaterial3: true,
          brightness: Brightness.dark,
        ),
        // darkTheme: ThemeData.dark(useMaterial3: true),
        // theme: ThemeData.dark(
        //   useMaterial3: true,
        //   // colorScheme: const ColorScheme.dark(),
        // )
        // .copyWith(
        //   pageTransitionsTheme: const PageTransitionsTheme(
        //     builders: <TargetPlatform, PageTransitionsBuilder>{
        //       TargetPlatform.android: ZoomPageTransitionsBuilder(),
        //     },
        // ),
        // ),
        home: const CardImgColor()),
  );
}

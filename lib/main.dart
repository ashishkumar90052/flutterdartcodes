import 'package:dynamicapp/allscreens/11.%20neu.dart';
import 'package:dynamicapp/ui_compare/1.gropup_option.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.light,
        darkTheme: ThemeData(useMaterial3: true),
        theme: ThemeData(
          useMaterial3: true,
          // colorScheme: const ColorScheme.dark(),
        ).copyWith(
          pageTransitionsTheme: const PageTransitionsTheme(
            builders: <TargetPlatform, PageTransitionsBuilder>{
              TargetPlatform.android: ZoomPageTransitionsBuilder(),
            },
          ),
        ),
        home: const GroupOptions()),
  );
}

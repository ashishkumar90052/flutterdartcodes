import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'allscreens/1.tab_bar.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(GetMaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      theme: ThemeData(
        colorSchemeSeed: Colors.indigo,

        useMaterial3: true,
        brightness: Brightness.light,

        // textTheme: GoogleFonts.notoSansTextTheme(),
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        // textTheme: GoogleFonts.notoSansTextTheme(),
        brightness: Brightness.dark,
        colorSchemeSeed: Colors.indigo,
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
      home: const Tabbar()));
}

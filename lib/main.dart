import 'package:dynamicapp/allscreens/28.crypto.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
        // textTheme: GoogleFonts.notoSansTextTheme(),
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        // textTheme: GoogleFonts.notoSansTextTheme(),
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
      home: const Crypto()));
}

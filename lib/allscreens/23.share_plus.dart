import 'package:dynamicapp/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class SharePlus extends StatelessWidget {
  const SharePlus({super.key});

  @override
  Widget build(BuildContext context) {
    return const MyHomePage();
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  void _shareText(String text) {
    Share.share(
      text,
      subject:
          'A Flutter plugin to share content from your Flutter app via the platform\'s share dialog.Wraps the ACTION_SEND Intent on Android and UIActivityViewController on iOS.',
      sharePositionOrigin: const Rect.fromLTWH(
          0, 0, 100, 100), // optional rect for iPad popover position
    );
  }

  @override
  Widget build(BuildContext context) {
    var txt =
        "A Flutter plugin to share content from your Flutter app via the platform's share dialog.Wraps the ACTION_SEND Intent on Android and UIActivityViewController on iOS.";
    return Scaffold(
      appBar: AppBar(title: const Text('Share Plus')),
      bottomNavigationBar: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          height: 48,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                foregroundColor: kWhite,
                shape: shape8,
                backgroundColor: Theme.of(context).primaryColor),
            onPressed: () {
              _shareText(txt);
            },
            child: const Text('Share'),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              txt,
              style: textStyleHeading,
            ),
            h16,
            Text(
              "Platform Support #Android	iOS	MacOS	Web	Linux	Windows ✅	✅	✅	✅	✅	✅\nAlso compatible with Windows and Linux by using  files is not supported on Windows and Linux.",
              style: textStyleHeading,
            ),
          ],
        ),
      ),
    );
  }
}

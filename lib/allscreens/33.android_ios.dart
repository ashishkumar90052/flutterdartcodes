import 'package:dynamicapp/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class AndroidvsIos extends StatelessWidget {
  const AndroidvsIos({super.key});

  @override
  Widget build(BuildContext context) {
    return const MyHomePage();
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  void openAndroidDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Alert Dialog Title'),
          content: const Text('This is a demo alert dialog.'),
          actions: [
            TextButton(
                child: const Text('Cancel'),
                onPressed: () => Navigator.of(context).pop()),
            TextButton(
                child: const Text('OK'),
                onPressed: () => Navigator.of(context).pop()),
          ],
        );
      },
    );
  }

  void openiOSDialog(BuildContext context) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: const Text('Alert'),
        content: const Text('Proceed with destructive action?'),
        actions: <CupertinoDialogAction>[
          CupertinoDialogAction(
            /// This parameter indicates this action is the default,
            /// and turns the action's text to bold text.
            isDefaultAction: true,
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('No'),
          ),
          CupertinoDialogAction(
            /// This parameter indicates the action would perform
            /// a destructive action such as deletion, and turns
            /// the action's text color to red.
            isDestructiveAction: true,
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Yes'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Dialog'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton(
                style: FilledButton.styleFrom(
                    shape: shape8, minimumSize: const Size(150, 50)),
                child: const Text('Android Dialog'),
                onPressed: () => openAndroidDialog(context)),
            h16,
            FilledButton(
                style: FilledButton.styleFrom(
                    shape: shape8, minimumSize: const Size(150, 50)),
                child: const Text('iOS Dialog'),
                onPressed: () => openiOSDialog(context)),
          ],
        ),
      ),
    );
  }
}

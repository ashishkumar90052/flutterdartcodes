import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SwitchM3 extends StatefulWidget {
  const SwitchM3({super.key});

  @override
  State<SwitchM3> createState() => _SwitchM3State();
}

class _SwitchM3State extends State<SwitchM3> {
  bool _android = false;
  bool _iOS = false;
  bool _adaptive = false;
  bool _custom = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {}, icon: const Icon(Icons.arrow_back_ios)),
        title: const Text('Switch'),
      ),
      body: Column(
        children: [
          SwitchListTile(
            title: const Text('Android Switch'),
            value: _android,
            onChanged: (bool value) {
              setState(() {
                _android = value;
              });
            },
          ),
          const Divider(),
          ListTile(
              title: const Text('Cupertino Switch'),
              trailing: CupertinoSwitch(
                value: _iOS,
                onChanged: (bool value) {
                  setState(() {
                    _iOS = value;
                  });
                },
              )),
          const Divider(),
          SwitchListTile.adaptive(
            title: const Text('Adaptive Switch'),
            value: _adaptive,
            onChanged: (bool value) {
              setState(() {
                _adaptive = value;
              });
            },
          ),
          const Divider(),
          ListTile(
              title: const Text('Custom Switch'),
              trailing: Switch(
                  value: _custom,
                  onChanged: (bool value) {
                    setState(() {
                      _custom = value;
                    });
                  },
                  thumbColor: MaterialStateProperty.all(
                      _custom == false ? Colors.amber : Colors.black),
                  thumbIcon: MaterialStateProperty.all(Icon(
                      _custom == false ? Icons.sunny : Icons.wb_sunny_rounded,
                      color: _custom == false ? Colors.white : Colors.white)))),
        ],
      ),
    );
  }
}

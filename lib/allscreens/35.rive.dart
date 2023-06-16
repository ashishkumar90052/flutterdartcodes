import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class RiveAninmations extends StatefulWidget {
  const RiveAninmations({super.key});

  @override
  State<RiveAninmations> createState() => _RiveAninmationsState();
}

class _RiveAninmationsState extends State<RiveAninmations> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RiveAnimation.network(
        'https://cdn.rive.app/animations/vehicles.riv',
      ),
    );
  }
}

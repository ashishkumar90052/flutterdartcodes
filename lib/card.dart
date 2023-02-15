import 'package:flutter/material.dart';

class AppUi extends StatelessWidget {
  const AppUi({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          body: Column(
            children: <Widget>[
              Container(height: constraints.maxHeight * 0.1),
              ElevatedButton(
                child: const Text('Button 1'),
                onPressed: () {},
              ),
              Container(height: constraints.maxHeight * 0.05),
              ElevatedButton(
                child: const Text('Button 2'),
                onPressed: () {
                  // Add your button 2 action here
                },
              ),
            ],
          ),
        );
      },
    );
  }
}

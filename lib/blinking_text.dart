import 'package:blinking_text/blinking_text.dart';
import 'package:flutter/material.dart';

class BlinkTextz extends StatelessWidget {
  const BlinkTextz({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: 
      
      Center(
        child: BlinkText(
          'Hello there!!',
          style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
          beginColor: Colors.grey.shade300,
          endColor: Colors.green,
          times: 10,
          duration: const Duration(seconds: 1),
        ),
      ),
    );


    
  }
}

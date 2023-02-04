import 'package:flutter/material.dart';

class HomeDetails extends StatefulWidget {
  final String name;
  final String userName;
  final String city;

  const HomeDetails(
      {super.key,
      required this.name,
      required this.userName,
      required this.city});

  @override
  State<HomeDetails> createState() => _HomeDetailsState();
}

class _HomeDetailsState extends State<HomeDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('User details')),
      body: SizedBox(
        width: double.infinity,
        child: Card(
            margin: const EdgeInsets.all(16),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(widget.name,
                      style: Theme.of(context).textTheme.headlineSmall),
                  const SizedBox(height: 16.0),
                  Text(widget.userName),
                  const SizedBox(height: 8.0),
                  Text(widget.city),
                ],
              ),
            )),
      ),
    );
  }
}

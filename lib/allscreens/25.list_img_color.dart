import 'package:dynamicapp/utils/const.dart';
import 'package:flutter/material.dart';

class CardImgColor extends StatefulWidget {
  const CardImgColor({super.key});

  @override
  State<CardImgColor> createState() => _CardImgColorState();
}

class _CardImgColorState extends State<CardImgColor> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: musicList.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            color: Theme.of(context).colorScheme.errorContainer,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(musicList[index]['img'])),
            ),
          );
        },
      ),
    );
  }
}

import 'dart:ui';

import 'package:dynamicapp/utils/const.dart';
import 'package:flutter/material.dart';

class MyImgBack extends StatefulWidget {
  const MyImgBack({Key? key}) : super(key: key);

  @override
  MyImgBackState createState() => MyImgBackState();
}

class MyImgBackState extends State<MyImgBack> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 500),
            child: Image.network(
              images[selectedIndex],
              key: ValueKey(selectedIndex),
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
            transitionBuilder: (Widget child, Animation<double> animation) {
              return FadeTransition(
                opacity: animation,
                child: child,
              );
            },
          ),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
              child: Container(
                color: Colors.black.withOpacity(0.3),
              ),
            ),
          ),
          Center(
            child: SizedBox(
              height: 450,
              child: PageView.builder(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                itemCount: images.length,
                onPageChanged: (int index) {
                  setState(() {
                    selectedIndex = index;
                  });
                },
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    margin: const EdgeInsets.all(50.0),
                    child: Card(
                      clipBehavior: Clip.antiAlias,
                      child: Image.network(images[index], fit: BoxFit.cover),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

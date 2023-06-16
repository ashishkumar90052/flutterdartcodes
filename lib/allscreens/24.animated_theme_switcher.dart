// import 'package:flutter/material.dart';

// class MyThemeSwitcher extends StatefulWidget {
//   const MyThemeSwitcher({Key? key}) : super(key: key);

//   @override
//   MyThemeSwitcherState createState() => MyThemeSwitcherState();
// }

// class MyThemeSwitcherState extends State<MyThemeSwitcher>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _animationController;
//   late Animation<double> _animation;

//   bool _isDarkMode = false;

//   @override
//   void initState() {
//     super.initState();

//     _animationController = AnimationController(
//       vsync: this,
//       duration: const Duration(milliseconds: 500),
//     );

//     _animation = Tween<double>(begin: 0, end: 1).animate(
//       CurvedAnimation(
//         parent: _animationController,
//         curve: Curves.easeInOut,
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     _animationController.dispose();
//     super.dispose();
//   }

//   void _toggleDarkMode() {
//     setState(() {
//       _isDarkMode = !_isDarkMode;
//     });

//     if (_isDarkMode) {
//       _animationController.forward();
//     } else {
//       _animationController.reverse();
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         actions: [
//           ElevatedButton(
//             onPressed: _toggleDarkMode,
//             style: ElevatedButton.styleFrom(
//               backgroundColor: _isDarkMode ? Colors.white : Colors.black,
//             ),
//             child: Text(
//               _isDarkMode ? 'Switch to Light Mode' : 'Switch to Dark Mode',
//               style:
//                   TextStyle(color: _isDarkMode ? Colors.black : Colors.white),
//             ),
//           ),
//         ],
//         title: const Text('Dark/Light Mode Switcher'),
//         backgroundColor: _isDarkMode ? Colors.black : Colors.transparent,
//       ),
//       body: AnimatedBuilder(
//         animation: _animationController,
//         builder: (BuildContext context, Widget? child) {
//           return Container(
//             color: _isDarkMode ? Colors.black : Colors.white,
//             child: Center(
//               child: ClipOval(
//                 clipper: CircularRevealClipper(_animation.value),
//                 child: Container(
//                   width: MediaQuery.of(context).size.width * 2,
//                   height: MediaQuery.of(context).size.height * 2,
//                   color: _isDarkMode ? Colors.blue : Colors.yellow,
//                   child: Center(
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Icon(
//                           Icons.lightbulb,
//                           size: 100,
//                           color: _isDarkMode ? Colors.black : Colors.white,
//                         ),
//                         const SizedBox(height: 20),
//                         Text(
//                           _isDarkMode ? 'Dark Mode' : 'Light Mode',
//                           style: TextStyle(
//                             fontSize: 24,
//                             color: _isDarkMode ? Colors.white : Colors.black,
//                           ),
//                         ),
//                         const SizedBox(height: 20),
//                         ElevatedButton(
//                           onPressed: _toggleDarkMode,
//                           style: ElevatedButton.styleFrom(
//                             backgroundColor:
//                                 _isDarkMode ? Colors.white : Colors.black,
//                           ),
//                           child: Text(
//                             _isDarkMode
//                                 ? 'Switch to Light Mode'
//                                 : 'Switch to Dark Mode',
//                             style: TextStyle(
//                                 color:
//                                     _isDarkMode ? Colors.black : Colors.white),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

// class CircularRevealClipper extends CustomClipper<Rect> {
//   final double progress;

//   CircularRevealClipper(this.progress);

//   @override
//   Rect getClip(Size size) {
//     final center = Offset(size.width / 2, size.height / 2);
//     final radius = size.width / 2 * progress;
//     final topLeft = center - Offset(radius, radius);
//     final bottomRight = center + Offset(radius, radius);
//     return Rect.fromLTRB(
//         topLeft.dx, topLeft.dy, bottomRight.dx, bottomRight.dy);
//   }

//   @override
//   bool shouldReclip(CustomClipper<Rect> oldClipper) {
//     return true;
//   }
// }

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AnimatedThemeSwitcherApp extends StatefulWidget {
  const AnimatedThemeSwitcherApp({super.key});

  @override
  AnimatedThemeSwitcherAppState createState() =>
      AnimatedThemeSwitcherAppState();
}

class AnimatedThemeSwitcherAppState extends State<AnimatedThemeSwitcherApp> {
  bool _isDarkMode = false;

  void toggleTheme() {
    setState(() {
      _isDarkMode = !_isDarkMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Animated Theme Switcher',
      theme: _isDarkMode
          ? ThemeData.dark(useMaterial3: true)
          : ThemeData.light(useMaterial3: true),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Animated Theme Switcher'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 500),
                transitionBuilder: (Widget child, Animation<double> animation) {
                  return ScaleTransition(
                    scale: animation,
                    child: child,
                  );
                },
                child: _isDarkMode
                    ? Icon(
                        Icons.nightlight_round,
                        key: UniqueKey(),
                        size: 100,
                        color: Colors.amber,
                      )
                    : Icon(
                        Icons.wb_sunny,
                        key: UniqueKey(),
                        size: 100,
                        color: Colors.orange,
                      ),
              ),
              const SizedBox(height: 20),
              CupertinoSwitch(
                value: _isDarkMode,
                onChanged: (value) {
                  toggleTheme();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

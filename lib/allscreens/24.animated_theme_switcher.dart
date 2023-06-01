import 'package:flutter/material.dart';

class MyThemeSwitcher extends StatefulWidget {
  const MyThemeSwitcher({Key? key}) : super(key: key);

  @override
  MyThemeSwitcherState createState() => MyThemeSwitcherState();
}

class MyThemeSwitcherState extends State<MyThemeSwitcher>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  bool _isDarkMode = false;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    _animation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _toggleDarkMode() {
    setState(() {
      _isDarkMode = !_isDarkMode;
    });

    if (_isDarkMode) {
      _animationController.forward();
    } else {
      _animationController.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          ElevatedButton(
            onPressed: _toggleDarkMode,
            child: Text(
              _isDarkMode ? 'Switch to Light Mode' : 'Switch to Dark Mode',
              style:
                  TextStyle(color: _isDarkMode ? Colors.black : Colors.white),
            ),
            style: ElevatedButton.styleFrom(
              primary: _isDarkMode ? Colors.white : Colors.black,
            ),
          ),
        ],
        title: Text('Dark/Light Mode Switcher'),
        backgroundColor: _isDarkMode ? Colors.black : Colors.blue,
      ),
      body: AnimatedBuilder(
        animation: _animationController,
        builder: (BuildContext context, Widget? child) {
          return Container(
            color: _isDarkMode ? Colors.black : Colors.white,
            child: Center(
              child: ClipOval(
                clipper: CircularRevealClipper(_animation.value),
                child: Container(
                  width: MediaQuery.of(context).size.width * 2,
                  height: MediaQuery.of(context).size.height * 2,
                  color: _isDarkMode ? Colors.blue : Colors.yellow,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.lightbulb,
                          size: 100,
                          color: _isDarkMode ? Colors.black : Colors.white,
                        ),
                        SizedBox(height: 20),
                        Text(
                          _isDarkMode ? 'Dark Mode' : 'Light Mode',
                          style: TextStyle(
                            fontSize: 24,
                            color: _isDarkMode ? Colors.white : Colors.black,
                          ),
                        ),
                        SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: _toggleDarkMode,
                          child: Text(
                            _isDarkMode
                                ? 'Switch to Light Mode'
                                : 'Switch to Dark Mode',
                            style: TextStyle(
                                color:
                                    _isDarkMode ? Colors.black : Colors.white),
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: _isDarkMode ? Colors.white : Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class CircularRevealClipper extends CustomClipper<Rect> {
  final double progress;

  CircularRevealClipper(this.progress);

  @override
  Rect getClip(Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2 * progress;
    final topLeft = center - Offset(radius, radius);
    final bottomRight = center + Offset(radius, radius);
    return Rect.fromLTRB(
        topLeft.dx, topLeft.dy, bottomRight.dx, bottomRight.dy);
  }

  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) {
    return true;
  }
}

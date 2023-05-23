import 'package:flutter/material.dart';

class RadialMenu extends StatefulWidget {
  const RadialMenu({super.key});

  @override
  State<RadialMenu> createState() => _RadialMenuState();
}

class _RadialMenuState extends State<RadialMenu>
    with SingleTickerProviderStateMixin {
  AnimationController? _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    super.initState();
  }

  @override
  void dispose() {
    _animationController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Radial Menu'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Your central button or icon here
            IconButton(
              icon: const Icon(Icons.menu),
              onPressed: _toggleMenu,
            ),
            const SizedBox(height: 16.0),
            // Your surrounding buttons or options here
            AnimatedBuilder(
              animation: _animationController!,
              builder: (context, child) {
                return Transform.scale(
                  scale: _animationController!.value,
                  child: child,
                );
              },
              child: SizedBox(
                width: 200.0,
                height: 200.0,
                child: Stack(
                  children: [
                    // Place your options as positioned widgets around the central button
                    Positioned(
                      left: 100.0,
                      top: 0.0,
                      child: IconButton(
                        icon: const Icon(Icons.import_contacts_sharp),
                        onPressed: () {},
                      ),
                    ),
                    Positioned(
                      left: 0.0,
                      top: 100.0,
                      child: IconButton(
                        icon: const Icon(Icons.abc_outlined),
                        onPressed: () {},
                      ),
                    ),
                    Positioned(
                      right: 0.0,
                      top: 100.0,
                      child: IconButton(
                        icon: const Icon(Icons.dangerous),
                        onPressed: () {},
                      ),
                    ),
                    Positioned(
                      left: 100.0,
                      bottom: 0.0,
                      child: IconButton(
                        icon: const Icon(Icons.safety_check),
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _toggleMenu() {
    if (_animationController!.isCompleted) {
      _animationController!.reverse();
    } else {
      _animationController!.forward();
    }
  }
}

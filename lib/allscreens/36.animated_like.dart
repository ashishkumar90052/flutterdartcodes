import 'package:flutter/material.dart';

class LikeButton extends StatelessWidget {
  const LikeButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated Like Button'),
      ),
      body: const Center(
        child: AnimatedLikeButton(),
      ),
    );
  }
}

class AnimatedLikeButton extends StatefulWidget {
  const AnimatedLikeButton({Key? key}) : super(key: key);

  @override
  AnimatedLikeButtonState createState() => AnimatedLikeButtonState();
}

class AnimatedLikeButtonState extends State<AnimatedLikeButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  late Animation<double> _opacityAnimation;
  bool _isLiked = false;
  int _likeCount = 0;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.5).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );

    _opacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.3, 1.0),
      ),
    );

    _animationController.addListener(() {
      setState(() {});
    });

    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _animationController.reverse();
      }
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _toggleLike() {
    if (_isLiked) {
      setState(() {
        _likeCount--;
        _isLiked = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          margin: EdgeInsets.all(16),
          behavior: SnackBarBehavior.floating,
          content: Text('You Unliked'),
        ),
      );
    } else {
      setState(() {
        _likeCount++;
        _isLiked = true;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          margin: EdgeInsets.all(16),
          behavior: SnackBarBehavior.floating,
          content: Text('You Liked'),
        ),
      );
      _animationController.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    Color iconColor = _isLiked ? Colors.red : Colors.grey;

    return GestureDetector(
      onTap: _toggleLike,
      child: Stack(
        children: [
          Positioned.fill(
            child: AnimatedBuilder(
              animation: _animationController,
              builder: (context, child) {
                return Opacity(
                  opacity: _opacityAnimation.value,
                  child: const Icon(
                    Icons.favorite,
                    color: Colors.red,
                    size: 80.0,
                  ),
                );
              },
            ),
          ),
          Center(
            child: Transform.scale(
              scale: _scaleAnimation.value,
              child: Icon(
                _isLiked ? Icons.favorite : Icons.favorite_border,
                color: iconColor,
                size: 50.0,
              ),
            ),
          ),
          Positioned(
            bottom: 300,
            right: 200,
            child: Container(
              padding: const EdgeInsets.all(4.0),
              child: Text(
                _likeCount > 0 ? _likeCount.toString() : '0',
                style: const TextStyle(
                  fontSize: 35.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

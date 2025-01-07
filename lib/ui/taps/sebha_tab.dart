import 'package:flutter/material.dart';
import 'package:zekr/common/app_images.dart';

class SebhaTab extends StatefulWidget {
  const SebhaTab({super.key});

  @override
  _SebhaTabState createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab>
    with SingleTickerProviderStateMixin {
  int counter = 0;
  late AnimationController _controller;
  late Animation<double> _rotationAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

    _rotationAnimation =
        Tween<double>(begin: 0, end: -0.5).animate(_controller);
  }

  void _incrementCounter() {
    setState(() {
      counter++;
    });
    _controller.forward(from: 0);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Stack to overlay body and head images
          Stack(
            alignment: Alignment.center,
            children: [
              // Body Image with Rotation Animation
              AnimatedBuilder(
                animation: _rotationAnimation,
                builder: (context, child) {
                  return Transform.rotate(
                    angle: _rotationAnimation.value,
                    child: child,
                  );
                },
                child: Image.asset(AppImages.bodySebhaLogo), // Body image
              ),
              // Head Image on Top
              Positioned(
                top: -40, // Adjust this value to position the head correctly
                child: Image.asset(
                  AppImages.headSebhaLogo, // Replace with the head image
                  height: 60, // Adjust size as needed
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          // Counter with Stylish Box
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.brown[200],
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 8,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: Text(
              '$counter',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
            ),
          ),
          const SizedBox(height: 20),
          // Elevated Button with Custom Style
          ElevatedButton(
            onPressed: _incrementCounter,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.brown[400],
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            child: const Text(
              'تسبيح',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

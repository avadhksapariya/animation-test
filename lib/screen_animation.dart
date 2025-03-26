import 'package:flutter/material.dart';

class ScreenAnimation extends StatefulWidget {
  const ScreenAnimation({super.key});

  @override
  State<ScreenAnimation> createState() => _ScreenAnimationState();
}

class _ScreenAnimationState extends State<ScreenAnimation> with SingleTickerProviderStateMixin {
  late AnimationController ctrAnimation;
  late Animation<double> widthAnimation;
  late Animation<Color?> colorAnimation;
  late Animation<double> borderRadiusAnimation;

  @override
  void initState() {
    super.initState();
    ctrAnimation = AnimationController(vsync: this, duration: const Duration(seconds: 2));

    widthAnimation = Tween<double>(
      begin: 50,
      end: 200,
    ).animate(CurvedAnimation(parent: ctrAnimation, curve: Curves.easeInOut));

    colorAnimation = ColorTween(
      begin: Colors.purple.shade400,
      end: Colors.pink.shade400,
    ).animate(CurvedAnimation(parent: ctrAnimation, curve: Curves.easeInCubic));

    borderRadiusAnimation = Tween<double>(
      begin: 0.0,
      end: 50.0,
    ).animate(CurvedAnimation(parent: ctrAnimation, curve: Curves.easeInOut));

    ctrAnimation.forward();
  }

  @override
  void dispose() {
    ctrAnimation.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: AnimatedBuilder(
          animation: ctrAnimation,
          builder: (context, child) {
            return Center(
              child: Container(
                width: widthAnimation.value,
                height: widthAnimation.value,
                decoration: BoxDecoration(
                  color: colorAnimation.value,
                  borderRadius: BorderRadius.circular(borderRadiusAnimation.value),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

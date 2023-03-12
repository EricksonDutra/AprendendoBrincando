import 'package:flutter/material.dart';
import 'package:flutter_sequence_animation/flutter_sequence_animation.dart';

import 'home_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with TickerProviderStateMixin {
  late AnimationController _controller;
  late SequenceAnimation _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    );

    _animation = SequenceAnimationBuilder()
        .addAnimatable(
          animatable: Tween<double>(begin: 0.0, end: 1.0),
          from: const Duration(milliseconds: 0),
          to: const Duration(milliseconds: 1000),
          tag: 'opacity',
        )
        .addAnimatable(
          animatable: Tween<double>(begin: 0.0, end: 1.0),
          from: const Duration(milliseconds: 1000),
          to: const Duration(milliseconds: 2000),
          tag: 'scale',
        )
        .animate(_controller);
    _controller.forward().then((value) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (BuildContext context) => const HomePage(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'BEM VINDO(A)',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          ),
        ),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Container(
            color: Colors.amberAccent[500],
            child: Opacity(
              opacity: _animation['opacity'].value,
              child: Transform.scale(
                scale: _animation['scale'].value,
                child: Center(
                  child: Image.asset(
                    'images/val.jpg',
                    height: 250.0,
                    width: 250.0,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

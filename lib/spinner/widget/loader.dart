import 'dart:math';

import 'package:flutter/material.dart';
import 'package:indtubes_1/resources/asset_constants.dart';
import 'package:indtubes_1/resources/color_constants.dart';

class Loader extends StatefulWidget {
  const Loader({Key? key}) : super(key: key);

  @override
  State<Loader> createState() => _LoaderState();
}

class _LoaderState extends State<Loader> with SingleTickerProviderStateMixin {
  late final AnimationController _animationController =
      AnimationController(vsync: this, duration: const Duration(seconds: 2));

  // ignore: non_constant_identifier_names
  late final Animation<double> _animation_in;

  // ignore: non_constant_identifier_names
  late final Animation<double> _animation_out;

  // ignore: non_constant_identifier_names
  late final Animation<double> _animation_rotate;
  final double initialRadius = 30.0;
  double radius = 0.0;

  @override
  void initState() {
    _animation_in = Tween(begin: 1.0, end: 0.0).animate(CurvedAnimation(
        parent: _animationController, curve: const Interval(0.75, 1)));
    _animation_rotate = Tween(begin: 1.0, end: 0.0).animate(CurvedAnimation(
        parent: _animationController, curve: const Interval(0.0, 1)));
    _animation_out = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: _animationController, curve: const Interval(0.0, 0.25)));

    _animationController.addListener(() {
      if (_animationController.value >= 0 &&
          _animationController.value <= .25) {
        radius = initialRadius * _animation_out.value;
      } else if (_animationController.value >= 0.75 &&
          _animationController.value <= 1.0) {
        radius = initialRadius * _animation_in.value;
      }
    });
    _animationController.repeat();
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      width: 300,
      child: AnimatedBuilder(
        animation: _animationController,
        child:  const SizedBox(
          width: 50,
          height: 50,
          child:  Image(
            image:AssetImage(AssetConstants.icGifCoin)

          ),
        ),
        builder: (context, child) => RotationTransition(
          turns: _animation_rotate,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Transform.translate(
                  offset: Offset(radius * cos(pi / 2), radius * sin(pi / 2)),
                  child: child),
              Transform.translate(
                  offset: Offset(
                      radius * cos(2 * pi / 2), radius * sin(2 * pi / 2)),
                  child: child),
              Transform.translate(
                  offset: Offset(
                      radius * cos(3 * pi / 2), radius * sin(3 * pi / 2)),
                  child: child),
              Transform.translate(
                  offset: Offset(
                      radius * cos(4 * pi / 2), radius * sin(4 * pi / 2)),
                  child: child)
            ],
          ),
        ),
      ),
    );
  }
}

class Dot extends StatelessWidget {
  const Dot({Key? key, required this.color, required this.radius})
      : super(key: key);
  final double radius;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: radius,
        height: radius,
        decoration: BoxDecoration(shape: BoxShape.circle, color: color),
      ),
    );
  }
}

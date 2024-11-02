import 'package:dynamic_island_pet/widgets/animated_icon.dart';
import 'package:flutter/material.dart';

class DynamicIsland extends StatelessWidget {
  final Widget child;
  final Duration animationDuration;
  final double startOffset;
  final double endOffset;
  final bool reverse;

  const DynamicIsland({
    super.key,
    required this.child,
    this.animationDuration = const Duration(milliseconds: 1500),
    this.startOffset = -0.5,
    this.endOffset = 0.5,
    this.reverse = true,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 11,
      left: 0,
      right: 0,
      child: Center(
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Container(
              height: 36,
              width: 125,
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            AnimatedImage(
              duration: animationDuration,
              startOffset: startOffset,
              endOffset: endOffset,
              reverse: reverse,
              child: child,
            ),
          ],
        ),
      ),
    );
  }
}

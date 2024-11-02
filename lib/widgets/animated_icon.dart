import 'package:flutter/material.dart';

class AnimatedImage extends StatefulWidget {
  final Widget child;
  final Duration duration;
  final double startOffset;
  final double endOffset;
  final bool reverse;

  const AnimatedImage({
    super.key,
    required this.child,
    this.duration = const Duration(seconds: 2),
    this.startOffset = -1,
    this.endOffset = 1,
    this.reverse = true,
  });

  @override
  State<AnimatedImage> createState() => _AnimatedImageState();
}

class _AnimatedImageState extends State<AnimatedImage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: widget.duration,
      vsync: this,
    )..repeat(reverse: widget.reverse);
    _animation = Tween<double>(
      begin: widget.startOffset,
      end: widget.endOffset,
    ).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(_animation.value * 48, -12),
          child: widget.child,
        );
      },
    );
  }
}

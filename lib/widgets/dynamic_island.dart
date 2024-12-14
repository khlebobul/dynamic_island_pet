import 'package:dynamic_island_pet/services/device_info.dart';
import 'package:dynamic_island_pet/widgets/animated_icon.dart';
import 'package:flutter/material.dart';

class DynamicIsland extends StatelessWidget {
  final Widget child;
  final Duration animationDuration;
  final double startOffset;
  final double endOffset;
  final bool reverse;
  final double? topPadding;

  const DynamicIsland({
    super.key,
    required this.child,
    this.animationDuration = const Duration(milliseconds: 1500),
    this.startOffset = -0.5,
    this.endOffset = 0.5,
    this.reverse = true,
    this.topPadding,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<double>(
      future: _getTopPadding(),
      builder: (context, snapshot) {
        return Positioned(
          top: snapshot.data ?? 13,
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
      },
    );
  }

  Future<double> _getTopPadding() async {
    if (topPadding != null) return topPadding!;

    final deviceModel = await DeviceInfo.getDeviceModel();
    return switch (deviceModel) {
      // iPhone 14 ❌
      // iPhone 14 Plus ❌
      'iPhone15,2' => 13.0, // iPhone 14 Pro ✅
      'iPhone15,3' => 13.0, // iPhone 14 Pro Max ✅
      'iPhone15,4' => 13.0, // iPhone 15 ✅
      'iPhone15,5' => 13.0, // iPhone 15 Plus ✅
      'iPhone16,1' => 13.0, // iPhone 15 Pro ✅
      'iPhone16,2' => 13.0, // iPhone 15 Pro Max ✅
      'iPhone17,1' => 16.5, // iPhone 16 Pro ✅
      'iPhone17,2' => 16.0, // iPhone 16 Pro Max ✅
      'iPhone17,3' => 13.0, // iPhone 16 ✅
      'iPhone17,4' => 13.0, // iPhone 16 Plus ✅
      _ => 13.0,
    };
  }
}

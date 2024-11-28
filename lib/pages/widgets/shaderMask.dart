import 'package:flutter/material.dart';

import '../../core/colors.dart';

class Shadermask extends StatelessWidget {
  Widget? child;
  Shadermask({super.key, this.child});

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (Rect bounds) {
        return const LinearGradient(
          colors: [Colors.lightBlueAccent, AppColors.blue],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ).createShader(bounds);
      },
      blendMode: BlendMode.srcATop,
      child: child,
    );
  }
}

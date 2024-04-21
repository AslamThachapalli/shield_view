import 'package:flutter/material.dart';

import 'src/screen_blur_overlay.dart';
import 'src/visibility_controller.dart';

class ShieldView extends StatelessWidget {
  final Widget child;
  const ShieldView({
    required this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ScreenBlurOverlay(
      child: VisibilityController(child: child),
    );
  }
}

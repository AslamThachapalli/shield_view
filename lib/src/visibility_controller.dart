import 'package:flutter/material.dart';

import 'screen_blur_overlay.dart';

class VisibilityController extends StatefulWidget {
  final Widget child;

  const VisibilityController({
    required this.child,
    super.key,
  });

  @override
  State<VisibilityController> createState() => _VisibilityControllerState();
}

class _VisibilityControllerState extends State<VisibilityController>
    with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);

    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    if (state == AppLifecycleState.resumed) {
      ScreenBlurOverlay.of(context).disable();
    } else {
      ScreenBlurOverlay.of(context).enable();
    }
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}

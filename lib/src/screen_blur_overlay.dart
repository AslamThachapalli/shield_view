import 'dart:ui';

import 'package:flutter/material.dart';

abstract interface class ShieldController {
  bool get enabled;

  void enable();
  void disable();
}

class _InheritedShieldOverlay extends InheritedWidget {
  final ShieldController controller;

  const _InheritedShieldOverlay({
    required this.controller,
    required super.child,
  });

  @override
  bool updateShouldNotify(_InheritedShieldOverlay oldWidget) => false;
}

class ScreenBlurOverlay extends StatefulWidget {
  final Widget child;

  const ScreenBlurOverlay({
    required this.child,
    super.key,
  });

  static ShieldController of(BuildContext context) => context
      .getInheritedWidgetOfExactType<_InheritedShieldOverlay>()!
      .controller;

  @override
  State<ScreenBlurOverlay> createState() => _ScreenBlurOverlayState();
}

class _ScreenBlurOverlayState extends State<ScreenBlurOverlay>
    implements ShieldController {
  bool _enabled = false;

  @override
  void enable() {
    if (_enabled) {
      return;
    }

    setState(() {
      _enabled = true;
    });
  }

  @override
  void disable() {
    if (!_enabled) {
      return;
    }

    setState(() {
      _enabled = false;
    });
  }

  @override
  bool get enabled => _enabled;

  @override
  Widget build(BuildContext context) {
    return _InheritedShieldOverlay(
      controller: this,
      child: Stack(
        children: [
          widget.child,
          if (_enabled)
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
              child: const SizedBox(
                height: double.infinity,
                width: double.infinity,
              ),
            ),
        ],
      ),
    );
  }
}

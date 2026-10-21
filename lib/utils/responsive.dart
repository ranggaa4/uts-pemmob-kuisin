import 'dart:math' as math;

import 'package:flutter/material.dart';

extension ResponsiveContext on BuildContext {
  Size get _layar => MediaQuery.sizeOf(this);

  double get unit => math.min(_layar.shortestSide, 600.0);

  bool get isWide => _layar.width >= 700;

  double get lebarKonten => math.min(_layar.width, isWide ? 1000.0 : 600.0);
}

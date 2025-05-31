import 'package:flutter/material.dart';

/// A tab to display in a [CrystalNavigationBar]
class CrystalNavigationBarItem {
  /// An icon to display.
  final Widget child;

  /// An icon to display.
  final Widget? unselectedChild;

  ///badge
  final Badge? badge;

  /// A primary color to use for this tab.
  final Color? selectedColor;

  /// The color to display when this tab is not selected.
  final Color? unselectedColor;

  CrystalNavigationBarItem({
    required this.child,
    this.unselectedChild,
    this.selectedColor,
    this.unselectedColor,
    this.badge,
  });
}

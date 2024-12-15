import 'package:flutter/material.dart';

/// Class responsible for managing screen dimensions and orientation.
/// Provides access to screen width, height, default size, and orientation.
/// Initializes values based on the provided `BuildContext`.
class SizeConfig {
  static double? screenhieght;
  static double? screenwidth;
  static double? defaultSize;
  static Orientation? orientation;
  static const double mobile = 800;
  void init(BuildContext context) {
    screenwidth = MediaQuery.of(context).size.width;
    screenhieght = MediaQuery.of(context).size.height;
    orientation = MediaQuery.of(context).orientation;
    defaultSize = orientation == Orientation.landscape
        ? screenhieght! * 0.024
        : screenwidth! * 0.024;
  }
}

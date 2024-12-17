import 'package:flutter/material.dart';

extension BuildContextExtensions on BuildContext {
  //text
  ThemeData get _theme => Theme.of(this);
  TextTheme get textTheme => _theme.textTheme;
  ColorScheme get colorScheme => _theme.colorScheme;

  //device
  Size get deviceSize => MediaQuery.sizeOf(this);
  double get deviceWidth => MediaQuery.sizeOf(this).width;
  double get deviceHeight => MediaQuery.sizeOf(this).height;

  //orientation
  bool get isPotrait => MediaQuery.orientationOf(this) == Orientation.portrait;
  bool get isLandscape =>
      MediaQuery.orientationOf(this) == Orientation.landscape;

  //responsiveness accross devices
  bool get isSmallScreen => deviceWidth < 600;
  bool get isMediumScreen => deviceWidth >= 600 && deviceWidth < 1200;
  bool get isLargeScreen => deviceWidth >= 1200;

  //padding, this is tricky
  EdgeInsets get viewPadding => MediaQuery.viewPaddingOf(this);
  EdgeInsets get viewInsets =>
      MediaQuery.viewInsetsOf(this); // Keyboard handling
  EdgeInsets get safeArea => MediaQuery.paddingOf(this);
}

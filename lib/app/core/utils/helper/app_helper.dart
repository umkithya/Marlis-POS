import 'package:flutter/material.dart';

extension Sizes on num {
  Widget get sh => SizedBox(height: toDouble());
  Widget get sW => SizedBox(width: toDouble());
}

extension AppColor on BuildContext {
  ThemeData get themeData => Theme.of(this);
  Color get primaryColor => themeData.primaryColor;
  Color get backgoundColor => themeData.scaffoldBackgroundColor;
  TextTheme get textTheme => themeData.primaryTextTheme;
  TextStyle? get displayLarge => textTheme.displayLarge;
  TextStyle? get displayMedium => textTheme.displayMedium;
  TextStyle? get displaySmall => textTheme.displaySmall;
  TextStyle? get headlineLarge => textTheme.headlineLarge;
  TextStyle? get headlineMedium => textTheme.headlineMedium;
  TextStyle? get headlineSmall => textTheme.headlineSmall;
  TextStyle? get titleLarge => textTheme.titleLarge;
  TextStyle? get titleMedium => textTheme.titleMedium;
  TextStyle? get titleSmall => textTheme.titleSmall;
  TextStyle? get bodyLarge => textTheme.bodyLarge;
  TextStyle? get bodyMedium => textTheme.bodyMedium;
  TextStyle? get bodySmall => textTheme.bodySmall;
  TextStyle? get labelLarge => textTheme.labelLarge;
  TextStyle? get labelMedium => textTheme.labelMedium;
  TextStyle? get labelSmall => textTheme.labelSmall;
}

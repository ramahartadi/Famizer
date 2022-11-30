import 'package:flutter/material.dart';
import 'package:theme/custom_color.g.dart';

extension TypographyUtils on BuildContext {
  ThemeData get theme => Theme.of(this);

  TextStyle? get displayLarge => theme.textTheme.displayLarge;
  TextStyle? get displayMedium => theme.textTheme.displayMedium;
  TextStyle? get displaySmall => theme.textTheme.displaySmall;

  TextStyle? get headlineLarge => theme.textTheme.headlineLarge;
  TextStyle? get headlineMedium => theme.textTheme.headlineMedium;
  TextStyle? get headlineSmall => theme.textTheme.headlineSmall;

  TextStyle? get titleLarge => theme.textTheme.titleLarge;
  TextStyle? get titleMedium => theme.textTheme.titleMedium;
  TextStyle? get titleSmall => theme.textTheme.titleSmall;

  TextStyle? get bodyLarge => theme.textTheme.bodyLarge;
  TextStyle? get bodyMedium => theme.textTheme.bodyMedium;
  TextStyle? get bodySmall => theme.textTheme.bodySmall;

  TextStyle? get labelLarge => theme.textTheme.labelLarge;
  TextStyle? get labelMedium => theme.textTheme.labelMedium;
  TextStyle? get labelSmall => theme.textTheme.labelSmall;
}

extension ColorSchemeUtils on BuildContext {
  ThemeData get theme => Theme.of(this);
  ColorScheme get colors => theme.colorScheme;
}

extension CustomColorSchemeUtils on BuildContext {
  ThemeData get theme => Theme.of(this);
  CustomColors? get customColors => theme.extension<CustomColors>();
}

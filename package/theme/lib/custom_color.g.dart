import 'package:flutter/material.dart';

const pink = Color(0xFFFF5D8F);
const orange = Color(0xFFFB5607);
const green = Color(0xFF38CF81);
const purple = Color(0xFF480CA8);

CustomColors lightCustomColors = const CustomColors(
  sourcePink: Color(0xFFFF5D8F),
  pink: Color(0xFFB32057),
  onPink: Color(0xFFFFFFFF),
  pinkContainer: Color(0xFFFFD9E0),
  onPinkContainer: Color(0xFF3F0018),
  sourceOrange: Color(0xFFFB5607),
  orange: Color(0xFFAA3600),
  onOrange: Color(0xFFFFFFFF),
  orangeContainer: Color(0xFFFFDBCF),
  onOrangeContainer: Color(0xFF390C00),
  sourceGreen: Color(0xFF38CF81),
  green: Color(0xFF006D3E),
  onGreen: Color(0xFFFFFFFF),
  greenContainer: Color(0xFF6EFDAA),
  onGreenContainer: Color(0xFF00210F),
  sourcePurple: Color(0xFF480CA8),
  purple: Color(0xFF6C40CC),
  onPurple: Color(0xFFFFFFFF),
  purpleContainer: Color(0xFFE9DDFF),
  onPurpleContainer: Color(0xFF23005C),
);

CustomColors darkCustomColors = const CustomColors(
  sourcePink: Color(0xFFFF5D8F),
  pink: Color(0xFFFFB1C2),
  onPink: Color(0xFF66002B),
  pinkContainer: Color(0xFF8F0040),
  onPinkContainer: Color(0xFFFFD9E0),
  sourceOrange: Color(0xFFFB5607),
  orange: Color(0xFFFFB59C),
  onOrange: Color(0xFF5C1900),
  orangeContainer: Color(0xFF822800),
  onOrangeContainer: Color(0xFFFFDBCF),
  sourceGreen: Color(0xFF38CF81),
  green: Color(0xFF4DE090),
  onGreen: Color(0xFF00391E),
  greenContainer: Color(0xFF00522D),
  onGreenContainer: Color(0xFF6EFDAA),
  sourcePurple: Color(0xFF480CA8),
  purple: Color(0xFFD0BCFF),
  onPurple: Color(0xFF3B0091),
  purpleContainer: Color(0xFF5322B3),
  onPurpleContainer: Color(0xFFE9DDFF),
);

/// Defines a set of custom colors, each comprised of 4 complementary tones.
///
/// See also:
///   * <https://m3.material.io/styles/color/the-color-system/custom-colors>
@immutable
class CustomColors extends ThemeExtension<CustomColors> {
  const CustomColors({
    required this.sourcePink,
    required this.pink,
    required this.onPink,
    required this.pinkContainer,
    required this.onPinkContainer,
    required this.sourceOrange,
    required this.orange,
    required this.onOrange,
    required this.orangeContainer,
    required this.onOrangeContainer,
    required this.sourceGreen,
    required this.green,
    required this.onGreen,
    required this.greenContainer,
    required this.onGreenContainer,
    required this.sourcePurple,
    required this.purple,
    required this.onPurple,
    required this.purpleContainer,
    required this.onPurpleContainer,
  });

  final Color? sourcePink;
  final Color? pink;
  final Color? onPink;
  final Color? pinkContainer;
  final Color? onPinkContainer;
  final Color? sourceOrange;
  final Color? orange;
  final Color? onOrange;
  final Color? orangeContainer;
  final Color? onOrangeContainer;
  final Color? sourceGreen;
  final Color? green;
  final Color? onGreen;
  final Color? greenContainer;
  final Color? onGreenContainer;
  final Color? sourcePurple;
  final Color? purple;
  final Color? onPurple;
  final Color? purpleContainer;
  final Color? onPurpleContainer;

  @override
  CustomColors copyWith({
    Color? sourcePink,
    Color? pink,
    Color? onPink,
    Color? pinkContainer,
    Color? onPinkContainer,
    Color? sourceOrange,
    Color? orange,
    Color? onOrange,
    Color? orangeContainer,
    Color? onOrangeContainer,
    Color? sourceGreen,
    Color? green,
    Color? onGreen,
    Color? greenContainer,
    Color? onGreenContainer,
    Color? sourcePurple,
    Color? purple,
    Color? onPurple,
    Color? purpleContainer,
    Color? onPurpleContainer,
  }) {
    return CustomColors(
      sourcePink: sourcePink ?? this.sourcePink,
      pink: pink ?? this.pink,
      onPink: onPink ?? this.onPink,
      pinkContainer: pinkContainer ?? this.pinkContainer,
      onPinkContainer: onPinkContainer ?? this.onPinkContainer,
      sourceOrange: sourceOrange ?? this.sourceOrange,
      orange: orange ?? this.orange,
      onOrange: onOrange ?? this.onOrange,
      orangeContainer: orangeContainer ?? this.orangeContainer,
      onOrangeContainer: onOrangeContainer ?? this.onOrangeContainer,
      sourceGreen: sourceGreen ?? this.sourceGreen,
      green: green ?? this.green,
      onGreen: onGreen ?? this.onGreen,
      greenContainer: greenContainer ?? this.greenContainer,
      onGreenContainer: onGreenContainer ?? this.onGreenContainer,
      sourcePurple: sourcePurple ?? this.sourcePurple,
      purple: purple ?? this.purple,
      onPurple: onPurple ?? this.onPurple,
      purpleContainer: purpleContainer ?? this.purpleContainer,
      onPurpleContainer: onPurpleContainer ?? this.onPurpleContainer,
    );
  }

  @override
  CustomColors lerp(ThemeExtension<CustomColors>? other, double t) {
    if (other is! CustomColors) {
      return this;
    }
    return CustomColors(
      sourcePink: Color.lerp(sourcePink, other.sourcePink, t),
      pink: Color.lerp(pink, other.pink, t),
      onPink: Color.lerp(onPink, other.onPink, t),
      pinkContainer: Color.lerp(pinkContainer, other.pinkContainer, t),
      onPinkContainer: Color.lerp(onPinkContainer, other.onPinkContainer, t),
      sourceOrange: Color.lerp(sourceOrange, other.sourceOrange, t),
      orange: Color.lerp(orange, other.orange, t),
      onOrange: Color.lerp(onOrange, other.onOrange, t),
      orangeContainer: Color.lerp(orangeContainer, other.orangeContainer, t),
      onOrangeContainer:
          Color.lerp(onOrangeContainer, other.onOrangeContainer, t),
      sourceGreen: Color.lerp(sourceGreen, other.sourceGreen, t),
      green: Color.lerp(green, other.green, t),
      onGreen: Color.lerp(onGreen, other.onGreen, t),
      greenContainer: Color.lerp(greenContainer, other.greenContainer, t),
      onGreenContainer: Color.lerp(onGreenContainer, other.onGreenContainer, t),
      sourcePurple: Color.lerp(sourcePurple, other.sourcePurple, t),
      purple: Color.lerp(purple, other.purple, t),
      onPurple: Color.lerp(onPurple, other.onPurple, t),
      purpleContainer: Color.lerp(purpleContainer, other.purpleContainer, t),
      onPurpleContainer:
          Color.lerp(onPurpleContainer, other.onPurpleContainer, t),
    );
  }

  /// Returns an instance of [CustomColors] in which the following custom
  /// colors are harmonized with [dynamic]'s [ColorScheme.primary].
  ///
  /// See also:
  ///   * <https://m3.material.io/styles/color/the-color-system/custom-colors#harmonization>
  CustomColors harmonized(ColorScheme dynamic) {
    return copyWith();
  }
}

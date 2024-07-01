import 'package:flutter/material.dart';
import '../core/app_export.dart';

extension on TextStyle {
  TextStyle get roboto {
    return copyWith(
      fontFamily: 'Roboto',
    );
  }
}

/// A collection of pre-defined text styles for customizing text appearance,
/// categorized by different font families and weights.
/// Additionally, this class includes extensions on [TextStyle] to easily apply specific font families to text.
class CustomTextStyles {
  // Body text style
  static get bodyLargeGray50001 => theme.textTheme.bodyLarge!.copyWith(
        color: appTheme.gray50001,
      );
  static get bodyLargeGray50002 => theme.textTheme.bodyLarge!.copyWith(
        color: appTheme.gray50002,
      );
  static get bodyLargeGray90002 => theme.textTheme.bodyLarge!.copyWith(
        color: appTheme.gray90002,
      );
  static get bodyMediumGray90002 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.gray90002,
      );
  static get bodyMediumPrimaryContainer => theme.textTheme.bodyMedium!.copyWith(
        color: theme.colorScheme.primaryContainer,
      );
// Headline text style
  static get headlineLargeGray90002 => theme.textTheme.headlineLarge!.copyWith(
        color: appTheme.gray90002,
      );
  static get headlineLargeMedium => theme.textTheme.headlineLarge!.copyWith(
        fontSize: 31.fSize,
        fontWeight: FontWeight.w500,
      );
// Title text style
  static get titleLargeGray50001 => theme.textTheme.titleLarge!.copyWith(
        color: appTheme.gray50001,
      );
  static get titleLargeGray90002 => theme.textTheme.titleLarge!.copyWith(
        color: appTheme.gray90002,
      );
  static get titleMediumGray50002 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.gray50002,
      );
  static get titleMediumGray90002 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.gray90002,
      );
  static get titleMediumPrimary => theme.textTheme.titleMedium!.copyWith(
        color: theme.colorScheme.primary,
      );
  static get titleMediumTeal900 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.teal900,
      );
  static get titleSmallTeal900 => theme.textTheme.titleSmall!.copyWith(
        color: appTheme.teal900,
      );

        static get titleSmallRed => theme.textTheme.titleSmall!.copyWith(
        color: appTheme.red900,
      );
}

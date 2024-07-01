import 'package:flutter/material.dart';
import '../core/app_export.dart';

class AppDecoration {
  // Accent decorations
  static BoxDecoration get accentPrimary1 => BoxDecoration(
        color: appTheme.teal900,
        boxShadow: [
          BoxShadow(
            color: appTheme.black90011,
            spreadRadius: 2.h,
            blurRadius: 2.h,
            offset: Offset(
              0,
              3,
            ),
          )
        ],
      );
  static BoxDecoration get accentPrimary2 => BoxDecoration(
        color: theme.colorScheme.primary,
        boxShadow: [
          BoxShadow(
            color: appTheme.black90011.withOpacity(0.3),
            spreadRadius: 2.h,
            blurRadius: 2.h,
            offset: Offset(
              0,
              1,
            ),
          )
        ],
      );
  static BoxDecoration get accentSecondary1 => BoxDecoration(
        color: theme.colorScheme.onPrimary,
      );
// Background decorations
  static BoxDecoration get background => BoxDecoration(
        color: appTheme.gray900,
      );
// Fill decorations
  static BoxDecoration get fillWhiteA => BoxDecoration(
        color: appTheme.whiteA700,
      );
// Layer decorations
  static BoxDecoration get layer1 => BoxDecoration(
        color: theme.colorScheme.onPrimaryContainer,
      );
  static BoxDecoration get layer2 => BoxDecoration(
        color: appTheme.gray90001,
      );
  static BoxDecoration get layer3 => BoxDecoration(
        color: theme.colorScheme.secondaryContainer,
        boxShadow: [
          BoxShadow(
            color: appTheme.black90011,
            spreadRadius: 2.h,
            blurRadius: 2.h,
            offset: Offset(
              0,
              3,
            ),
          )
        ],
      );
// Outline decorations
  static BoxDecoration get outlineBlack => BoxDecoration(
        color: theme.colorScheme.onPrimaryContainer,
        boxShadow: [
          BoxShadow(
            color: appTheme.black90011,
            spreadRadius: 2.h,
            blurRadius: 2.h,
            offset: Offset(
              0,
              3,
            ),
          )
        ],
      );
// Support decorations
  static BoxDecoration get supportErrorbase => BoxDecoration(
        color: appTheme.red900,
      );
// Text decorations
  static BoxDecoration get textWhite => BoxDecoration(
        color: theme.colorScheme.primaryContainer,
      );
  static BoxDecoration get textWhiteM3ElevationLight3 => BoxDecoration(
        color: theme.colorScheme.primaryContainer,
        boxShadow: [
          BoxShadow(
            color: appTheme.black90011.withOpacity(0.3),
            spreadRadius: 2.h,
            blurRadius: 2.h,
            offset: Offset(
              0,
              1,
            ),
          )
        ],
      );
}

class BorderRadiusStyle {
  // Custom borders
  static BorderRadius get customBorderBL20 => BorderRadius.vertical(
        bottom: Radius.circular(20.h),
      );
  static BorderRadius get customBorderTL10 => BorderRadius.vertical(
        top: Radius.circular(10.h),
      );
// Rounded borders
  static BorderRadius get roundedBorder10 => BorderRadius.circular(
        10.h,
      );
  static BorderRadius get roundedBorder20 => BorderRadius.circular(
        20.h,
      );
  static BorderRadius get roundedBorder28 => BorderRadius.circular(
        28.h,
      );
  static BorderRadius get roundedBorder4 => BorderRadius.circular(
        4.h,
      );
}

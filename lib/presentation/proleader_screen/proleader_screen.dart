import 'package:app_p_79/core/app_export.dart';
import 'package:app_p_79/core/utils/pref.dart';

import 'package:flutter/material.dart';

class ProleaderScreen extends GetWidget {
  const ProleaderScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return
         TimerSplashElement(
          child:
        SafeArea(
      child: Scaffold(
        body: Center(
          child: SizedBox(
            height: 43.adaptSize,
            width: 43.adaptSize,
            child: CircularProgressIndicator(
              color: appTheme.whiteA700,
              backgroundColor: theme.colorScheme.onPrimary.withOpacity(.5),
            ),
          ),
        ),
      ),
      ),
    );
  }
}

import 'package:app_p_79/core/app_export.dart';

import 'package:flutter/material.dart';

class CustomAlertDialog extends StatelessWidget {
  final String title;
  final String contentText;
  final String? activeButton;
  final bool isSingle;
  const CustomAlertDialog({
    super.key,
    required this.title,
    required this.contentText,
    this.activeButton,
    this.isSingle = false,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Center(
          child: Container(
        width: 312.h,
        padding: EdgeInsets.symmetric(
          horizontal: 24.h,
          vertical: 26.v,
        ),
        decoration: AppDecoration.accentSecondary1.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder28,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: CustomTextStyles.titleLargeGray90002,
            ),
            SizedBox(height: 12.v),
            Text(
              contentText,
              style: theme.textTheme.bodyMedium,
            ),
            SizedBox(height: 33.v),
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: EdgeInsets.only(right: 12.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: () => Navigator.pop(context, true),
                      child: Text(
                        activeButton ?? "lbl_ok".tr,
                        style: CustomTextStyles.titleMediumPrimary,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 31.h),
                      child: InkWell(
                        onTap: () => Navigator.pop(context, false),
                        child: Text(
                          "lbl_cancel".tr,
                          style: CustomTextStyles.titleMediumTeal900,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 7.v)
          ],
        ),
      )),
    );
  }
}

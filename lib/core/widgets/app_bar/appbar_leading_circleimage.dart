import 'package:app_p_79/core/widgets/custom_image_view.dart';
import 'package:flutter/material.dart';
import 'package:app_p_79/core/app_export.dart';

class AppbarLeadingCircleimage extends StatelessWidget {
  AppbarLeadingCircleimage({Key? key, this.imagePath, this.margin, this.onTap})
      : super(
          key: key,
        );

  final String? imagePath;
  final EdgeInsetsGeometry? margin;
  final Function? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap?.call();
      },
      child: Padding(
        padding: margin ?? EdgeInsets.zero,
        child: CustomImageView(
          imagePath: imagePath!,
          height: 48.adaptSize,
          width: 48.adaptSize,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}

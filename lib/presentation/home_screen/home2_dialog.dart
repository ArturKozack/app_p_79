import 'package:app_p_79/core/widgets/custom_elevated_button.dart';
import 'package:app_p_79/core/widgets/custom_image_view.dart';
import 'package:flutter/material.dart';
import '../../core/app_export.dart';

class Home2Dialog extends StatelessWidget {
  final String name;

  const Home2Dialog({Key? key, required this.name})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: double.maxFinite,
              padding: EdgeInsets.symmetric(
                horizontal: 8.h,
                vertical: 12.v,
              ),
              decoration: AppDecoration.textWhite.copyWith(
                borderRadius: BorderRadiusStyle.roundedBorder10,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CustomImageView(
                    imagePath: ImageConstant.imgImage1,
                    height: 358.adaptSize,
                    fit: BoxFit.contain,
                    width: double.maxFinite,
                  ),
                  SizedBox(height: 8.v),
                  Text(
                    "msg_you_have_exceeded".tr,
                    textAlign: TextAlign.center,
                    style: CustomTextStyles.titleMediumGray90002,
                  ),
                  SizedBox(height: 8.v),
                  Text(
                    'Reduce dining out to save money on food. Plan your meals and cook in batches to make home-cooking more convenient. This not only saves money but also allows you to eat healthier and control portion sizes.',
                    textAlign: TextAlign.center,
                    style: theme.textTheme.bodyMedium,
                  ),
                  SizedBox(height: 8.v),
                  CustomElevatedButton(
                    text: "lbl_ok2".tr,
                    onPressed: () {
                      Get.back();
                      Get.back();
                    },
                    margin: EdgeInsets.symmetric(horizontal: 4.h),
                    buttonStyle: CustomButtonStyles.fillPrimaryTL10,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:app_p_79/core/app_export.dart';
import 'package:app_p_79/core/utils/app_repo.dart';
import 'package:app_p_79/core/widgets/custom_bottom_bar.dart';
import 'package:app_p_79/core/widgets/custom_elevated_button.dart';
import 'package:app_p_79/core/widgets/custom_image_view.dart';
import 'package:flutter/material.dart';

// ignore_for_file: must_be_immutable
class OnboardingDialog extends StatelessWidget {
  OnboardingDialog({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Center(
          child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Card(
            clipBehavior: Clip.antiAlias,
            elevation: 0,
            margin: EdgeInsets.zero,
            color: theme.colorScheme.onPrimary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusStyle.customBorderTL10,
            ),
            child: Container(
              height: 252.v,
              width: double.maxFinite,
              padding: EdgeInsets.symmetric(horizontal: 20.h),
              decoration: AppDecoration.accentSecondary1.copyWith(
                borderRadius: BorderRadiusStyle.customBorderTL10,
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  CustomImageView(
                    imagePath: ImageConstant.imgImage250x340,
                    height: 250.v,
                    width: double.maxFinite,
                  ),
                  CustomImageView(
                    imagePath: ImageConstant.imgArrowRight,
                    height: 24.adaptSize,
                    width: 24.adaptSize,
                    alignment: Alignment.topRight,
                    margin: EdgeInsets.only(top: 22.v),
                  )
                ],
              ),
            ),
          ),
          SizedBox(height: 18.v),
          Text(
            "msg_profitable_offers".tr,
            style: theme.textTheme.titleMedium,
          ),
          SizedBox(height: 18.v),
          CustomElevatedButton(
            height: 48.v,
            text: "lbl_review".tr,
            onPressed: () {
              Get.back();
              Get.find<AppRepository>().updateTab(index: BottomBarEnum.Home);
            },
            margin: EdgeInsets.symmetric(horizontal: 10.h),
            buttonStyle: CustomButtonStyles.fillPrimary,
          ),
          SizedBox(height: 28.v)
        ],
      )),
    );
  }
}

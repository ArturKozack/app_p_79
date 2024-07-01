import 'package:app_p_79/core/app_export.dart';
import 'package:app_p_79/core/widgets/custom_elevated_button.dart';

import 'package:app_p_79/core/widgets/custom_image_view.dart';
import 'package:flutter/material.dart';

class OnboardingOneScreen extends GetWidget {
  const OnboardingOneScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.all(14.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildImageSection(context),
              SizedBox(height: 70.v),
              _buildContinueButton(context),
              SizedBox(height: 4.v)
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildImageSection(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(horizontal: 24.h),
      child: Stack(
        children: [
  
                CustomImageView(
                  imagePath: ImageConstant.imgImage314x312,
                  height: 492.v,
                  width: double.maxFinite,
                ),
     
                Positioned(
                  left: 40.h,
                  right: 40.h,
                  bottom: 50.v,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "msg_financial_assistant".tr,
                        style: CustomTextStyles.headlineLargeGray90002,
                      ),
                         SizedBox(height: 4.v),
                  Text(
                    "msg_plan_a_budget_enter".tr,
                     
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.bodyMedium,
                  ),

                    ],
                  ),
                ),
             
              ],
            ),
      
     
    );
  }

  /// Section Widget
  Widget _buildContinueButton(BuildContext context) {
    return CustomElevatedButton(
      text: "lbl_continue".tr,
      onPressed: () => Get.offAndToNamed(AppRoutes.rootScreen),
      margin: EdgeInsets.symmetric(horizontal: 6.h),
    );
  }
}

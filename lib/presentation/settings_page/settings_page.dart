import 'dart:io';

import 'package:app_p_79/core/app_export.dart';
import 'package:app_p_79/core/widgets/app_bar/appbar_title.dart';
import 'package:app_p_79/core/widgets/app_bar/custom_app_bar.dart';
import 'package:app_p_79/core/widgets/custom_dialog.dart';
import 'package:app_p_79/core/widgets/custom_image_view.dart';
import 'package:app_p_79/core/widgets/event_listener.dart';
import 'package:app_settings/app_settings.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

// ignore_for_file: must_be_immutable
class SettingsPage extends EventListener {
  SettingsPage({Key? key})
      : super(
          key: key,
        );

  @override
  Widget body(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(),
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(
            horizontal: 14.h,
            vertical: 18.v,
          ),
          child: Column(
            children: [_buildSettingsButton()],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar() {
    return CustomAppBar(
      centerTitle: true,
      title: AppbarTitle(
        text: "lbl_settings".tr,
      ),
    );
  }

  /// Section Widget
  Widget _buildSettingsButton() {
    return Column(
      children: [
        _buildbutton(
          title: "lbl_notification".tr,
          onTap: () => AppSettings.openAppSettings(
            type: AppSettingsType.notification,
          ),
        ),
        SizedBox(
          height: 12.v,
        ),
        _buildbutton(
          title: "lbl_privacy_policy".tr,
          onTap: () => Get.toNamed(
            AppRoutes.privacyPolicyScreen,
          ),
        ),
        SizedBox(
          height: 12.v,
        ),
        _buildbutton(
          title: "lbl_share_the_app".tr,
          onTap: () => Share.share(Platform.isAndroid
              ? 'https://play.google.com/store/apps/details?id='
              : 'https://apps.apple.com/app/id6504193567'),
        ),
        if (Platform.isIOS)
          SizedBox(
            height: 12.v,
          ),
        if (Platform.isIOS)
          _buildbutton(
            title: "lbl_terms_of_use".tr,
            onTap: () => Get.toNamed(
              AppRoutes.termsOfUseScreen,
            ),
          ),
        SizedBox(
          height: 12.v,
        ),
        InkWell(
          onTap: () => Get.dialog<bool>(
            CustomAlertDialog(
              title: 'lbl_are_you_sure'.tr,
              contentText: 'msg_all_data_will_be'.tr,
            ),
          ).then((value) async {
            if (value != null && value) {
              await controller.delete();
            }
          }),
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: 20.h,
              vertical: 5.v,
            ),
            decoration: AppDecoration.layer2.copyWith(
              borderRadius: BorderRadiusStyle.roundedBorder10,
              color: appTheme.red900,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    bottom: 13.v,
                              top: 13.v,
                  ),
                  child: Text(
                    "lbl_clear_data".tr,
                    style: theme.textTheme.bodyLarge!.copyWith(
                      color: theme.colorScheme.primaryContainer,
                    ),
                  ),
                ),
                CustomImageView(
                  imagePath: ImageConstant.imgArrowLeft,
                  height: 48.adaptSize,
                  width: 48.adaptSize,
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  /// Common widget
  Widget _buildbutton({
    required String title,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 20.h,
          vertical: 5.v,
        ),
        decoration: AppDecoration.layer2.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder10,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.only(
                bottom: 13.v,
                top: 13.v,
              ),
              child: Text(
                title,
                style: theme.textTheme.bodyLarge!.copyWith(
                  color: theme.colorScheme.primaryContainer,
                ),
              ),
            ),
            CustomImageView(
              imagePath: ImageConstant.imgArrowLeft,
              height: 48.adaptSize,
              width: 48.adaptSize,
            )
          ],
        ),
      ),
    );
  }
}

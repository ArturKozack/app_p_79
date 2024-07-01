import 'package:app_p_79/core/app_export.dart';
import 'package:app_p_79/core/widgets/app_bar/appbar_leading_circleimage.dart';

import 'package:app_p_79/core/widgets/app_bar/appbar_title.dart';
import 'package:app_p_79/core/widgets/app_bar/custom_app_bar.dart';
import 'package:flutter/material.dart';

class TermsOfUseScreen extends GetWidget {
  const TermsOfUseScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(),
        body: SingleChildScrollView(
          child: Container(
            width: 383.h,
            margin: EdgeInsets.symmetric(
              horizontal: 15.h,
              vertical: 19.v,
            ),
            child: Text(
              '''''',
              textAlign: TextAlign.justify,
              style: CustomTextStyles.bodyMediumPrimaryContainer,
            ),
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return CustomAppBar(
      leadingWidth: 52.h,
      leading: AppbarLeadingCircleimage(
        imagePath: ImageConstant.imgArrowLeftPrimarycontainer,
        margin: EdgeInsets.only(
          left: 4.h,
          top: 8.v,
          bottom: 8.v,
        ),
        onTap: () {
          onTapContainerone();
        },
      ),
      centerTitle: true,
      title: AppbarTitle(
        text: "lbl_privacy_policy".tr,
      ),
    );
  }

  onTapContainerone() {
    Get.back();
  }
}

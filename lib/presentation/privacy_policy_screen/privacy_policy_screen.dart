import 'package:app_p_79/core/app_export.dart';
import 'package:app_p_79/core/widgets/app_bar/appbar_leading_circleimage.dart';

import 'package:app_p_79/core/widgets/app_bar/appbar_title.dart';
import 'package:app_p_79/core/widgets/app_bar/custom_app_bar.dart';
import 'package:flutter/material.dart';

class PrivacyPolicyScreen extends GetWidget {
  const PrivacyPolicyScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(),
        body: 
        
        
        SingleChildScrollView(
          child: Container(
            width: 383.h,
            margin: EdgeInsets.symmetric(
              horizontal: 15.h,
              vertical: 19.v,
            ),
            child: Text(
              '''
At ACE Cash Xpress, we value your privacy and are committed to protecting your personal information. This Privacy Policy explains how we collect, use, disclose, and safeguard your information when you use our mobile application ("App"). Please read this policy carefully. If you do not agree with the terms of this Privacy Policy, please do not access the App.
1. Information We Collect
Personal Data: We may collect personal information, such as your name, email address, phone number, and payment information, when you register for an account, make a transaction, or contact us for support.
Usage Data: We may collect information about your usage of the App, including your device information, IP address, and browsing behavior.
Location Data: With your consent, we may collect information about your device’s location.
2. Use of Your Information
We may use the information we collect for various purposes, including:
To provide and maintain our services
To process transactions and send you related information
To communicate with you, including sending you updates and promotional materials
To monitor and analyze usage and trends to improve your experience
To protect the rights, property, or safety of ACE Cash Xpress, our users, or others
3. Sharing Your Information
We may share your information with third parties under the following circumstances:
With your consent
With service providers who perform services on our behalf
To comply with legal obligations
To protect and defend our rights and property
In connection with a business transaction, such as a merger or acquisition
4. Security of Your Information
We use administrative, technical, and physical security measures to protect your personal information. However, no method of transmission over the Internet or method of electronic storage is 100% secure.
5. Your Privacy Rights
Depending on your location, you may have the right to access, correct, or delete your personal information. You may also have the right to object to or restrict certain types of processing.
6. Changes to This Privacy Policy
We may update this Privacy Policy from time to time. We will notify you of any changes by posting the new Privacy Policy on this page. You are advised to review this Privacy Policy periodically for any changes.
7. Contact Us
If you have any questions about this Privacy Policy, please contact us at:
Email: info@rhymeandreason.ink


''',
              textAlign: TextAlign.justify,
              style: CustomTextStyles.bodyMediumPrimaryContainer,
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
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

  /// Navigates to the previous screen.
  onTapContainerone() {
    Get.back();
  }
}

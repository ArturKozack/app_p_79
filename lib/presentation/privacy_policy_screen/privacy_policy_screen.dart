import 'dart:io';

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
           Platform.isIOS?   '''
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


''': '''
Welcome to ASE Xpress. We value your privacy and are committed to protecting your personal information. This Privacy Policy outlines the types of information we collect, how we use it, and the steps we take to ensure your information is protected.

Information We Collect

1. Personal Information: When you use ASE Xpress, we may collect personal information such as your name, email address, and financial information.
2. Usage Data: We collect data on how you use the app, including the features you access, the actions you take, and the time and duration of your sessions.
3. Device Information: We may collect information about the device you use to access our app, including the device type, operating system, and unique device identifiers.
4. Cookies and Tracking Technologies: We use cookies and similar technologies to track your activity on our app and store certain information.

How We Use Your Information

1. Personalized Financial Advice: We use your personal and financial information to provide tailored financial advice and recommendations.
2. App Improvement: Your usage data helps us understand how our app is used and identify areas for improvement.
3. Communication: We may use your contact information to send you updates, security alerts, and other important information.
4. Analytics: We use analytics tools to understand and analyze usage trends and preferences to improve the app's performance and user experience.

Sharing Your Information

1. Third-Party Service Providers: We may share your information with third-party service providers who assist us in operating our app, conducting our business, or serving our users.
2. Legal Requirements: We may disclose your information if required by law or in response to valid requests by public authorities.
3. Business Transfers: In the event of a merger, acquisition, or sale of assets, your information may be transferred to the acquiring entity.

Security of Your Information
We take reasonable measures to protect your personal information from unauthorized access, use, or disclosure. However, no internet or email transmission is ever fully secure or error-free. Please keep this in mind when disclosing any personal information to us via the internet.

Your Choices

1. Access and Update: You can access and update your personal information through your account settings in the app.
2. Opt-Out: You can opt-out of receiving promotional communications from us by following the unsubscribe instructions provided in those communications.
3. Data Deletion: You can request the deletion of your personal information by contacting us at [contact email].

Children's Privacy
ASE Xpress is not intended for use by children under the age of 13, and we do not knowingly collect personal information from children under 13. If we become aware that we have inadvertently received personal information from a user under the age of 13, we will delete such information from our records.

Changes to This Privacy Policy
We may update this Privacy Policy from time to time. When we do, we will post the updated policy on this page and update the "Last Updated" date above. We encourage you to review this Privacy Policy periodically to stay informed about how we are protecting your information.

Contact Us
If you have any questions about this Privacy Policy, please contact us at:
Email: info@aceexpress.co

Thank you for using ASE Xpress!
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

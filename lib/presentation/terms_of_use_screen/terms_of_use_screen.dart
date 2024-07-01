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
              '''
These Terms and Conditions ("Terms") govern your use of the ACE Cash Xpress mobile application ("App"). By accessing or using the App, you agree to be bound by these Terms. If you do not agree to these Terms, do not use the App.
1. Use of the App
Eligibility: You must be at least 18 years old to use the App.
Account Registration: You may be required to create an account to access certain features. You agree to provide accurate and complete information when creating your account.
Prohibited Activities: You agree not to use the App for any unlawful or prohibited activities, including but not limited to fraud, harassment, or infringement of intellectual property rights.
2. Transactions
Fees: You agree to pay all fees associated with transactions made through the App. Fees are disclosed prior to completing a transaction.
Accuracy of Information: You are responsible for ensuring that all transaction details are accurate. ACE Cash Xpress is not responsible for any errors or losses resulting from inaccurate information.
3. Intellectual Property
All content and materials in the App, including text, graphics, logos, and software, are the property of ACE Cash Xpress or its licensors and are protected by copyright, trademark, and other intellectual property laws.
4. Disclaimer of Warranties
The App is provided on an "as is" and "as available" basis. ACE Cash Xpress makes no warranties, express or implied, regarding the operation or availability of the App, or the accuracy, reliability, or completeness of any information or content.
5. Limitation of Liability
To the maximum extent permitted by law, ACE Cash Xpress shall not be liable for any indirect, incidental, special, or consequential damages arising out of or in connection with your use of the App.
6. Indemnification
You agree to indemnify, defend, and hold harmless ACE Cash Xpress and its affiliates from any claims, liabilities, damages, losses, or expenses arising from your use of the App or violation of these Terms.
7. Changes to These Terms
We may update these Terms from time to time. We will notify you of any changes by posting the new Terms on this page. Your continued use of the App after the changes have been posted will constitute your acceptance of the new Terms.
8. Governing Law
These Terms shall be governed by and construed in accordance with the laws of [Your Country/State], without regard to its conflict of law principles.
9. Contact Us
If you have any questions about these Terms, please contact us at:
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

// ignore_for_file: must_be_immutable

import 'package:app_p_79/core/utils/extensions.dart';
import 'package:app_p_79/core/widgets/app_bar/appbar_title.dart';
import 'package:app_p_79/core/widgets/app_bar/custom_app_bar.dart';
import 'package:app_p_79/core/widgets/custom_elevated_button.dart';
import 'package:app_p_79/core/widgets/custom_image_view.dart';
import 'package:app_p_79/core/widgets/event_listener.dart';
import 'package:app_p_79/presentation/home_screen/widgets/transactionslist_item_widget.dart';
import 'package:flutter/material.dart';
import '../../core/app_export.dart';

class HomeScreen extends EventListener {
  HomeScreen({Key? key});

  @override
  Widget body(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _buildTopAppBar(context),
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(
            horizontal: 14.h,
            vertical: 12.v,
          ),
          child: user.credit.transaction.isEmpty
              ? _buildEmpty(context)
              : _buildHomeContent(context),
        ),
        floatingActionButton: InkWell(
          borderRadius: BorderRadiusStyle.roundedBorder10,
          onTap: () => Get.toNamed(AppRoutes.addScreen),
          child: Container(
            height: 56.v,
            width: 56.h,
            decoration: AppDecoration.accentPrimary2.copyWith(
              borderRadius: BorderRadiusStyle.roundedBorder10,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "lbl".tr,
                  style: CustomTextStyles.headlineLargeMedium,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Column _buildEmpty(BuildContext context) {
    return Column(
      children: [
        Spacer(),
        _buildNoTransactionsSection(context),
      ],
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildTopAppBar(BuildContext context) {
    return CustomAppBar(
      centerTitle: true,
      title: AppbarTitle(
        text: "lbl_home".tr,
      ),
    );
  }

  /// Section Widget
  Widget _buildNoTransactionsSection(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: Column(
        children: [
          SizedBox(
            width: double.maxFinite,
            child: Column(
              children: [
                Text(
                  "msg_you_have_no_transactions".tr,
                  style: CustomTextStyles.bodyLargeGray50002,
                ),
                SizedBox(height: 322.v),
              ],
            ),
          )
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildCalculatorSection(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.h),
      decoration: AppDecoration.accentSecondary1.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder10,
      ),
      width: double.maxFinite,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgM028t0146AIcon07sep22,
            height: 138.v,
            width: 96.h,
          ),
          SizedBox(width: 4.h),
          Expanded(
            child: Column(
              children: [
                Container(
                  width: double.maxFinite,
                  padding: EdgeInsets.symmetric(vertical: 6.v),
                  decoration: AppDecoration.layer1.copyWith(
                    borderRadius: BorderRadiusStyle.roundedBorder20,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: user.credit.percent.format.currencyFormat,
                              style: theme.textTheme.headlineLarge,
                            )
                          ],
                        ),
                        textAlign: TextAlign.left,
                      ),
                      Text(
                        "lbl_balance".tr,
                        style: CustomTextStyles.titleLargeGray50001,
                      ),
                      SizedBox(height: 4.v)
                    ],
                  ),
                ),
                SizedBox(height: 8.v),
                CustomElevatedButton(
                  height: 48.v,
                  onPressed: () => Get.toNamed(AppRoutes.addBudgetScreen,
                      arguments: {'model': user.credit}),
                  text: "msg_change_budget_for".tr,
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildTransactionsHeader(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          Text(
            "lbl_transactions".tr,
            style: theme.textTheme.headlineSmall,
          ),
          CustomImageView(
            imagePath: ImageConstant.imgArrowLeft,
            onTap: () => Get.toNamed(AppRoutes.detailsScreen),
            height: 48.adaptSize,
            width: 48.adaptSize,
          )
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildTransactionsList(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: ListView.separated(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        separatorBuilder: (context, index) {
          return SizedBox(
            height: 10.v,
          );
        },
        itemCount: user.credit.transaction.length,
        itemBuilder: (context, index) {
          return TransactionslistItemWidget(
            user.credit.transaction.elementAt(index),
          );
        },
      ),
    );
  }

  /// Section Widget
  Widget _buildHomeContent(BuildContext context) {
    return  SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            _buildCalculatorSection(context),
            SizedBox(height: 20.v),
            _buildTransactionsHeader(context),
            SizedBox(height: 10.v),
            _buildTransactionsList(context),
          ],
        ),
      
    );
  }
}

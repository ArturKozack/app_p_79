import 'dart:math';

import 'package:app_p_79/core/widgets/app_bar/appbar_title.dart';
import 'package:app_p_79/core/widgets/app_bar/custom_app_bar.dart';
import 'package:app_p_79/core/widgets/custom_image_view.dart';
import 'package:flutter/material.dart';
import 'package:layout_manager/layout_provider.dart';
import '../../core/app_export.dart';

const list = [
  'Today, start tracking every single dollar you spend. Knowledge is power, and this is your first step toward financial mastery. By understanding where your money goes, you\'re laying the foundation for financial success. You have the discipline to do this—let\'s get started and seize control of your finances',
  'Great job on tracking your spending! Now, let’s review those subscriptions. Cancel what you don’t use. Remember, every dollar saved is a dollar earned. Imagine your finances as a lean, mean machine—strip away the unnecessary and focus on what truly matters. You’re one step closer to financial freedom',
  'Set a daily spending limit for yourself today. Think of it as a game—can you stay under your target? This will train your mind to differentiate between needs and wants. Just like an athlete controls their diet for peak performance, control your spending to achieve financial excellence. You’ve got this!',
  'Let’s tackle one of the biggest budget busters: food. Plan your meals for the week and stick to it. Cooking at home isn\'t just healthier—it\'s cheaper. You\'re crafting a financial diet that nourishes your wallet. You have the power and creativity to make delicious, cost-effective meals. Go for it!',
  'You’re doing amazing! Today, automate your savings. Set up an automatic transfer to your savings account every payday. It’s like having a coach who ensures you never miss a workout. Your future self will thank you for every penny saved today. Keep pushing—you\'re building a financial fortress',
  'Before you make any purchase today, compare prices from at least three sources. This is your financial training—honing the skills of a smart shopper. Just like an athlete studies their competition, study your options to make the best choice. You\'re sharpening your financial acumen. Stay focused',
  'Today’s challenge: avoid impulse purchases. When tempted, take a step back and wait 24 hours. This practice strengthens your financial discipline. Remember, champions don’t act on whims—they strategize. You’re in control of your finances, and every deliberate choice takes you closer to victory!',
  'Let’s go deeper: review your insurance policies. Ensure you\'re not overpaying for coverage. Just as an athlete adjusts their training regimen, adjust your policies to fit your needs. Protecting yourself efficiently is part of winning the financial game. You’re smart, capable, and ready to optimize!',
  'Set a short-term financial goal today, like saving for a vacation or paying off a small debt. Having clear, achievable goals keeps you motivated. It’s your personal best target—train for it, strive for it, and achieve it. Your focus and determination are your greatest tools. Aim high and hit your mark!',
  'Today, contact your service providers and negotiate your bills. You’d be surprised at the discounts you can get just by asking. This is your financial sparring—assert yourself, and fight for better rates. You’re not just a passive consumer; you’re a proactive financial warrior. Go out and win those savings!',
  'Ready for a new challenge? Start a side hustle today. Whether it\'s freelance work, selling crafts, or tutoring, extra income strengthens your financial position. It\'s like adding extra training sessions to your regimen—every bit of effort counts. You have the skills and drive to make this happen. Hustle hard!',
  'It’s time to level up: review your investment portfolio. Make sure it aligns with your goals and risk tolerance. Just as an athlete adjusts their techniques, adjust your investments for maximum performance. Stay informed, stay strategic, and let your money work as hard as you do. You’re in control',
  'Let’s focus on optimizing: learn about and maximize your tax benefits. Deductions, credits, and retirement contributions can save you significant money. It’s like finding hidden boosts in your training. Use every advantage available to you. You’re not just playing the game; you’re mastering it!',
  'Finally, envision your long-term financial goals: retirement, buying a home, or starting a business. Create a plan to achieve them. This is your ultimate championship—every decision you make today is a step toward your dream. Stay dedicated, stay disciplined, and remember: the best is yet to come!',
];

class TipsScreen extends StatelessWidget {
  const TipsScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: LayoutProvider(
        backgroundColor: theme.colorScheme.background,
        responseWidget: Scaffold(
          appBar: _buildTopAppBar(context),
          body: Container(
            width: double.maxFinite,
            padding: EdgeInsets.symmetric(
              horizontal: 14.h,
              vertical: 20.v,
            ),
            child: Column(
              children: [_buildContentSection(context), SizedBox(height: 4.v)],
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildTopAppBar(BuildContext context) {
    return CustomAppBar(
      centerTitle: true,
      title: AppbarTitle(
        text: "lbl_tips".tr,
      ),
    );
  }

  /// Section Widget
  Widget _buildAdviceSection(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(
        horizontal: 14.h,
        vertical: 2.v,
      ),
      child: Stack(
        children: [
          RotatedBox(
            quarterTurns: 2,
            child: CustomImageView(
              imagePath: ImageConstant.imgGroup9,
              height: 600.v,
              width: double.maxFinite,
              fit: BoxFit.fill,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 50.v),
            child: CustomImageView(
              imagePath: ImageConstant.imgImage360x358,
              height: 360.v,
              margin: EdgeInsets.symmetric(horizontal: 20.adaptSize),
              width: double.maxFinite,
            ),
          ),
          Positioned(
            bottom: 30.v,
            left: 10,
            right: 10,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "lbl_advice_for_you".tr,
                  style: CustomTextStyles.headlineLargeGray90002,
                ),
                SizedBox(height: 4.v),
                Text(
                  list.elementAt(Random().nextInt(13)),
                  style: theme.textTheme.bodySmall!.copyWith(
                    color: appTheme.gray50001,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildContentSection(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: Column(
        children: [
          _buildAdviceSection(context),
        ],
      ),
    );
  }
}

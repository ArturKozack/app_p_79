import 'package:app_p_79/core/app_export.dart';
import 'package:app_p_79/core/utils/app_repo.dart';
import 'package:app_p_79/core/widgets/app_bar/appbar_leading_circleimage.dart';
import 'package:app_p_79/core/widgets/app_bar/appbar_title.dart';
import 'package:app_p_79/core/widgets/app_bar/custom_app_bar.dart';

import 'package:app_p_79/data/credit.dart';
import 'package:app_p_79/data/enums.dart';
import 'package:app_p_79/presentation/add_budget_for_categories_page/add_budget_for_categories_page.dart';
import 'package:flutter/material.dart';

class BudgetTabContainerScreen extends StatefulWidget {
  final CreditModel? model;

  const BudgetTabContainerScreen({Key? key, this.model})
      : super(
          key: key,
        );

  @override
  BudgetTabContainerScreenState createState() =>
      BudgetTabContainerScreenState();
  static Widget builder({
    required BuildContext context,
    CreditModel? model,
  }) {
    return BudgetTabContainerScreen(
      model: model,
    );
  }
}

class BudgetTabContainerScreenState extends State<BudgetTabContainerScreen>
    with TickerProviderStateMixin {
  late TabController tabviewController;

  @override
  void initState() {
    super.initState();
    tabviewController = TabController(length: 2, vsync: this);

    tabviewController.addListener(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _buildTopAppBar(context),
        body: Column(
          children: [
            SizedBox(height: 20.adaptSize),
            _buildEarnedSpendColumn(context),
            Expanded(
              child: SingleChildScrollView(
                child: SizedBox(
                  height: 712.v,
                  width: double.maxFinite,
                  child: TabBarView(
                    controller: tabviewController,
                    children: [
                      AddBudgetForCategoriesPage(
                        model: widget.model,
                      ),
                      AddBudgetForCategoriesPage(
                        model: widget.model,
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildTopAppBar(BuildContext context) {
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
          onTapArrowleftone(context);
        },
      ),
      centerTitle: true,
      title: AppbarTitle(
        text: "Add budget for categories",
      ),
    );
  }

  /// Section Widget
  Widget _buildTabview(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: appTheme.whiteA700,
        borderRadius: BorderRadius.circular(
          5.h,
        ),
      ),
      height: 48.v,
      width: double.maxFinite,
      child: TabBar(
        controller: tabviewController,
        onTap: (value) {
          Get.find<AppRepository>().settypeBudOfCredit(
            Get.find<AppRepository>().typeBudOfCredit == TypeOfCredit.Earned
                ? TypeOfCredit.Spend
                : TypeOfCredit.Earned,
          );

          setState(() {});
        },
        labelPadding: EdgeInsets.zero,
        labelColor: theme.colorScheme.primaryContainer,
        labelStyle: TextStyle(
          fontSize: 16.fSize,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w400,
        ),
        unselectedLabelColor: appTheme.gray90002,
        unselectedLabelStyle: TextStyle(
          fontSize: 16.fSize,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w400,
        ),
        indicatorSize: TabBarIndicatorSize.tab,
        indicator: BoxDecoration(
          color: appTheme.teal900,
          borderRadius: BorderRadius.circular(
            5.h,
          ),
        ),
        dividerHeight: 0.0,
        tabs: [
          Tab(
            child: Container(
              width: 186.h,
              padding: EdgeInsets.symmetric(
                horizontal: 68.h,
                vertical: 14.v,
              ),
              child: Text(
                "lbl_earned".tr,
                maxLines: null,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          Tab(
            child: Container(
              width: 182.h,
              padding: EdgeInsets.symmetric(
                horizontal: 68.h,
                vertical: 14.v,
              ),
              child: Text(
                "lbl_spend".tr,
                maxLines: null,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          )
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildEarnedSpendColumn(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.symmetric(horizontal: 14.h),
      child: Column(
        children: [_buildTabview(context)],
      ),
    );
  }

  /// Navigates to the previous screen.
  onTapArrowleftone(BuildContext context) {
    Get.back();
  }
}

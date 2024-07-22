import 'package:app_p_79/core/app_export.dart';
import 'package:app_p_79/core/widgets/app_bar/appbar_leading_circleimage.dart';

import 'package:app_p_79/core/widgets/app_bar/appbar_title.dart';
import 'package:app_p_79/core/widgets/app_bar/custom_app_bar.dart';
import 'package:app_p_79/core/widgets/event_listener.dart';
import 'package:app_p_79/presentation/home_screen/widgets/transactionslist_item_widget.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends EventListener {
   DetailsScreen({Key? key})
      ;

  @override
  Widget body(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(),
        body: SizedBox(
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
        text: "lbl_detailed_view".tr,
      ),
    );
  }

  onTapContainerone() {
    Get.back();
  }
}

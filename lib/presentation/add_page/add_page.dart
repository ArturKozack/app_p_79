import 'package:app_p_79/core/app_export.dart';
import 'package:app_p_79/core/utils/app_repo.dart';
import 'package:app_p_79/core/utils/extensions.dart';
import 'package:app_p_79/core/utils/input_format.dart';
import 'package:app_p_79/core/widgets/custom_drop_down.dart';
import 'package:app_p_79/core/widgets/custom_elevated_button.dart';
import 'package:app_p_79/core/widgets/custom_image_view.dart';
import 'package:app_p_79/core/widgets/custom_text_form_field.dart';
import 'package:app_p_79/data/credit.dart';
import 'package:app_p_79/data/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AddPage extends GetWidget<AppRepository> {
  final CreditModel? model;

  const AddPage({Key? key, this.model})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppRepository>(
      init: controller,
      builder: (controllerrr) => Container(
        width: double.maxFinite,
        padding: EdgeInsets.symmetric(
          horizontal: 14.h,
          vertical: 20.v,
        ),
        decoration: AppDecoration.background,
        child: _buildMainContent(context),
      ),
    );
  }

  /// Section Widget
  Widget _buildPaymentDateSection(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "lbl_date_of_payment".tr,
            style: CustomTextStyles.bodyLargeGray50001,
          ),
          SizedBox(height: 8.v),
          InkWell(
            borderRadius: BorderRadiusStyle.roundedBorder20,
            onTap: () => showDatePicker(
                    context: context,
                    currentDate: controller.timecreateAt,
                    firstDate: DateTime.now().subtract(Duration(days: 600)),
                    lastDate: DateTime.now().add(Duration(days: 600)))
                .then(
              (value) => controller.setTime(
                value ?? DateTime.now(),
              ),
            ),
            child: Container(
              padding: EdgeInsets.all(8.h),
              decoration: AppDecoration.outlineBlack.copyWith(
                borderRadius: BorderRadiusStyle.roundedBorder20,
              ),
              width: double.maxFinite,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 108.h),
                    child: Text(
                      controller.timecreateAt.formatFull(),
                      style: theme.textTheme.titleMedium,
                    ),
                  ),
                  CustomImageView(
                    imagePath: ImageConstant.imgLeadingIcon,
                    height: 48.adaptSize,
                    width: 48.adaptSize,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildCategorySection(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "lbl_category".tr,
            style: CustomTextStyles.bodyLargeGray50001,
          ),
          SizedBox(height: 8.v),
          CustomDropDown(
            suffixAssetName: ImageConstant.imgIconarrow,
            onItemPicked: (value) =>
                controller.typeOfCredit == TypeOfCredit.Earned
                    ? controller.setearnedCategory(value as EarnedCategory)
                    : controller.setspendCategory(value as SpendCategory),
            selectedItem: controller.typeOfCredit == TypeOfCredit.Earned
                ? controller.earnedCategory
                : controller.spendCategory,
            items: controller.typeOfCredit == TypeOfCredit.Earned
                ? EarnedCategory.values
                : SpendCategory.values,
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildInformationSection(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: Column(
        children: [
          SizedBox(
            width: double.maxFinite,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: CustomTextFormField(
                    controller: controller.amountTextFieldController,
                    focusNode: controller.amountFocusNode,
                    hintText: "lbl_amount".tr,
                    inputFormatters: [
                      ThousandsFormatter(),
                      LengthLimitingTextInputFormatter(7),
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    hintStyle: CustomTextStyles.titleMediumGray50002,
                    textInputAction: TextInputAction.done,
                  ),
                ),
                SizedBox(width: 10.h),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 30.h,
                    vertical: 20.v,
                  ),
                  decoration: AppDecoration.layer3.copyWith(
                    borderRadius: BorderRadiusStyle.roundedBorder20,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "lbl_usd".tr,
                        style: theme.textTheme.titleMedium,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 22.v),
          _buildPaymentDateSection(context),
          SizedBox(height: 22.v),
          _buildCategorySection(context),
          SizedBox(height: 22.v),
          CustomElevatedButton(
            onPressed: () => Get.toNamed(AppRoutes.addBudgetScreen,
                arguments: {'model': controller.userBox.get('user')!.credit}),
            text: "msg_add_budget_for_categories".tr,
          )
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildAddButton(BuildContext context) {
    return CustomElevatedButton(
      text: "lbl_add".tr,
      onPressed: () => controller.addTransaction(),
      isDisabled: !controller.isTextButtonEnabled,
      margin: EdgeInsets.symmetric(horizontal: 4.h),
      buttonStyle: CustomButtonStyles.fillPrimary,
    );
  }

  /// Section Widget
  Widget _buildMainContent(BuildContext context) {
    return Column(
      children: [
        _buildInformationSection(context),
        Spacer(),
        _buildAddButton(context)
      ],
    );
  }
}

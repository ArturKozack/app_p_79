import 'package:app_p_79/core/utils/app_repo.dart';
import 'package:app_p_79/core/widgets/custom_elevated_button.dart';
import 'package:app_p_79/data/credit.dart';
import 'package:app_p_79/data/enums.dart';
import 'package:app_p_79/presentation/add_budget_for_categories_page/widgets/addinformationsection_item_widget.dart';
import 'package:flutter/material.dart';
import '../../core/app_export.dart';

class AddBudgetForCategoriesPage extends GetWidget<AppRepository> {
  final CreditModel? model;

  const AddBudgetForCategoriesPage({Key? key, this.model})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.adaptSize),
        child: _buildMainContent(context));
  }

  /// Section Widget
  Widget _buildAddInformationSection(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: GetBuilder<AppRepository>(
        builder: (controlerr) {
          return ListView.separated(
            itemCount:
                Get.find<AppRepository>().typeBudOfCredit == TypeOfCredit.Earned
                    ? EarnedCategory.values.length
                    : SpendCategory.values.length,
            separatorBuilder: (context, index) => SizedBox(
              height: 8.v,
            ),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return AddinformationsectionItemWidget(
                Get.find<AppRepository>().typeBudOfCredit == TypeOfCredit.Earned
                    ? EarnedCategory.values.elementAt(index)
                    : SpendCategory.values.elementAt(index),
                    amount:    Get.find<AppRepository>().typeBudOfCredit == TypeOfCredit.Earned
                    ? model!.getValueErn(EarnedCategory.values.elementAt(index)): model!.getValueSpend(SpendCategory.values.elementAt(index),),
                onChanged: (p0) {
                  Get.find<AppRepository>().typeBudOfCredit ==
                          TypeOfCredit.Earned
                      ? Get.find<AppRepository>().setEarB(index, p0)
                      : Get.find<AppRepository>().setSpendB(index, p0);
                },
              );
            },
          );
        },
      ),
    );
  }

  /// Section Widget
  Widget _buildSaveButton(BuildContext context) {
    return CustomElevatedButton(
      text: "lbl_save".tr,
      onPressed: () => controller.saveBudget(),
      margin: EdgeInsets.symmetric(horizontal: 4.h),
      buttonStyle: CustomButtonStyles.fillPrimaryTL10,
    );
  }

  /// Section Widget
  Widget _buildMainContent(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 20.adaptSize,
        ),
        _buildAddInformationSection(context),
        Spacer(),
        _buildSaveButton(context)
      ],
    );
  }
}

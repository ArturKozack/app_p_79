import 'package:app_p_79/core/utils/extensions.dart';
import 'package:app_p_79/core/widgets/custom_icon_button.dart';
import 'package:app_p_79/core/widgets/custom_image_view.dart';
import 'package:app_p_79/data/credit.dart';
import 'package:app_p_79/data/enums.dart';
import 'package:flutter/material.dart';
import '../../../core/app_export.dart';

class TransactionslistItemWidget extends StatelessWidget {
  TransactionslistItemWidget(this.model, {Key? key})
      : super(
          key: key,
        );

  final TransactionModel model;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.h),
      decoration: AppDecoration.layer2.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder10,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomIconButton(
            height: 48.adaptSize,
            width: 48.adaptSize,
            padding: EdgeInsets.all(12.h),
            child: CustomImageView(
              imagePath:
                  model.earnedCategory?.icon ?? model.spendCategory!.icon,
            ),
          ),
          SizedBox(width: 10.h),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  model.earnedCategory?.title ?? model.spendCategory!.title,
                  style: theme.textTheme.titleMedium,
                ),
                Text(
                  model.editTime.format(),
                  style: theme.textTheme.bodyMedium,
                )
              ],
            ),
          ),
          SizedBox(width: 10.h),
          Text(
            '${model.type == TypeOfCredit.Earned ? '+' : '-'} ${model.amount.format.currencyFormat}',
            style: model.type == TypeOfCredit.Spend
                ? CustomTextStyles.titleSmallRed
                : CustomTextStyles.titleSmallTeal900,
          )
        ],
      ),
    );
  }
}

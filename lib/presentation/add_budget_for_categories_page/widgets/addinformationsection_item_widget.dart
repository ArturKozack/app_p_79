import 'package:app_p_79/core/utils/app_repo.dart';
import 'package:app_p_79/core/utils/input_format.dart';
import 'package:app_p_79/core/widgets/custom_text_form_field.dart';
import 'package:app_p_79/data/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../core/app_export.dart';

class AddinformationsectionItemWidget extends StatelessWidget {
  AddinformationsectionItemWidget(this.value, {Key? key, this.onChanged})
      : super(
          key: key,
        );

  final Enum value;

  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    final ert = Get.find<AppRepository>().typeBudOfCredit == TypeOfCredit.Earned
        ? value as EarnedCategory
        : value as SpendCategory;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: 131.adaptSize,
          height: 66.adaptSize,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.adaptSize),
            color: appTheme.teal900,
          ),
          child: Center(
            child: Text(
              ert is EarnedCategory
                  ? ert.title
                  : ert is SpendCategory
                      ? ert.title
                      : '',
              style: TextStyle(
                color: theme.colorScheme.primaryContainer,
                fontSize: 14.fSize,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
        SizedBox(
          width: 131.adaptSize,
          height: 66.adaptSize,
          child: CustomTextFormField(
            onChanged: onChanged,
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
        Container(
          width: 99.adaptSize,
          height: 66.adaptSize,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.adaptSize),
            color: theme.colorScheme.secondaryContainer,
          ),
          child: Center(
            child: Text(
              'USD',
              style: TextStyle(
                color: theme.colorScheme.primaryContainer,
                fontSize: 14.fSize,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

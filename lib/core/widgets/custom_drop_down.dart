// ignore_for_file: library_private_types_in_public_api, deprecated_member_use
import 'package:app_p_79/core/app_export.dart';
import 'package:app_p_79/core/utils/app_repo.dart';
import 'package:app_p_79/core/widgets/custom_image_view.dart';
import 'package:app_p_79/data/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mirai_dropdown_menu/mirai_dropdown_menu.dart';

class CustomDropDown extends StatefulWidget {
  final List<Enum> items;
  final Enum? selectedItem;
  final String? suffixAssetName;
  final void Function(Enum)? onItemPicked;
  final bool isLoading;

  const CustomDropDown({
    Key? key,
    required this.items,
    this.selectedItem,
    this.suffixAssetName,
    this.onItemPicked,
    this.isLoading = false,
  }) : super(key: key);

  @override
  _DropDownPickerState createState() => _DropDownPickerState();
}

class _DropDownPickerState extends State<CustomDropDown> {
  static const _iconSize = 12.0;
  final list = <Enum>[];

  @override
  void initState() {
    super.initState();

    list.addAll(widget.items);

    list.remove(widget.selectedItem);
  }

  @override
  void didUpdateWidget(covariant CustomDropDown oldWidget) {
    list.clear();
    list.addAll(widget.items);
    list.remove(widget.selectedItem);

    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    list.clear();
    list.addAll(widget.items);

    super.dispose();
  }

  Widget _getSufixIcon() {
    return Padding(
      padding: const EdgeInsets.only(right: 10.0),
      child: RotatedBox(
        quarterTurns: 0,
        child: SvgPicture.asset(
          widget.suffixAssetName!,
          height: _iconSize.v,
          width: _iconSize.h,
          color: theme.colorScheme.onPrimary,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _getBodyWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0),
      child: CustomDropDownItemWidget(
        item: widget.selectedItem,
        isSelected: false,
        isForced: true,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MiraiPopupMenu(
      key: UniqueKey(),
      itemWidgetBuilder: (int index, item) => CustomDropDownItemWidget(
        item: item!,
        isSelected: item == widget.selectedItem,
        isForced: false,
      ),
      onChanged: widget.onItemPicked,
      children: list,
      mode: MiraiPopupMenuMode.dropDownMenu,
      decoration: AppDecoration.outlineBlack.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder20,
      ),
      showSeparator: false,
      space: 0.h,
      child: Container(
        key: GlobalKey(),
        height: 66.h,
        width: double.maxFinite,
        decoration: AppDecoration.outlineBlack.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder20,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _getBodyWidget(context),
            const Spacer(),
            _getSufixIcon(),
          ],
        ),
      ),
    );
  }
}

class CustomDropDownItemWidget extends StatelessWidget {
  final Enum? item;
  final bool isSelected;
  final bool isForced;

  const CustomDropDownItemWidget({
    super.key,
    required this.item,
    required this.isSelected,
    required this.isForced,
  });

  @override
  Widget build(BuildContext context) {
    Enum? ert;
    if (item != null) {
      ert = Get.find<AppRepository>().typeOfCredit == TypeOfCredit.Earned
          ? item! as EarnedCategory
          : item! as SpendCategory;
    }

    return Container(
      width: 352.adaptSize,
      margin: EdgeInsets.only(
        bottom: isForced ? 0 : 4.adaptSize,
        top: isForced ? 0 : 4.adaptSize,
      ),
      decoration: BoxDecoration(
          color: isForced
              ? theme.colorScheme.onPrimaryContainer
              : appTheme.gray900,
          borderRadius: BorderRadius.circular(10.adaptSize)),
      padding: EdgeInsets.symmetric(
        vertical: isForced ? 10 : 14.0,
      ),
      child: Row(
        children: [
          if (!isForced)
            SizedBox(
              width: 8.adaptSize,
            ),
          if (!isForced)
            Container(
              height: 48.adaptSize,
              width: 48.adaptSize,
              decoration: AppDecoration.outlineBlack.copyWith(
                borderRadius: BorderRadiusStyle.roundedBorder10,
              ),
              child: Center(
                child: CustomImageView(
                  imagePath: ert is EarnedCategory
                      ? ert.icon
                      : ert is SpendCategory
                          ? ert.icon
                          : null,
                ),
              ),
            ),
          if (!isForced)
            SizedBox(
              width: 8.adaptSize,
            ),
          Text(
            ert is EarnedCategory
                ? ert.title
                : ert is SpendCategory
                    ? ert.title
                    : null ?? "lbl_category".tr,
            style: theme.textTheme.titleMedium,
          ),
        ],
      ),
    );
  }
}

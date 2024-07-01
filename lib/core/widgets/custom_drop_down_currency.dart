// ignore_for_file: library_private_types_in_public_api, deprecated_member_use

import 'package:app_p_79/core/app_export.dart';
import 'package:app_p_79/data/enums.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:mirai_dropdown_menu/mirai_dropdown_menu.dart';

class CustomDropDownCurrency extends StatefulWidget {
  final List<Currency> items;
  final Currency? selectedItem;
  final String? suffixAssetName;
  final void Function(Currency)? onItemPicked;
  final bool isLoading;

  const CustomDropDownCurrency({
    Key? key,
    required this.items,
    required this.selectedItem,
    this.suffixAssetName,
    this.onItemPicked,
    this.isLoading = false,
  }) : super(key: key);

  @override
  _DropDownPickerState createState() => _DropDownPickerState();
}

class _DropDownPickerState extends State<CustomDropDownCurrency> {
  static const _iconSize = 12.0;
  final list = <Currency>[];

  @override
  void initState() {
    super.initState();

    list.addAll(widget.items);

    list.remove(widget.selectedItem);
  }

  @override
  void didUpdateWidget(covariant CustomDropDownCurrency oldWidget) {
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
      padding: EdgeInsets.only(right: 10.0.fSize),
      child: RotatedBox(
        quarterTurns: 2,
        child: SvgPicture.asset(
          widget.suffixAssetName!,
          height: _iconSize.v,
          width: _iconSize.h,
          color: Colors.black,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _getBodyWidget(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 10.0.fSize),
      child: CustomDropDownItemWidget(
        item: widget.selectedItem,
        isSelected: false,
        isForced: true,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final radius = const BorderRadius.all(
      Radius.circular(0),
    );

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
      decoration: BoxDecoration(
        borderRadius: radius,
        color: appTheme.gray500,
      ),
      showSeparator: false,
      space: 0.h,
      child: Container(
        key: GlobalKey(),
        height: 46.v,
        width: double.maxFinite,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            const Radius.circular(100),
          ),
          color: appTheme.gray500,
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
  final Currency? item;
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
    return Container(
      decoration: BoxDecoration(
          color: isForced ? appTheme.gray500 : appTheme.gray500,
          border: Border.all(
            color: appTheme.gray500,
          )),
      padding: EdgeInsets.symmetric(
        vertical: isForced ? 10.fSize : 14.0.fSize,
      ),
      child: Text(
        item?.name.toString() ?? 'Select',
        style: theme.textTheme.bodyMedium!.copyWith(color: appTheme.black900),
      ),
    );
  }
}

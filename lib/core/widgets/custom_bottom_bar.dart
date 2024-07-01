// ignore_for_file: constant_identifier_names

import 'package:app_p_79/core/app_export.dart';
import 'package:app_p_79/core/widgets/custom_image_view.dart';

import 'package:flutter/material.dart';

class CustomBottomBar extends StatefulWidget {
  const CustomBottomBar({
    super.key,
    this.onChanged,
    required this.selectedIndex,
  });

  final int selectedIndex;

  final Function(BottomBarEnum)? onChanged;

  @override
  State<CustomBottomBar> createState() => _CustomBottomBarState();
}

class _CustomBottomBarState extends State<CustomBottomBar> {
  final RxInt selectedIndex = 0.obs;

  List<BottomMenuModel> bottomMenuList = [
    BottomMenuModel(
      icon: ImageConstant.imgIconActionShoppingCart,
      activeIcon: ImageConstant.imgIconActionShoppingCart,
      title: "lbl_home".tr,
      type: BottomBarEnum.Home,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgStarFill,
      activeIcon: ImageConstant.imgStarFill,
      title: "lbl_calculator".tr,
      type: BottomBarEnum.Star,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgIconActionSettings,
      activeIcon: ImageConstant.imgIconActionSettings,
      title: "lbl_settings".tr,
      type: BottomBarEnum.Settings,
    )
  ];

  @override
  void initState() {
    selectedIndex.value = widget.selectedIndex;
    super.initState();
  }

  @override
  void didUpdateWidget(covariant CustomBottomBar oldWidget) {
    selectedIndex.value = widget.selectedIndex;
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.v,
      decoration: BoxDecoration(
        color: appTheme.gray90001,
      ),
      child: Obx(
        () => BottomNavigationBar(
          backgroundColor: Colors.transparent,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedFontSize: 0,
          elevation: 0,
          currentIndex: selectedIndex.value,
          type: BottomNavigationBarType.fixed,
          items: List.generate(bottomMenuList.length, (index) {
            return BottomNavigationBarItem(
              icon: CustomImageView(
                imagePath: bottomMenuList[index].icon,
                height: 34.adaptSize,
                width: 34.adaptSize,
                color: theme.colorScheme.primaryContainer.withOpacity(.5),
              ),
              activeIcon: CustomImageView(
                imagePath: bottomMenuList[index].activeIcon,
                height: 34.adaptSize,
                width: 34.adaptSize,
                color: theme.colorScheme.primaryContainer,
              ),
              label: '',
            );
          }),
          onTap: (index) {
            selectedIndex.value = index;
            widget.onChanged?.call(bottomMenuList[index].type);
          },
        ),
      ),
    );
  }
}

enum BottomBarEnum { Home, Star, Settings }

class BottomMenuModel {
  BottomMenuModel({
    required this.icon,
    required this.activeIcon,
    this.title,
    required this.type,
  });

  String icon;

  String activeIcon;

  String? title;

  BottomBarEnum type;
}

class DefaultWidget extends StatelessWidget {
  const DefaultWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(10),
      child: const Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Please replace the respective Widget here',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

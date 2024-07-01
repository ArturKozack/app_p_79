import 'package:app_p_79/core/utils/app_repo.dart';

import 'package:app_p_79/core/widgets/custom_bottom_bar.dart';
import 'package:app_p_79/presentation/home_screen/home_screen.dart';

import 'package:app_p_79/presentation/settings_page/settings_page.dart';
import 'package:app_p_79/presentation/tips_screen/tips_screen.dart';
import 'package:flutter/material.dart';

import '../../core/app_export.dart';

// ignore_for_file: must_be_immutable
class RootScreen extends GetWidget<AppRepository> {
  RootScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SafeArea(
        child: Scaffold(
          body: IndexedStack(
            index: controller.currentIndex.value.index,
            children: [
              HomeScreen(),
              TipsScreen(),
              SettingsPage(),
            ],
          ),
          bottomNavigationBar: _buildBottomBar(context),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildBottomBar(BuildContext context) {
    return CustomBottomBar(
      onChanged: (p0) => controller.updateTab(
        index: p0,
      ),
      selectedIndex: controller.currentIndex.value.index,
    );
  }
}

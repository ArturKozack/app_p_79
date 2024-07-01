import 'package:app_p_79/presentation/add_tab_container_screen/add_tab_container_screen.dart';
import 'package:app_p_79/presentation/budget_tab_container_screen/budget_tab_container_screen.dart';
import 'package:app_p_79/presentation/terms_of_use_screen/terms_of_use_screen.dart';

import '../core/app_export.dart';

import '../presentation/onboarding_one_screen/onboarding_one_screen.dart';
import '../presentation/privacy_policy_screen/privacy_policy_screen.dart';
import '../presentation/proleader_screen/proleader_screen.dart';
import '../presentation/root_screen/root_screen.dart'; // ignore_for_file: must_be_immutable

class AppRoutes {
  static const String proleaderScreen = '/proleader_screen';
  static const String onboardingOneScreen = '/onboarding_one_screen';
  static const String rootScreen = '/root_screen';
  static const String privacyPolicyScreen = '/privacy_policy_screen';
  static const String termsOfUseScreen = '/terms_screen';
  static const String addScreen = '/add_screen';
  static const String addBudgetScreen = '/add_budget_screen';

  static const String initialRoute = '/initialRoute';

  static List<GetPage> pages = [
    GetPage(
      name: onboardingOneScreen,
      page: () => OnboardingOneScreen(),
    ),
    GetPage(
      name: rootScreen,
      page: () => RootScreen(),
    ),
    GetPage(
      name: termsOfUseScreen,
      page: () => TermsOfUseScreen(),
    ),
    GetPage(
      name: addBudgetScreen,
      page: () => BudgetTabContainerScreen(
          model: Get.arguments != null ? Get.arguments['model'] : null),
    ),
    GetPage(
      name: addScreen,
      page: () => AddTabContainerScreen(
          model: Get.arguments != null ? Get.arguments['model'] : null),
    ),
    GetPage(
      name: privacyPolicyScreen,
      page: () => PrivacyPolicyScreen(),
    ),
    GetPage(
      name: initialRoute,
      page: () => ProleaderScreen(),
    )
  ];
}

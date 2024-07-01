import 'dart:io';

import 'package:app_p_79/core/utils/app_repo.dart';
import 'package:app_p_79/core/utils/pref.dart';
import 'package:app_p_79/data/credit.dart';
import 'package:app_p_79/data/enums.dart';
import 'package:app_p_79/data/user_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:layout_manager/layout_manager.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'core/app_export.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  AppPref().init();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then((value) async {
    Get.lazyPut(() => AppRepository());

    await Hive.initFlutter();
    Hive.registerAdapter(UserModelAdapter(), override: true);
    Hive.registerAdapter(CurrencyAdapter(), override: true);
    Hive.registerAdapter(TypeOfCreditAdapter(), override: true);
    Hive.registerAdapter(EarnedCategoryAdapter(), override: true);
    Hive.registerAdapter(SpendCategoryAdapter(), override: true);
    Hive.registerAdapter(CreditModelAdapter(), override: true);
    Hive.registerAdapter(TransactionModelAdapter(), override: true);
    await Hive.openBox<UserModel>(
      'user',
    );

    await LayoutManager.instance.initPlugin(
      firebaseEnabled: Platform.isIOS ? true : false,
      firebaseRemoteEnabled: Platform.isIOS ? true : false,
      parseEnabled: Platform.isIOS ? false : false,
      parseRemoteEnabled: Platform.isIOS ? false : false,
    );

    await OneSignal.shared
        .setAppId(Platform.isIOS ? '1ce5e814-f973-4803-8f52-b4ced53541b7' : '');

    Logger.init(kReleaseMode ? LogMode.live : LogMode.debug);
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: theme,
        translations: AppLocalization(),
        locale: Get.deviceLocale,
        fallbackLocale: Locale('en', 'US'),
        initialRoute: AppRoutes.initialRoute,
        getPages: AppRoutes.pages,
      );
    });
  }
}

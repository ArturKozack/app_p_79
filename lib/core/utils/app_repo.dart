// ignore_for_file: use_build_context_synchronously

import 'dart:async';
import 'dart:io';

import 'package:app_p_79/core/app_export.dart';
import 'package:app_p_79/core/utils/controller_base.dart';
import 'package:app_p_79/core/utils/extensions.dart';

import 'package:app_p_79/core/utils/pref.dart';
import 'package:app_p_79/core/widgets/custom_bottom_bar.dart';
import 'package:app_p_79/data/credit.dart';
import 'package:app_p_79/data/enums.dart';

import 'package:app_p_79/data/user_model.dart';
import 'package:app_p_79/presentation/home_screen/home2_dialog.dart';
import 'package:flutter/foundation.dart';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:flutter_image_compress/flutter_image_compress.dart';

class ImageHelper {
  static Future<Uint8List?> compressImage(File image) async {
    return await FlutterImageCompress.compressWithFile(
      image.absolute.path,
      minHeight: 1280,
      minWidth: 1980,
      quality: 40,
    );
  }
}

class AppRepository extends ControllerBase with GetTickerProviderStateMixin {
  bool isStarted = false;

  Box<UserModel> userBox = Hive.box<UserModel>('user');

  Rx<BottomBarEnum> currentIndex = BottomBarEnum.Star.obs;

  Rx<Currency> currency = Currency.EUR.obs;

// //credit

  DateTime timecreateAt = DateTime.now();

  TypeOfCredit typeOfCredit = TypeOfCredit.Earned;
  TypeOfCredit typeBudOfCredit = TypeOfCredit.Earned;

  EarnedCategory? earnedCategory;

  SpendCategory? spendCategory;

  Map<int, double> earList = {
    0: 0,
    1: 0,
    2: 0,
    3: 0,
  };

  Map<int, double> spendList = {
    0: 0,
    1: 0,
    2: 0,
    3: 0,
    4: 0,
    5: 0,
    6: 0,
    7: 0,
  };

  final amountTextFieldController = TextEditingController();
  final amountFocusNode = FocusNode();

  bool get isTextButtonEnabled =>
      amountTextFieldController.text.trim().isNotEmpty &&
      (earnedCategory != null || spendCategory != null);

  void setTime(DateTime time) {
    timecreateAt = time;

    update();
  }

  void setEarB(int index, String value) {
    earList.update(index, (a) => value.numberFormat);

    update();
  }

  void setSpendB(int index, String value) {
    spendList.update(index, (a) => value.numberFormat);

    update();
  }

  void setearnedCategory(EarnedCategory time) {
    earnedCategory = time;

    update();
  }

  void setspendCategory(SpendCategory time) {
    spendCategory = time;

    update();
  }

  void settypeOfCredit(TypeOfCredit time) {
    typeOfCredit = time;
    earnedCategory = null;
    spendCategory = null;

    timecreateAt = DateTime.now();

    amountTextFieldController.clear();

    update();
  }

  void settypeBudOfCredit(TypeOfCredit time) {
    typeBudOfCredit = time;

    update();
  }

  void clearCalculator() {
    earnedCategory = null;
    spendCategory = null;
    typeOfCredit = TypeOfCredit.Earned;

    timecreateAt = DateTime.now();

    amountTextFieldController.clear();

    update();


  }

  Future<void> addTransaction() async {
    final user = userBox.get('user')!;

    user.credit.transaction.add(
      TransactionModel(
        type: typeOfCredit,
        editTime: timecreateAt,
        earnedCategory: earnedCategory,
        spendCategory: spendCategory,
        id: timecreateAt.toIso8601String(),
        amount: amountTextFieldController.text.trim().numberFormat,
      ),
    );

    await userBox.put('user', user);


    // Get.dialog(Home2Dialog(name: earnedCategory?.name ?? spendCategory!.name));

    clearCalculator();

    // Get.back();
  }

  Future<void> saveBudget() async {
    final user = userBox.get('user')!;

    final credit = user.credit.copyWith(
      earlSalary: earList[0]!.toInt(),
      earlBonuses: earList[1]!.toInt(),
      earlCredit: earList[2]!.toInt(),
      earlOther: earList[3]!.toInt(),
      spendFood: spendList[0]!.toInt(),
      spendentr: spendList[1]!.toInt(),
      spendHousing: spendList[2]!.toInt(),
      spendTrips: spendList[3]!.toInt(),
      spendTransport: spendList[4]!.toInt(),
      spendCloth: spendList[5]!.toInt(),
      spendCredit: spendList[6]!.toInt(),
      spendother: spendList[7]!.toInt(),
    );

    await userBox.put('user', user.copyWith(times: credit));
    typeBudOfCredit = TypeOfCredit.Earned;

    update();
    Get.back();
  }

  Future<void> deleteCredit(CreditModel model) async {
    final user = userBox.get('user')!;

    await userBox.put('user', user.copyWith(times: null));

    update();

    Get.back();
  }

  @override
  Future<void> onInit() async {
    await init(Get.context!);

    super.onInit();
  }

  @override
  Future<void> init(BuildContext context) async {
    if (userBox.isEmpty) {
      await userBox.put('user', UserModel.newUser());
    }

    update();

    if (isStarted) {
      return;
    }
    isStarted = true;
    await super.init(context);

    String? currencyRaw = AppPref.getString('currency');

    if (currencyRaw == null) {
      currency.value = Currency.EUR;

      update();

      await AppPref.setString('currency', currency.value.name);

      currencyRaw = currency.value.name;
    }

    currency.value =
        Currency.values.singleWhere((element) => element.name == currencyRaw);

    update();

    amountFocusNode.addListener(() {
      update();
    });

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Timer(
        const Duration(seconds: 10),
        () {
          // showDialog<String>(
          //   context: context,
          //   builder: (_) => OfferDiaolgDialog(),
          // );
        },
      );
    });
  }

  void updateTab({
    required BottomBarEnum index,
  }) {
    currentIndex.value = index;

    update();
  }

  Future<void> updateGlobalCurrency(Currency currencyIndex) async {
    currency.value = currencyIndex;

    await AppPref.setString(currency.value.name, 'currency');

    update();
  }

  Future<void> delete() async {
    await userBox.clear();
    await userBox.put('user', UserModel.newUser());
    currency.value = Currency.EUR;

    await AppPref.setString(currency.value.name, 'currency');

    update();
    updateTab(index: BottomBarEnum.Star);
    Get.toNamed(AppRoutes.onboardingOneScreen);
  }
}

// ignore_for_file: constant_identifier_names

import 'package:app_p_79/core/app_export.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'enums.g.dart';

@HiveType(typeId: 4)
enum Currency {
  @HiveField(2)
  USD,
  @HiveField(1)
  EUR,
}

extension CurrencySymbol on Currency {
  String get title {
    switch (this) {
      case Currency.EUR:
        return '€';
      case Currency.USD:
        return '\$';
    }
  }
}

@HiveType(typeId: 5)
enum TypeOfCredit {
  @HiveField(2)
  Earned,
  @HiveField(1)
  Spend,
}

@HiveType(typeId: 6)
enum EarnedCategory {
  @HiveField(2)
  salary,
  @HiveField(1)
  food,
  @HiveField(0)
  credit,
  @HiveField(3)
  other,
}

extension EarnedCategorySymbol on EarnedCategory {
  String get title {
    switch (this) {
      case EarnedCategory.salary:
        return 'lbl_salary'.tr;
      case EarnedCategory.food:
        return 'lbl_food'.tr;
      case EarnedCategory.credit:
        return 'lbl_credit'.tr;
      case EarnedCategory.other:
        return 'lbl_other'.tr;
    }
  }

  String get icon {
    switch (this) {
      case EarnedCategory.salary:
        return ImageConstant.imgIconActionAcc;
      case EarnedCategory.food:
        return ImageConstant.imgThumbsup;
      case EarnedCategory.credit:
        return ImageConstant.imgIconActionCreditCard;
      case EarnedCategory.other:
        return ImageConstant.imgIconActionAccountBalance;
    }
  }
}

@HiveType(typeId: 7)
enum SpendCategory {
  @HiveField(2)
  food,
  @HiveField(1)
  entertainment,
  @HiveField(0)
  housing,
  @HiveField(3)
  trips,
  @HiveField(4)
  transport,
  @HiveField(6)
  cloth,
  @HiveField(7)
  credit,
  @HiveField(8)
  other,
}

extension SpendCategorySymbol on SpendCategory {
  String get title {
    switch (this) {
      case SpendCategory.food:
        return 'lbl_food'.tr;
      case SpendCategory.entertainment:
        return 'lbl_entertainment'.tr;
      case SpendCategory.housing:
        return 'lbl_housing'.tr;
      case SpendCategory.trips:
        return 'lbl_trips'.tr;
      case SpendCategory.transport:
        return 'lbl_transport'.tr;
      case SpendCategory.cloth:
        return 'lbl_cloth'.tr;
      case SpendCategory.credit:
        return 'lbl_credit'.tr;
      case SpendCategory.other:
        return 'lbl_other'.tr;
    }
  }

  String get icon {
    switch (this) {
      case SpendCategory.food:
        return ImageConstant.imgThumbsup;
      case SpendCategory.entertainment:
        return ImageConstant.imgExperimentalHappy;
      case SpendCategory.housing:
        return ImageConstant.imgHomeHomeAltOutline;
      case SpendCategory.trips:
        return ImageConstant.imgIconMapsFlight;
      case SpendCategory.transport:
        return ImageConstant.imgIconNotificationDriveeta;
      case SpendCategory.cloth:
        return ImageConstant.imgIconActionPantool;
      case SpendCategory.credit:
        return ImageConstant.imgIconActionCreditCard;
      case SpendCategory.other:
        return ImageConstant.imgIconActionAccountBalance;
    }
  }
}

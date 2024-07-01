// ignore_for_file: constant_identifier_names, deprecated_member_use

import 'package:app_p_79/core/app_export.dart';
import 'package:app_p_79/core/utils/app_repo.dart';
import 'package:app_p_79/data/enums.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime {
  String format([
    String pattern = 'dd MMMM yyyy',
    String? locale,
  ]) {
    if (locale != null && locale.isNotEmpty) {
      initializeDateFormatting(locale);
    }
    return DateFormat(pattern, locale).format(this);
  }

  bool isSameDate(DateTime other) {
    return year == other.year && month == other.month && day == other.day;
  }

  String formatFull([
    String pattern = 'dd.MM.yyyy',
    String? locale,
  ]) {
    if (locale != null && locale.isNotEmpty) {
      initializeDateFormatting(locale);
    }
    return DateFormat(pattern, locale).format(this);
  }

  bool get isToday {
    final now = DateTime.now();
    final formatter = DateFormat.yMd();
    return formatter.format(this) == formatter.format(now);
  }
}

extension NumberFormatExtension on int {
  String get format {
    final formatter = NumberFormat('#,###');
    return formatter.format(this).replaceAll(',', ' ');
  }
}

extension DurationFormatExtension on Duration {
  String format() => this.toString().split('.').first.padLeft(8, "0");
}

extension StringFormatExtension on String {
  double get numberFormat {
    final replace = replaceAll(' ', '');
    return double.tryParse(replace) ?? 0;
  }

  String get currencyFormat {
    final replace = replaceAll(' ', '');
    final currency = Get.find<AppRepository>();
    return '${currency.currency.value.title} $replace';
  }

  String currencyFromFormat(Currency currency) {
    final replace = replaceAll(' ', '');

    return '${currency.title} $replace';
  }

  int get monthId {
    if (this == "lbl_january".tr) {
      return 1;
    }

    if (this == "lbl_february".tr) {
      return 2;
    }

    if (this == "lbl_march".tr) {
      return 3;
    }

    if (this == "lbl_april".tr) {
      return 4;
    }

    if (this == "lbl_may".tr) {
      return 5;
    }

    if (this == "lbl_june".tr) {
      return 6;
    }

    if (this == "lbl_july".tr) {
      return 7;
    }

    if (this == "lbl_august".tr) {
      return 8;
    }

    if (this == "lbl_september".tr) {
      return 9;
    }

    if (this == "lbl_october".tr) {
      return 10;
    }

    if (this == "lbl_november".tr) {
      return 11;
    }

    return 12;
  }
}

extension DoubleFormatExtention on double {
  String get format {
    final intPart = truncate();
    final index = toString().indexOf('.') + 1;
    String decimalPart = toString().substring(index);
    decimalPart = decimalPart.length > 2
        ? ',${decimalPart.substring(0, 2)}'
        : decimalPart == '0' || decimalPart == '00'
            ? ''
            : ',$decimalPart';

    return '${intPart.format}$decimalPart';
  }
}

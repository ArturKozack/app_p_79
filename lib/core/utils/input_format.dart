import 'package:app_p_79/core/utils/extensions.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class ThousandsFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (newValue.text.isEmpty) {
      return newValue;
    }

    final intValue = int.tryParse(newValue.text.replaceAll(' ', ''));
    if (intValue == null) {
      return oldValue;
    }

    final formatter = NumberFormat('#,###');
    final newText = formatter.format(intValue).replaceAll(',', ' ');

    return newValue.copyWith(
      text: newText,
      selection: TextSelection.collapsed(offset: newText.length),
    );
  }
}

class MaxValueValidator extends TextInputFormatter {
  final int maxValue;

  MaxValueValidator(this.maxValue);

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.isNotEmpty) {
      double enteredValue = newValue.text.numberFormat;
      if (enteredValue > maxValue) {
        return oldValue;
      }
    }
    return newValue;
  }
}

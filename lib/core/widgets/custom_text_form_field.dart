import 'package:app_p_79/core/app_export.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

extension TextFormFieldStyleHelper on CustomTextFormField {
  static OutlineInputBorder get outlineBlackTL20 => OutlineInputBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(
            20.h,
          ),
        ),
        borderSide: BorderSide.none,
      );
  static OutlineInputBorder get fillTeal => OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.h),
        borderSide: BorderSide.none,
      );
  static OutlineInputBorder get fillGray => OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.h),
        borderSide: BorderSide.none,
      );
  static OutlineInputBorder get fillOnPrimaryContainer => OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.h),
        borderSide: BorderSide.none,
      );
  static OutlineInputBorder get outlineBlackTL201 => OutlineInputBorder(
        borderRadius: BorderRadius.circular(20.h),
        borderSide: BorderSide.none,
      );
}

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    Key? key,
    this.alignment,
    this.width,
    this.controller,
    this.focusNode,
    this.autofocus = false,
    this.textStyle,
    this.onEditingComplete,
    this.decoration,
    this.obscureText = false,
    this.textInputAction = TextInputAction.done,
    this.textInputType = TextInputType.text,
    this.maxLines,
    this.hintText,
    this.hintStyle,
    this.textAlign,
    this.prefix,
    this.prefixConstraints,
    this.suffix,
    this.suffixConstraints,
    this.contentPadding,
    this.borderDecoration,
    this.fillColor,
    this.filled = true,
    this.validator,
    this.initialValue,
    this.onChanged,
    this.enabled = true,
    this.inputFormatters,
    this.errorText,
  }) : super(
          key: key,
        );

  final Alignment? alignment;

  final List<TextInputFormatter>? inputFormatters;

  final double? width;

  final TextEditingController? controller;

  final FocusNode? focusNode;

  final bool? autofocus;

  final TextStyle? textStyle;

  final bool? obscureText;

  final TextInputAction? textInputAction;

  final TextInputType? textInputType;

  final int? maxLines;

  final String? hintText;

  final String? initialValue;

  final TextStyle? hintStyle;

  final Widget? prefix;

  final BoxConstraints? prefixConstraints;

  final Widget? suffix;

  final BoxConstraints? suffixConstraints;

  final EdgeInsets? contentPadding;

  final InputBorder? borderDecoration;

  final Color? fillColor;

  final bool? enabled;

  final bool? filled;

  final TextAlign? textAlign;

  final InputDecoration? decoration;

  final FormFieldValidator<String>? validator;

  final String? errorText;
  final void Function(String)? onChanged;
  final void Function()? onEditingComplete;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.maxFinite,
      child: TextFormField(
        controller: controller,
        initialValue: initialValue,
        inputFormatters: inputFormatters,
        focusNode: focusNode ?? FocusNode(),
        autofocus: autofocus!,
        enabled: enabled,
        scrollPadding: EdgeInsets.only(
            bottom: MediaQuery.of(Get.context!).viewInsets.bottom),
        onTapOutside: (event) {
          if (focusNode != null) {
            focusNode?.unfocus();
          } else {
            FocusManager.instance.primaryFocus?.unfocus();
          }
        },
        style: textStyle ?? theme.textTheme.titleMedium,
        obscureText: obscureText!,
        textInputAction: textInputAction,
        keyboardType: textInputType,
        textAlign: textAlign ?? TextAlign.start,
        maxLines: maxLines ?? 1,
        decoration: decoration ?? decorationF,
        onChanged: onChanged,
        onEditingComplete: onEditingComplete,
      ),
    );
  }

  InputDecoration get decorationF => InputDecoration(
        hintText: hintText ?? "",
        hintStyle: hintStyle ?? theme.textTheme.titleMedium,
        prefixIcon: prefix,
        prefixIconConstraints: prefixConstraints,
        suffixIcon: suffix,
        suffixIconConstraints: suffixConstraints,
        isDense: true,
        contentPadding: contentPadding ??
            EdgeInsets.symmetric(
              horizontal: 8.h,
              vertical: 22.v,
            ),
        fillColor: fillColor ?? theme.colorScheme.onPrimaryContainer,
        filled: filled,
        border: borderDecoration ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.h),
              borderSide: BorderSide.none,
            ),
        enabledBorder: borderDecoration ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.h),
              borderSide: BorderSide.none,
            ),
        focusedBorder: borderDecoration ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.h),
              borderSide: BorderSide.none,
            ),
      );
}

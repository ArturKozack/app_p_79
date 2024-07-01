// ignore_for_file: use_build_context_synchronously

import 'dart:async';

import 'package:app_p_79/core/app_export.dart';

import 'package:flutter/foundation.dart';

import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

class AppPref {
  static SharedPreferences? _sharedPreferences;

  AppPref() {
    // init();
    SharedPreferences.getInstance().then((value) {
      _sharedPreferences = value;
    });
  }

  Future<void> init() async {
    _sharedPreferences ??= await SharedPreferences.getInstance();
    if (kDebugMode) {
      print('SharedPreference Initialized');
    }
  }

  static Future<void> setString(String isFirst, String key) {
    return _sharedPreferences!.setString(key, isFirst);
  }

  static String? getString(String key) {
    return _sharedPreferences!.getString(key);
  }

  static Future<void> setValue(bool isFirst, String key) {
    return _sharedPreferences!.setBool(key, isFirst);
  }

  static bool? getValue(String key) {
    return _sharedPreferences!.getBool(key);
  }

  static Future<bool> restore() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.clear();
  }

  Future<bool> setThemeData(String value) {
    return _sharedPreferences!.setString('themeData', value);
  }

  String getThemeData() {
    try {
      return _sharedPreferences!.getString('themeData')!;
    } catch (e) {
      return 'primary';
    }
  }
}

class TimerSplashElement extends StatefulWidget {
  final Widget child;
  const TimerSplashElement({
    super.key,
    required this.child,
  });

  @override
  State<TimerSplashElement> createState() => _TimerSplashElementState();
}

class _TimerSplashElementState extends State<TimerSplashElement> {
  late final Timer _timer;

  @override
  void initState() {
    super.initState();

    _timer = Timer.periodic(
      const Duration(seconds: 2),
      (_) async {
        final isFirst = AppPref.getValue('isFirst');

        if ((isFirst == null || isFirst == false)) {
          AppPref.setValue(true, 'isFirst');

          await Navigator.of(context)
              .pushReplacementNamed(AppRoutes.onboardingOneScreen);

          _timer.cancel();

          return;
        }

        await Navigator.of(context).pushReplacementNamed(AppRoutes.rootScreen);

        return;
      },
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}

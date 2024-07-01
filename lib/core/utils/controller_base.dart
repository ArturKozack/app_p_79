import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ControllerBase extends GetxController {
  @mustCallSuper
  Future<void> init(BuildContext context) async {
    onInit();
  }
}

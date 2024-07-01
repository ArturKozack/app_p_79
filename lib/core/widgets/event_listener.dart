// ignore_for_file: must_be_immutable

import 'package:app_p_79/core/app_export.dart';
import 'package:app_p_79/core/utils/app_repo.dart';
import 'package:app_p_79/data/user_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

abstract class EventListener extends GetWidget<AppRepository> {
  EventListener({super.key});

  UserModel _userCahce = UserModel.newUser();

  @protected
  UserModel get user => _userCahce;

  Widget body(BuildContext context);

  @nonVirtual
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppRepository>(
      init: controller,
      builder: (controllerr) {
        return StreamBuilder(
          initialData: controller.userBox.get('user') ?? UserModel.newUser(),
          stream: controller.userBox.watch(),
          builder: (context, snapshot) {
            if (snapshot.data != null) {
              if (snapshot.data is UserModel) {
                final user = snapshot.data as UserModel;

                _userCahce = user;
              }

              if (snapshot.data is BoxEvent) {
                final event = snapshot.data as BoxEvent;

                if (event.value != null) {
                  final user = event.value as UserModel;

                  _userCahce = user;
                }
              }
            }

            return body(context);
          },
        );
      },
    );
  }
}

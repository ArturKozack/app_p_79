import 'dart:typed_data';

import 'package:app_p_79/data/credit.dart';

import 'package:hive/hive.dart';

part 'user_model.g.dart';

@HiveType(typeId: 1)
class UserModel extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(3)
  final DateTime editTime;

  @HiveField(4)
  final CreditModel credit;

  UserModel({
    required this.id,
    required this.editTime,
  required  this.credit,
  });

  UserModel copyWith({
    final String? id,
    final DateTime? editTime,
    final CreditModel? times,
  }) {
    return UserModel(
      id: id ?? this.id,
      editTime: editTime ?? this.editTime,
      credit: times ?? this.credit,
    );
  }

  static UserModel newUser() {
    return UserModel(
      id: DateTime.now().microsecondsSinceEpoch.toString(),
      editTime: DateTime.now(),
      credit: CreditModel(id: DateTime.now().toIso8601String(), transaction: [])
    );
  }
}

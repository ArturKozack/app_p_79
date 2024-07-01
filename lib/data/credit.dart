import 'dart:typed_data';

import 'package:app_p_79/data/enums.dart';
import 'package:hive/hive.dart';

part 'credit.g.dart';

@HiveType(typeId: 20)
class CreditModel extends HiveObject {
  @HiveField(0)
  final int earlSalary;

  @HiveField(1)
  final String id;

  @HiveField(2)
  final int earlCredit;

  @HiveField(3)
  final int earlBonuses;

  @HiveField(5)
  final int earlOther;

  @HiveField(7)
  final int spendFood;

  @HiveField(11)
  final int spendentr;

  @HiveField(8)
  final int spendHousing;

  @HiveField(10)
  final int spendTrips;

  @HiveField(12)
  final int spendTransport;

  @HiveField(13)
  final int spendCloth;

  @HiveField(14)
  final int spendCredit;

  @HiveField(150)
  final int spendother;

  @HiveField(115)
  final List<TransactionModel> transaction;

  CreditModel(
      {this.earlSalary = 0,
      required this.id,
      required this.transaction,
      this.earlCredit = 0,
      this.earlBonuses = 0,
      this.earlOther = 0,
      this.spendFood = 0,
      this.spendentr = 0,
      this.spendHousing = 0,
      this.spendTrips = 0,
      this.spendTransport = 0,
      this.spendCloth = 0,
      this.spendCredit = 0,
      this.spendother = 0});

  CreditModel copyWith({
    final int? earlSalary,
    final String? id,
    final int? earlCredit,
    final int? earlBonuses,
    final int? earlOther,
    final int? spendFood,
    final int? spendentr,
    final int? spendHousing,
    final int? spendTrips,
    final int? spendTransport,
    final int? spendCloth,
    final int? spendCredit,
    final int? spendother,
    final List<TransactionModel>? transaction,
  }) {
    return CreditModel(
      id: id ?? this.id,
      earlBonuses: earlBonuses ?? this.earlBonuses,
      earlCredit: earlCredit ?? this.earlCredit,
      earlOther: earlOther ?? this.earlOther,
      earlSalary: earlSalary ?? this.earlSalary,
      spendCloth: spendCloth ?? this.spendCloth,
      spendCredit: spendCredit ?? this.spendCredit,
      spendFood: spendFood ?? this.spendFood,
      spendHousing: spendHousing ?? this.spendHousing,
      spendTransport: spendTransport ?? this.spendTransport,
      spendTrips: spendTrips ?? this.spendTrips,
      spendentr: spendentr ?? this.spendentr,
      spendother: spendother ?? this.spendother,
      transaction: transaction ?? this.transaction,
    );
  }

  double get totalPayments {
    double totl = 0;

    for (var element in transaction) {
      totl += element.amount;
    }

    return totl;
  }

  int get totalBalance =>
      earlBonuses +
      earlCredit +
      earlOther +
      earlSalary +
      spendCloth +
      spendCredit +
      spendFood +
      spendHousing +
      spendTransport +
      spendTrips +
      spendentr +
      spendother;

  double get percent =>
      totalBalance == 0 ? totalPayments : totalBalance - totalPayments;
}

@HiveType(typeId: 10)
class TransactionModel extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(3)
  final DateTime editTime;

  @HiveField(4)
  final TypeOfCredit type;

  @HiveField(5)
  final EarnedCategory? earnedCategory;

  @HiveField(6)
  final SpendCategory? spendCategory;

  @HiveField(7)
  final double amount;

  TransactionModel({
    this.earnedCategory,
    this.spendCategory,
    required this.amount,
    required this.id,
    required this.editTime,
    required this.type,
  });
}

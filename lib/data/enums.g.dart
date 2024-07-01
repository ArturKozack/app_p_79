// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'enums.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CurrencyAdapter extends TypeAdapter<Currency> {
  @override
  final int typeId = 4;

  @override
  Currency read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 2:
        return Currency.USD;
      case 1:
        return Currency.EUR;
      default:
        return Currency.USD;
    }
  }

  @override
  void write(BinaryWriter writer, Currency obj) {
    switch (obj) {
      case Currency.USD:
        writer.writeByte(2);
        break;
      case Currency.EUR:
        writer.writeByte(1);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CurrencyAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class TypeOfCreditAdapter extends TypeAdapter<TypeOfCredit> {
  @override
  final int typeId = 5;

  @override
  TypeOfCredit read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 2:
        return TypeOfCredit.Earned;
      case 1:
        return TypeOfCredit.Spend;
      default:
        return TypeOfCredit.Earned;
    }
  }

  @override
  void write(BinaryWriter writer, TypeOfCredit obj) {
    switch (obj) {
      case TypeOfCredit.Earned:
        writer.writeByte(2);
        break;
      case TypeOfCredit.Spend:
        writer.writeByte(1);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TypeOfCreditAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class EarnedCategoryAdapter extends TypeAdapter<EarnedCategory> {
  @override
  final int typeId = 6;

  @override
  EarnedCategory read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 2:
        return EarnedCategory.salary;
      case 1:
        return EarnedCategory.food;
      case 0:
        return EarnedCategory.credit;
      case 3:
        return EarnedCategory.other;
      default:
        return EarnedCategory.salary;
    }
  }

  @override
  void write(BinaryWriter writer, EarnedCategory obj) {
    switch (obj) {
      case EarnedCategory.salary:
        writer.writeByte(2);
        break;
      case EarnedCategory.food:
        writer.writeByte(1);
        break;
      case EarnedCategory.credit:
        writer.writeByte(0);
        break;
      case EarnedCategory.other:
        writer.writeByte(3);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EarnedCategoryAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class SpendCategoryAdapter extends TypeAdapter<SpendCategory> {
  @override
  final int typeId = 7;

  @override
  SpendCategory read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 2:
        return SpendCategory.food;
      case 1:
        return SpendCategory.entertainment;
      case 0:
        return SpendCategory.housing;
      case 3:
        return SpendCategory.trips;
      case 4:
        return SpendCategory.transport;
      case 6:
        return SpendCategory.cloth;
      case 7:
        return SpendCategory.credit;
      case 8:
        return SpendCategory.other;
      default:
        return SpendCategory.food;
    }
  }

  @override
  void write(BinaryWriter writer, SpendCategory obj) {
    switch (obj) {
      case SpendCategory.food:
        writer.writeByte(2);
        break;
      case SpendCategory.entertainment:
        writer.writeByte(1);
        break;
      case SpendCategory.housing:
        writer.writeByte(0);
        break;
      case SpendCategory.trips:
        writer.writeByte(3);
        break;
      case SpendCategory.transport:
        writer.writeByte(4);
        break;
      case SpendCategory.cloth:
        writer.writeByte(6);
        break;
      case SpendCategory.credit:
        writer.writeByte(7);
        break;
      case SpendCategory.other:
        writer.writeByte(8);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SpendCategoryAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

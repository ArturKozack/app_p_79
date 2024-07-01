// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'credit.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CreditModelAdapter extends TypeAdapter<CreditModel> {
  @override
  final int typeId = 20;

  @override
  CreditModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CreditModel(
      earlSalary: fields[0] as int,
      id: fields[1] as String,
      transaction: (fields[115] as List).cast<TransactionModel>(),
      earlCredit: fields[2] as int,
      earlBonuses: fields[3] as int,
      earlOther: fields[5] as int,
      spendFood: fields[7] as int,
      spendentr: fields[11] as int,
      spendHousing: fields[8] as int,
      spendTrips: fields[10] as int,
      spendTransport: fields[12] as int,
      spendCloth: fields[13] as int,
      spendCredit: fields[14] as int,
      spendother: fields[150] as int,
    );
  }

  @override
  void write(BinaryWriter writer, CreditModel obj) {
    writer
      ..writeByte(14)
      ..writeByte(0)
      ..write(obj.earlSalary)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.earlCredit)
      ..writeByte(3)
      ..write(obj.earlBonuses)
      ..writeByte(5)
      ..write(obj.earlOther)
      ..writeByte(7)
      ..write(obj.spendFood)
      ..writeByte(11)
      ..write(obj.spendentr)
      ..writeByte(8)
      ..write(obj.spendHousing)
      ..writeByte(10)
      ..write(obj.spendTrips)
      ..writeByte(12)
      ..write(obj.spendTransport)
      ..writeByte(13)
      ..write(obj.spendCloth)
      ..writeByte(14)
      ..write(obj.spendCredit)
      ..writeByte(150)
      ..write(obj.spendother)
      ..writeByte(115)
      ..write(obj.transaction);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CreditModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class TransactionModelAdapter extends TypeAdapter<TransactionModel> {
  @override
  final int typeId = 10;

  @override
  TransactionModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TransactionModel(
      earnedCategory: fields[5] as EarnedCategory?,
      spendCategory: fields[6] as SpendCategory?,
      amount: fields[7] as double,
      id: fields[0] as String,
      editTime: fields[3] as DateTime,
      type: fields[4] as TypeOfCredit,
    );
  }

  @override
  void write(BinaryWriter writer, TransactionModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(3)
      ..write(obj.editTime)
      ..writeByte(4)
      ..write(obj.type)
      ..writeByte(5)
      ..write(obj.earnedCategory)
      ..writeByte(6)
      ..write(obj.spendCategory)
      ..writeByte(7)
      ..write(obj.amount);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TransactionModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

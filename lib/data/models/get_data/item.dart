import 'package:equatable/equatable.dart';

class Item extends Equatable {
  final double groupId;
  final double itemId;
  final String itemCode;
  final String itemName;
  final int itemValue;
  final int itemDiscountValue;
  final double unitId;

  const Item({
    required this.groupId,
    required this.itemId,
    required this.itemCode,
    required this.itemName,
    required this.itemValue,
    required this.itemDiscountValue,
    required this.unitId,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        groupId: json["groupId"],
        itemId: json["itemId"],
        itemCode: json["itemCode"],
        itemName: json["itemName"],
        itemValue: json["salesValue"],
        itemDiscountValue: json["salesDiscountValue"],
        unitId: json["unitId"],
      );

  @override
  List<Object> get props => [
        groupId,
        itemId,
        itemCode,
        itemName,
        itemValue,
        itemDiscountValue,
        unitId
      ];
}

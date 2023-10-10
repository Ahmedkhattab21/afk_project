import 'package:equatable/equatable.dart';

class InvoiceDetails extends Equatable {
  final int invoiceType;
  final int id;
  final double itemId;
  final double unitId;
  final int quantity;
  final int price;
  final int total;
  final int totalAfterDiscount1;
  final int totalAfterDiscount2;
  final int totalAfterDiscount3;
  final int netPrice;
  final String description;
  final double storeId;

  const InvoiceDetails({
    required this.invoiceType,
    required this.id,
    required this.itemId,
    required this.unitId,
    required this.quantity,
    required this.price,
    required this.total,
    required this.totalAfterDiscount1,
    required this.totalAfterDiscount2,
    required this.totalAfterDiscount3,
    required this.netPrice,
    required this.description,
    required this.storeId,
  });

  Map<String, dynamic> toJson() => {
        "InvoiceType": invoiceType,
        "id": id,
        "itemId": itemId,
        "unitId": unitId,
        "quantity": quantity,
        "price": price,
        "total": total,
        "totalAfterDiscount1": totalAfterDiscount1,
        "totalAfterDiscount2": totalAfterDiscount2,
        "totalAfterDiscount3": totalAfterDiscount3,
        "netPrice": netPrice,
        "description": description,
        "storeId": storeId,
      };

  @override
  List<Object> get props => [
        invoiceType,
        id,
        itemId,
        unitId,
        quantity,
        price,
        total,
        totalAfterDiscount1,
        totalAfterDiscount2,
        totalAfterDiscount3,
        netPrice,
        description,
        storeId,
      ];
}

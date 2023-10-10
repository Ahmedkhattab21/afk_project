import 'package:equatable/equatable.dart';

class PaymentType extends Equatable {
  final int paymentTypeId;
  final String paymentTypeName;

  const PaymentType({
    required this.paymentTypeId,
    required this.paymentTypeName,
  });

  factory PaymentType.fromJson(Map<String, dynamic> json) => PaymentType(
    paymentTypeId: json["bptId"],
    paymentTypeName: json["paymentTypeName"],
  );

  @override
  List<Object> get props => [paymentTypeId, paymentTypeName];
}

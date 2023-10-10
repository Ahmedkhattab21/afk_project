import 'package:equatable/equatable.dart';

class Customer extends Equatable {
  final double customerId;
  final String customerName;

  const Customer({
    required this.customerId,
    required this.customerName,
  });

  factory Customer.fromJson(Map<String, dynamic> json) => Customer(
        customerId: json["id"],
        customerName: json["customerName"],
      );

  @override
  List<Object> get props => [customerId, customerName];
}

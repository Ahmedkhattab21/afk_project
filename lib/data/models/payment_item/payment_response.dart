import 'package:equatable/equatable.dart';

class PaymentResponse extends Equatable {
  final int status;
  final String message;
  final bool isSuccess;

  const PaymentResponse({
    required this.status,
    required this.message,
    required this.isSuccess,
  });

  factory PaymentResponse.fromJson(Map<String, dynamic> json) =>
      PaymentResponse(
        status: json["status"],
        message: json["message"],
        isSuccess: json["isSuccess"],
      );

  @override
  List<Object> get props => [status, message, isSuccess];
}
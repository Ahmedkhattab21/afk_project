import 'package:afk_project/data/models/payment_item/invoice_details.dart';
import 'package:equatable/equatable.dart';

class PaymentRequest extends Equatable {
  final int invoiceType;
  final double customerId;
  final int currencyId;
  final int rate;
  final int total;
  final int netTotal;
  final int amountPaid;
  final int remainingAmount;
  final int totalPayment;
  final List<InvoiceDetails> invoiceDetails;

  const PaymentRequest({
    required this.invoiceType,
    required this.customerId,
    required this.currencyId,
    required this.rate,
    required this.total,
    required this.netTotal,
    required this.amountPaid,
    required this.remainingAmount,
    required this.totalPayment,
    required this.invoiceDetails,
  });

  Map<String, dynamic> toJson() =>
      {
        "invoiceType": invoiceType,
        "sceId": customerId,
        "currencyId": currencyId,
        "rate":rate,
        "total": total,
        "netTotal": netTotal,
        "amountPaid": amountPaid,
        "remainingAmount": remainingAmount,
        "totalPayment": totalPayment,
        "invoiceDetails":
            List<dynamic>.from(invoiceDetails.map((x) => x.toJson())),
      };

  @override
  List<Object> get props =>
      [
        invoiceType,
        customerId,
        currencyId,
        rate,
        total,
        netTotal,
        amountPaid,
        remainingAmount,
        totalPayment,
        invoiceDetails,
      ];
}
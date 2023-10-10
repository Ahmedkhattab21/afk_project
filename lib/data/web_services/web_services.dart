import 'dart:convert';

import 'package:afk_project/constant/app_strings.dart';
import 'package:afk_project/constant/end_points.dart';
import 'package:afk_project/data/models/get_data/get_data_response.dart';
import 'package:afk_project/data/models/login/login_request.dart';
import 'package:afk_project/data/models/login/login_response.dart';
import 'package:afk_project/data/models/payment_item/payment_request.dart';
import 'package:afk_project/data/models/payment_item/payment_response.dart';
import 'package:http/http.dart' as http;

class WebServices {
  Future<LoginResponse> login(LoginRequest parameter) async {
    AppStrings.token='';
    final response = await http.post(Uri.parse(EndPoints.loginUrl),
        headers: {"Content-Type": "application/json"},
        body: json.encode(LoginRequest(
          userName: parameter.userName,
          password: parameter.password,
        ).toJson()));
    if (response.statusCode == 200) {
      return LoginResponse.fromJson(json.decode(response.body));
    } else {
      throw "error in login";
    }
  }

  Future<GetAllDataResponse> getStoresData() async {
    final response = await http.get(
      Uri.parse(EndPoints.getDataUrl),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer ${AppStrings.token}",
      },
    );
    if (response.statusCode == 200) {
      return GetAllDataResponse.fromJson(json.decode(response.body));
    } else {
      throw "error in get Data";
    }
  }

  Future<PaymentResponse> addPayment(PaymentRequest parameter) async {
    final response = await http.post(
      Uri.parse(EndPoints.addDataUrl),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer ${AppStrings.token}",
      },
        body: json.encode(PaymentRequest(
            invoiceType: parameter.invoiceType,
            customerId: parameter.customerId,
            currencyId: parameter.currencyId,
            rate: parameter.rate,
            total: parameter.total,
            netTotal: parameter.netTotal,
            amountPaid: parameter.amountPaid,
            remainingAmount: parameter.remainingAmount,
            totalPayment: parameter.totalPayment,
            invoiceDetails: parameter.invoiceDetails,
        ).toJson()
        ),
    );
    if (response.statusCode == 200) {
      return PaymentResponse.fromJson(json.decode(response.body));
    } else {
      throw "error add data";
    }
  }
}

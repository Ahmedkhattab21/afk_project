import 'package:afk_project/data/models/get_data/get_data_response.dart';
import 'package:afk_project/data/models/login/login_request.dart';
import 'package:afk_project/data/models/login/login_response.dart';
import 'package:afk_project/data/models/payment_item/payment_request.dart';
import 'package:afk_project/data/models/payment_item/payment_response.dart';
import 'package:afk_project/data/web_services/web_services.dart';

class Repository{
  final WebServices webServices;
  Repository({required this.webServices});

  Future<LoginResponse> login(LoginRequest parameter) async {
    try{
      return await webServices.login(parameter);
    }catch(e){
      rethrow;
    }
  }

  Future<GetAllDataResponse> getStoresData() async {
    try{
      return await webServices.getStoresData();
    }catch(e){
      rethrow;
    }
  }

  Future<PaymentResponse> addPayment(PaymentRequest parameter) async {
    try {
      return await webServices.addPayment(parameter);
    } catch (e) {
      rethrow;
    }
  }
}
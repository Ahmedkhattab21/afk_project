
import 'package:afk_project/constant/app_strings.dart';
import 'package:afk_project/cubit/states.dart';
import 'package:afk_project/data/models/get_data/customer.dart';
import 'package:afk_project/data/models/get_data/payment_type.dart';
import 'package:afk_project/data/models/get_data/store.dart';
import 'package:afk_project/data/models/get_data/store_data.dart';
import 'package:afk_project/data/models/login/login_request.dart';
import 'package:afk_project/data/models/payment_item/invoice_details.dart';
import 'package:afk_project/data/models/payment_item/payment_request.dart';
import 'package:afk_project/data/repository/repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AfkCubit extends Cubit<AfkState> {
 final Repository repository;

  AfkCubit(this.repository,
      ) : super(InitialState());

  TextEditingController userNameController=TextEditingController();
  TextEditingController passwordController=TextEditingController();

  GlobalKey<FormState> userNameFormKey = GlobalKey();
  GlobalKey<FormState> passwordFormKey = GlobalKey();


 login() {
   emit(OnLoadingLoginState());
    repository
        .login(
      LoginRequest(
            userName: userNameController.text,
            password: passwordController.text))
        .then((value) {
         AppStrings.token=value.token;
         emit(OnSuccessLoginState());
    }).catchError((error){
     emit(OnErrorLoginState());
    });
  }

  List<StoreData> data = [];

  getData() {
    emit(OnLoadingGetDataState());
    repository.getStoresData().then((value) {
      if (value.status == 200) {
        data = value.data!;
      } else {
        data = [];
      }
      emit(OnSuccessGetDataState());
    }).catchError((error) {
      emit(OnErrorGetDataState());
    });
  }

 Customer? customerType;

 changeCustomerType(Customer value){
   customerType=value;
   emit(OnChangeCustomerTypeState());
 }

 PaymentType? paymentType;

  changePaymentType(PaymentType value){
    paymentType=value;
    emit(OnChangePaymentTypeState());
  }
  Store? store;

  changeStore(Store value){
    store=value;
    emit(OnChangePaymentTypeState());
  }

  int counter=0;
  int totalPrice=0;

  allPrice(int price){
    totalPrice=price*counter;
  }
  counterPlus(){
    counter++;
    emit(OnCounterPlusState());
  }
  counterMinus(){
    if(counter >0){
      counter--;
    }
    emit(OnCounterMinusState());
  }

 clearData() {
   customerType=null;
   paymentType=null;
   counter=0;
   totalPrice=0;
 }


 addPayment(double itemId, double unitId) {
   emit(OnLoadingAddPaymentState());
    repository
        .addPayment(PaymentRequest(
            invoiceType: 10,
            customerId: customerType!.customerId,
            currencyId: 1,
            rate: 1,
            total: totalPrice,
            netTotal: totalPrice,
            amountPaid: totalPrice,
            remainingAmount: 0,
            totalPayment: totalPrice,

            invoiceDetails: [
              InvoiceDetails(
                invoiceType: 10,
                id: 2,
                itemId: itemId,
                unitId: unitId,
                quantity: 1,
                price: 1,
                total: totalPrice,
                totalAfterDiscount1: totalPrice ,
                totalAfterDiscount2: totalPrice,
                totalAfterDiscount3: totalPrice,
                netPrice: totalPrice,
                description: "description",
                storeId: store!.storeId,
              )
            ]))
        .then((value) {
      emit(OnSuccessAddPaymentState());
   }).catchError((error) {
     emit(OnErrorAddPaymentState());
   });
 }



  static AfkCubit get(context) => BlocProvider.of(context);
}
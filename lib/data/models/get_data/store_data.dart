import 'package:afk_project/data/models/get_data/customer.dart';
import 'package:afk_project/data/models/get_data/item.dart';
import 'package:afk_project/data/models/get_data/payment_type.dart';
import 'package:afk_project/data/models/get_data/store.dart';
import 'package:equatable/equatable.dart';

class StoreData extends Equatable {
  final int storeId;
  final String storeName;
  final List<PaymentType> paymentTypes;
  final List<Item> items;
  final List<Customer> customers;
  final List<Store> stores;

  const StoreData({
    required this.storeId,
    required this.storeName,
    required this.paymentTypes,
    required this.items,
    required this.customers,
    required this.stores,
  });

  factory StoreData.fromJson(Map<String, dynamic> json) => StoreData(
        storeId: json["storeId"],
        storeName: json["storeName"],
        paymentTypes: List<PaymentType>.from(
            json['paymentTypeList'].map((x) => PaymentType.fromJson(x))),
        items: List<Item>.from(json['itemsList'].map((x) => Item.fromJson(x))),
        customers: List<Customer>.from(
            json['customerList'].map((x) => Customer.fromJson(x))),
        stores:
            List<Store>.from(json['storesList'].map((x) => Store.fromJson(x))),
      );

  @override
  List<Object> get props =>
      [storeId, storeName, paymentTypes, items, customers, stores];
}

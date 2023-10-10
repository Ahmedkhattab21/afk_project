import 'package:equatable/equatable.dart';

class Store extends Equatable {
  final double storeId;
  final String storeName;

  const Store({
    required this.storeId,
    required this.storeName,
  });

  factory Store.fromJson(Map<String, dynamic> json) => Store(
        storeId: json["storeId"],
        storeName: json["storeName"],
      );

  @override
  List<Object> get props => [storeId, storeName];
}

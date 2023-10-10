import 'package:afk_project/data/models/get_data/store_data.dart';
import 'package:equatable/equatable.dart';

class GetAllDataResponse extends Equatable {

  final List<StoreData>? data;
  final  int status;

  const GetAllDataResponse({required this.data,required this.status});

  factory GetAllDataResponse.fromJson(Map<String, dynamic> json) =>
      GetAllDataResponse(
          data: List<StoreData>.from(
              json['data'].map((x) => StoreData.fromJson(x))),
          status: json['status']);

  @override
  List<Object?> get props => [data,status];
}

import 'package:equatable/equatable.dart';

class LoginResponse extends Equatable {
  final bool isSuccess;
  final String token;

  const LoginResponse({
    required this.isSuccess,
    required this.token,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
    isSuccess: json["isSuccess"],
    token: json["token"],
  );

  @override
  List<Object> get props => [isSuccess,token];
}

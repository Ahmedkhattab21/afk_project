import 'package:equatable/equatable.dart';

class LoginRequest extends Equatable {
  final String userName;
  final String password;

  const LoginRequest({
    required this.userName,
    required this.password,
  });

  Map<String, dynamic> toJson() =>
      {
        "userName": userName,
        "password": password,
      };

  @override
  List<Object> get props => [userName, password];
}

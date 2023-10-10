import 'package:afk_project/constant/app_strings.dart';
import 'package:afk_project/presentation/screens/items_screen.dart';
import 'package:afk_project/presentation/screens/login_screen.dart';
import 'package:afk_project/presentation/screens/payment_screen.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final dynamic args = settings.arguments;
    switch (settings.name) {
      case AppStrings.loginScreen:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
        case AppStrings.itemScreen:
        return MaterialPageRoute(builder: (_) => const ItemScreen());
        case AppStrings.paymentScreen:
          return MaterialPageRoute(builder: (_) =>  PaymentScreen(
                  itemId: args.itemId,
                  itemName: args.itemName,
                  itemValue: args.itemValue,
                  unitId: args.unitId,
                ));
      default:
        return _errorRoute();
    }
  }
}

Route _errorRoute() {
  return MaterialPageRoute(builder: (_) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ERROR"),
        centerTitle: true,
      ),
      body: const Center(
        child: Text("Page not found!"),
      ),
    );
  });
}
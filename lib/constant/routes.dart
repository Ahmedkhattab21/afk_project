import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final dynamic args = settings.arguments;
    switch (settings.name) {
      // case AppStrings.bottomNavigationBarScreen:
        // return MaterialPageRoute(builder: (_) => BottomNavigationScreen());
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
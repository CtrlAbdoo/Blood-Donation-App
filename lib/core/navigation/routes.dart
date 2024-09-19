import 'package:blood_donation_app/features/blood_donation/presentation/pages/blood_donation_page.dart';
import 'package:blood_donation_app/features/blood_donation/presentation/pages/blood_request_page.dart';
import 'package:blood_donation_app/features/blood_donation/presentation/pages/home_page.dart';
import 'package:flutter/material.dart';

class Routes {
  // Route names (constants)
  static const String home = '/';
  static const String donation = '/donation';
  static const String request = '/request';

  // Route manager function
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(builder: (_) => HomePage());
      case donation:
        return MaterialPageRoute(builder: (_) => BloodDonationPage());
      case request:
        return MaterialPageRoute(builder: (_) => BloodRequestPage());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}

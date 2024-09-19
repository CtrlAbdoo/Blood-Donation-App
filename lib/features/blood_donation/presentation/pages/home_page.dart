import 'package:blood_donation_app/features/blood_donation/presentation/pages/blood_request_page.dart';
import 'package:blood_donation_app/features/blood_donation/presentation/state/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:blood_donation_app/features/blood_donation/presentation/pages/blood_donation_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Blood Donation & Requests'),
        ),
        body: LayoutBuilder(
          builder: (context, constraints) {
            double width = constraints.maxWidth;
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => BloodDonationPage()),
                      ),
                      child: Card(
                        color: Colors.red[100],
                        elevation: 4,
                        child: Center(
                          child: Text(
                            'Donate Blood',
                            style: TextStyle(
                              fontSize: width > 600 ? 28 : 18, // Responsive font size
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Expanded(
                    child: GestureDetector(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => BloodRequestPage()),
                      ),
                      child: Card(
                        color: Colors.red[300],
                        elevation: 4,
                        child: Center(
                          child: Text(
                            'Request Blood',
                            style: TextStyle(
                              fontSize: width > 600 ? 28 : 18, // Responsive font size
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

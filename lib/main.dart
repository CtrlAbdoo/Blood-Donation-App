import 'package:blood_donation_app/core/navigation/routes.dart';
import 'package:blood_donation_app/features/blood_donation/presentation/state/blood_donation_cubit.dart';
import 'package:blood_donation_app/features/blood_donation/presentation/state/blood_request_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart'; // Import your pages

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<BloodDonationCubit>(
          create: (context) => BloodDonationCubit(getBloodDonors: null),
        ),
        BlocProvider<BloodRequestCubit>(
          create: (context) => BloodRequestCubit(),
        )
      ],
      child: MyApp(),
    ),
  );
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Blood Donation App',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      initialRoute: Routes.home,
      onGenerateRoute: Routes.generateRoute,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../state/blood_donation_cubit.dart';
import '../state/blood_donation_state.dart';

class BloodDonationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Find Blood Donors'),
      ),
      body: BlocBuilder<BloodDonationCubit, BloodDonationState>(
        builder: (context, state) {
          if (state is BloodDonationLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is BloodDonationLoaded) {
            return ListView.builder(
              itemCount: state.donors.length,
              itemBuilder: (context, index) {
                final donor = state.donors[index];
                return ListTile(
                  title: Text(donor.bloodType),
                  subtitle: Text(donor.location),
                );
              },
            );
          } else if (state is BloodDonationError) {
            return Center(child: Text(state.message));
          } else {
            return Center(child: Text('No donors found'));
          }
        },
      ),
    );
  }
}

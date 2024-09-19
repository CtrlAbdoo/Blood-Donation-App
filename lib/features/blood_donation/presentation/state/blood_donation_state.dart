import 'package:equatable/equatable.dart';
import '../../domain/entities/blood_donation_request.dart';

// Abstract State class
abstract class BloodDonationState extends Equatable {
  const BloodDonationState(); // Added const constructor for immutability

  @override
  List<Object?> get props => [];
}

// Initial state (before loading)
class BloodDonationInitial extends BloodDonationState {
  const BloodDonationInitial(); // Added const constructor
}

// Loading state (when fetching data)
class BloodDonationLoading extends BloodDonationState {
  const BloodDonationLoading(); // Added const constructor
}

// Loaded state (when data is successfully retrieved)
class BloodDonationLoaded extends BloodDonationState {
  final List<BloodDonationRequest> donors;

  const BloodDonationLoaded(this.donors); // Added const constructor for immutability

  @override
  List<Object?> get props => [donors];
}

// Error state (when there is an error fetching data)
class BloodDonationError extends BloodDonationState {
  final String message;

  const BloodDonationError(this.message); // Added const constructor for immutability

  @override
  List<Object?> get props => [message];
}

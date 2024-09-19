import 'package:blood_donation_app/features/blood_donation/domain/entities/blood_donation_request.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';

abstract class BloodDonationRepository {
  Future<Either<Failure, List<BloodDonationRequest>>> getBloodDonors(String bloodType);
}

import 'package:blood_donation_app/core/error/failure.dart';
import 'package:blood_donation_app/features/blood_donation/data/repositories/blood_donation_repository.dart';
import 'package:blood_donation_app/features/blood_donation/domain/entities/blood_donation_request.dart';
import 'package:dartz/dartz.dart';

class GetBloodDonors {
  final BloodDonationRepository repository;

  GetBloodDonors(this.repository);

  Future<Either<Failure, List<BloodDonationRequest>>> execute(String bloodType) async {
    return repository.getBloodDonors(bloodType);
  }
}

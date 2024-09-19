import 'package:blood_donation_app/features/blood_donation/domain/entities/blood_donation_request.dart';
import 'package:dartz/dartz.dart';
import '../datasources/blood_donation_remote_data_source.dart';
import '../../../../core/error/failure.dart';
import '../repositories/blood_donation_repository.dart';

class BloodDonationRepositoryImpl implements BloodDonationRepository {
  final BloodDonationRemoteDataSource remoteDataSource;

  BloodDonationRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, List<BloodDonationRequest>>> getBloodDonors(String bloodType) async {
    try {
      final donors = await remoteDataSource.fetchBloodDonors(bloodType);
      // Convert data source response to domain entity
      return Right(donors.map((donor) => BloodDonationRequest(
          id: donor['id'],
          bloodType: donor['bloodType'],
          requestedDate: DateTime.parse(donor['requestedDate']),
          location: donor['location'])).toList());
    } catch (e) {
      return Left(ServerFailure());
    }
  }
}

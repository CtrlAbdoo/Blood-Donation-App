import 'package:bloc/bloc.dart';
import '../../domain/usecases/get_blood_donors.dart';
import 'blood_donation_state.dart';

class BloodDonationCubit extends Cubit<BloodDonationState> {
  final GetBloodDonors? getBloodDonors;

  BloodDonationCubit({required this.getBloodDonors}) : super(const BloodDonationInitial());

  Future<void> fetchBloodDonors(String bloodType) async {
    emit(const BloodDonationLoading());

    final result = await getBloodDonors?.execute(bloodType);

    result?.fold(
          (failure) => emit(BloodDonationError('Error loading donors')),
          (donors) => emit(BloodDonationLoaded(donors)),
    );
  }
}

import 'package:blood_donation_app/features/blood_donation/presentation/state/blood_request_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BloodRequestCubit extends Cubit<BloodRequestState> {
  BloodRequestCubit() : super(BloodRequestInitial());

  void submitBloodRequest(String bloodType, String location, String contactInfo) async {
    emit(BloodRequestLoading()); // Show loading state

    try {
      // Simulate network call or form submission process
      await Future.delayed(Duration(seconds: 2));

      // On success
      print('Blood Request Submitted: $bloodType, $location, $contactInfo');
      emit(BloodRequestSuccess()); // Emit success state
    } catch (error) {
      emit(BloodRequestError("An error occurred")); // Emit error state
    }
  }
}

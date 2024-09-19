abstract class BloodRequestState {}

class BloodRequestInitial extends BloodRequestState {}

class BloodRequestLoading extends BloodRequestState {}

class BloodRequestSuccess extends BloodRequestState {}

class BloodRequestError extends BloodRequestState {
  final String message;

  BloodRequestError(this.message);
}

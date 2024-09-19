class BloodDonationRequest {
  final String id;
  final String bloodType;
  final DateTime requestedDate;
  final String location;

  BloodDonationRequest({
    required this.id,
    required this.bloodType,
    required this.requestedDate,
    required this.location,
  });
}

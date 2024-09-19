import 'package:http/http.dart' as http;
import 'dart:convert';

class BloodDonationRemoteDataSource {
  final http.Client client;

  BloodDonationRemoteDataSource({required this.client});

  Future<List<Map<String, dynamic>>> fetchBloodDonors(String bloodType) async {
    final response = await client.get(
        Uri.parse('https://api.example.com/donors?bloodType=$bloodType'));

    if (response.statusCode == 200) {
      return List<Map<String, dynamic>>.from(json.decode(response.body));
    } else {
      throw Exception('Failed to load blood donors');
    }
  }
}

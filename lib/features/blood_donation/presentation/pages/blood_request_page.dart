import 'package:flutter/material.dart';

class BloodRequestPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Request Blood'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BloodRequestForm(), // Use a form widget for better structure
      ),
    );
  }
}

class BloodRequestForm extends StatefulWidget {
  @override
  _BloodRequestFormState createState() => _BloodRequestFormState();
}

class _BloodRequestFormState extends State<BloodRequestForm> {
  final _formKey = GlobalKey<FormState>();
  String _bloodType = 'A+';
  String _location = '';
  String _contactInfo = '';

  // This method will be used to validate and save the form data
  void _submitRequest() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      // Here you can call a Cubit or a Bloc to handle the request logic
      // You can pass the form data to the Cubit/Bloc if needed

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Blood request submitted successfully!')),
      );

      // Navigate back or to another page after submission
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: ListView(
        children: [
          // Blood Type Dropdown
          DropdownButtonFormField<String>(
            value: _bloodType,
            decoration: InputDecoration(labelText: 'Blood Type'),
            items: ['A+', 'A-', 'B+', 'B-', 'AB+', 'AB-', 'O+', 'O-']
                .map((bloodType) => DropdownMenuItem(
              value: bloodType,
              child: Text(bloodType),
            ))
                .toList(),
            onChanged: (value) {
              setState(() {
                _bloodType = value!;
              });
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please select a blood type';
              }
              return null;
            },
          ),
          SizedBox(height: 16),

          // Location TextField
          TextFormField(
            decoration: InputDecoration(labelText: 'Location'),
            onSaved: (value) {
              _location = value!;
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter the location';
              }
              return null;
            },
          ),
          SizedBox(height: 16),

          // Contact Information TextField
          TextFormField(
            decoration: InputDecoration(labelText: 'Contact Information'),
            onSaved: (value) {
              _contactInfo = value!;
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter contact information';
              }
              return null;
            },
          ),
          SizedBox(height: 32),

          // Submit Button
          ElevatedButton(
            onPressed: _submitRequest,
            child: Text('Submit Request'),
          ),
        ],
      ),
    );
  }
}

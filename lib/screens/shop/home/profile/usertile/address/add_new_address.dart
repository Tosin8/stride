import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

class AddNewAddress extends StatefulWidget {
  const AddNewAddress({super.key});

  @override
  State<AddNewAddress> createState() => _AddNewAddressState();
}

class _AddNewAddressState extends State<AddNewAddress> {
  final _formKey = GlobalKey<FormState>();
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  String? _beneficiary;
  String? _street;
  String? _area;
  String? _landmark;
  String? _city;

  final List<String> _cities = [
    'Lagos', 'Ibadan', 'Abuja', 'Benin', 'Port Harcourt', 'Kano', 'Akure', 'Abeokuta'
  ];

  Future<void> _saveAddress() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      final addressData = '$_beneficiary;$_street;$_landmark;$_area;$_city';
      await _storage.write(key: _beneficiary!, value: addressData);
      Get.back(); // Go back to the Address screen after saving
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Address'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Beneficiary',
                  hintText: 'e.g. Home, Office, etc.',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a beneficiary';
                  }
                  return null;
                },
                onSaved: (value) => _beneficiary = value,
              ),
              const SizedBox(height: 15),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Street',
                  hintText: 'Enter street address',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the street address';
                  }
                  return null;
                },
                onSaved: (value) => _street = value,
              ),
              const SizedBox(height: 15),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Area',
                  hintText: 'Enter the area name',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the area';
                  }
                  return null;
                },
                onSaved: (value) => _area = value,
              ),
              const SizedBox(height: 15),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Landmark',
                  hintText: 'Enter a landmark nearby',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a landmark';
                  }
                  return null;
                },
                onSaved: (value) => _landmark = value,
              ),
              const SizedBox(height: 15),
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  labelText: 'City',
                  border: OutlineInputBorder(),
                ),
                value: _city,
                items: _cities.map((String city) {
                  return DropdownMenuItem<String>(
                    value: city,
                    child: Text(city),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _city = value;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select a city';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 15),
              ElevatedButton(
                onPressed: _saveAddress,
                child: const Text('Save Address'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'add_new_address.dart';

class Address extends StatefulWidget {
  const Address({super.key});

  @override
  State<Address> createState() => _AddressState();
}

class _AddressState extends State<Address> {
  final FlutterSecureStorage _storage = const FlutterSecureStorage();
  List<Map<String, String>> _addresses = [];

  @override
  void initState() {
    super.initState();
    _loadAddresses();
  }

  Future<void> _loadAddresses() async {
    final allAddresses = await _storage.readAll();
    setState(() {
      _addresses = allAddresses.entries.map((entry) {
        final values = entry.value.split(';');
        return {
          'beneficiary': values[0],
          'street': values[1],
          'landmark': values[2],
          'area': values[3],
          'city': values[4],
        };
      }).toList();
    });
  }

  Future<void> _deleteAddress(String key) async {
    await _storage.delete(key: key);

    // Show a success message on deletion
    const snackBar = SnackBar(
      elevation: 0,
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      content: AwesomeSnackbarContent(
        title: 'Deleted!',
        message: 'Address deleted successfully.',
        contentType: ContentType.success,
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);

    _loadAddresses(); // Reload addresses after deletion
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Addresses'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: _addresses.isEmpty
            ? const Center(child: Text('No addresses added.'))
            : ListView.builder(
                itemCount: _addresses.length,
                itemBuilder: (context, index) {
                  final address = _addresses[index];
                  return Column(
                    children: [
                      AddressCard(
                        beneficiary: address['beneficiary']!,
                        street: address['street']!,
                        landmark: address['landmark']!,
                        area: address['area']!,
                        city: address['city']!,
                        onDelete: () => _deleteAddress(_addresses[index]['beneficiary']!),
                      ),
                      const Divider(),
                    ],
                  );
                },
              ),
      ),
      bottomSheet: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GestureDetector(
          onTap: () async {
            await Get.to(() => const AddNewAddress());
            _loadAddresses(); // Reload addresses after adding a new one
          },
          child: Container(
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(11),
            ),
            height: 60,
            child: const Align(
              child: Text(
                'Add New Address',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class AddressCard extends StatelessWidget {
  const AddressCard({
    super.key,
    required this.beneficiary,
    required this.street,
    required this.landmark,
    required this.area,
    required this.city,
    required this.onDelete,
  });

  final String beneficiary, street, landmark, area, city;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(beneficiary, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Text('$street , ', style: const TextStyle(fontSize: 15)),
            Row(
              children: [
                Text('$landmark , ', style: const TextStyle(fontSize: 15)),
                Text(area, style: const TextStyle(fontSize: 15)),
              ],
            ),
            Text('$city .'),
          ],
        ),
        IconButton(
          onPressed: onDelete,
          icon: const Icon(Iconsax.trash, color: Colors.red),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:iconsax/iconsax.dart';

// Secure Storage instance
const storage = FlutterSecureStorage();

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  // Toggle states
  bool orderUpdates = true;
  bool promotional = true;
  bool priceAlerts = true;
  bool newsletter = true;
  bool fingerId = false; // Default for Finger ID is off

  @override
  void initState() {
    super.initState();
    _loadSettings();
  }

  // Load settings from Secure Storage
  Future<void> _loadSettings() async {
    String? orderUpdatesValue = await storage.read(key: 'orderUpdates');
    String? promotionalValue = await storage.read(key: 'promotional');
    String? priceAlertsValue = await storage.read(key: 'priceAlerts');
    String? newsletterValue = await storage.read(key: 'newsletter');
    String? fingerIdValue = await storage.read(key: 'fingerId');

    setState(() {
      orderUpdates = orderUpdatesValue == 'true' ? true : false;
      promotional = promotionalValue == 'true' ? true : false;
      priceAlerts = priceAlertsValue == 'true' ? true : false;
      newsletter = newsletterValue == 'true' ? true : false;
      fingerId = fingerIdValue == 'true' ? true : false;
    });
  }

  // Save settings to Secure Storage
  Future<void> _saveSetting(String key, bool value) async {
    await storage.write(key: key, value: value.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            const Header(text: 'Notifications'),
            ListTile(
              title: const Text(
                'Order Updates',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
              ),
              subtitle: const Text('Toggle to receive notifications about order status.'),
              trailing: Switch(
                value: orderUpdates,
                onChanged: (bool value) {
                  setState(() {
                    orderUpdates = value;
                    _saveSetting('orderUpdates', value);
                  });
                },
              ),
            ),
            ListTile(
              title: const Text(
                'Promotional',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
              ),
              subtitle: const Text('Settings to subscribe/unsubscribe from promotional offers, flash sales, etc.'),
              trailing: Switch(
                value: promotional,
                onChanged: (bool value) {
                  setState(() {
                    promotional = value;
                    _saveSetting('promotional', value);
                  });
                },
              ),
            ),
            ListTile(
              title: const Text(
                'Price Alerts',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
              ),
              subtitle: const Text('Option to enable alerts for price drops or restocks on favorite products'),
              trailing: Switch(
                value: priceAlerts,
                onChanged: (bool value) {
                  setState(() {
                    priceAlerts = value;
                    _saveSetting('priceAlerts', value);
                  });
                },
              ),
            ),
            const Divider(),
            const SizedBox(height: 10),
            const Header(text: 'Account Preferences'),
            ListTile(
              title: const Text(
                'Newsletter',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
              ),
              subtitle: const Text('Toggle for receiving subscription newsletters via email or SMS'),
              trailing: Switch(
                value: newsletter,
                onChanged: (bool value) {
                  setState(() {
                    newsletter = value;
                    _saveSetting('newsletter', value);
                  });
                },
              ),
            ),
            const Divider(),
            const SizedBox(height: 10),
            const Header(text: 'Privacy & Security'),
            ListTile(
              title: const Text(
                'Finger ID',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
              ),
              subtitle: const Text('Enable fingerprint to authenticate transactions and to sign in'),
              trailing: Switch(
                value: fingerId,
                onChanged: (bool value) {
                  setState(() {
                    fingerId = value;
                    _saveSetting('fingerId', value);
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Header extends StatelessWidget {
  const Header({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

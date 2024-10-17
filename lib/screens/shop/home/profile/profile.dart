import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:stride/auth/forms/login.dart';
import 'package:stride/auth/repository/auth_repo.dart';
import 'package:stride/auth/repository/user_repo.dart';
import 'package:stride/screens/shop/home/profile/usertile/customer_care/livechat.dart';
import 'package:stride/screens/shop/home/profile/usertile/faq/faq.dart';
import 'package:stride/screens/shop/home/profile/usertile/personal_data.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:url_launcher/url_launcher.dart';
import 'settings/settings.dart';
import 'usertile.dart';
import 'usertile/payment/payment_card.dart';

class UserProfile extends StatelessWidget {
  final userRepo = UserRepository.instance;
  final authRepo = AuthenticationRepository.instance;

  UserProfile({super.key});
final String phoneNumber = '1234567890';
void _launchDialer() async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    if (await canLaunchUrl(launchUri)) {
      await launchUrl(launchUri);
    } else {
      throw 'Could not launch $launchUri';
    }
  }

  @override
  Widget build(BuildContext context) {



    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(40),
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Obx(() {
                // Observing the user model to update the UI dynamically.
                final user = userRepo.userModel.value;

                return ListTile(
                  leading: CircleAvatar(
                    radius: 30,
                    backgroundImage: user.profilePicture.isNotEmpty
                        ? NetworkImage(user.profilePicture)
                        : const AssetImage('assets/user.png')
                            as ImageProvider,
                    backgroundColor: Colors.grey,
                  ),
                  title: Text(
                    user.fullName.isNotEmpty ? user.fullName : 'Guest User',
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  subtitle: Text(user.email.isNotEmpty ? user.email : 'No Email'),
                );
              }),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const SizedBox(height: 4),
                const Divider(),
                const SizedBox(height: 4),
                // personal data
                Usertile(
                  subtitle: 'Manage your account details here',
                  onTap: () {
                    final user = userRepo.userModel.value;
                    Get.to(() => PersonalData(user: user));
                  },
                  text: 'Personal Data',
                  leading: Iconsax.user,
                ),
                // payment card
                Usertile(
                  onTap: () {
                    Get.to(() => const PaymentCard());
                  },
                  subtitle: 'Securely store and manage your payment methods.',
                  text: 'Payment Cards',
                  leading: Iconsax.card,
                ),
                // addresses
                Usertile(
                  onTap: () {},
                  subtitle: 'Save your delivery addresses along with your beneficiaries.',
                  text: 'Addresses',
                  leading: Iconsax.house_2,
                ),
                // settings
                Usertile(

                   onTap: () {
                    Get.to(() => const SettingScreen()); 
                  },
                  subtitle: 'Customize your app preferences, privacy, and options.',
                 
                  text: 'Settings',
                  leading: Iconsax.setting,
                ),
                // cart
                Usertile(
                  subtitle: 'View your purchase history and track orders',
                  onTap: () {},
                  text: 'Orders',
                  leading: Iconsax.shopping_bag,
                ),
                // notification
                Usertile(
                  subtitle: 'Stay updated with important alerts and messages.',
                  onTap: () {},
                  text: 'Notifications',
                  leading: Iconsax.message,
                ),
                Usertile(
                  subtitle: 'Review and rate your recent purchases.',
                  onTap: () {},
                  text: 'Pending Reviews',
                  leading: Iconsax.activity,
                ),
                const SizedBox(height: 4,),
                const Divider(),
                const SizedBox(height: 4,),
                // FAQs
                Usertile(
                  subtitle: 'Find answers to common questions and issues',
                  onTap: () {
                    Get.to(() => const FAQScreen());
                  },
                  text: 'FAQs',
                  leading: Icons.question_answer,
                ),
                // Customer Care
                Usertile(
                  subtitle: 'Get help and support for any inquiries.',
                  onTap: () {
                    showBarModalBottomSheet(context: context,
                     builder: (context) => Container(
                      color: Colors.white,
                      height: 350,
                      child:  Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            const SizedBox(height: 10,),
                            const Text('Select your Option', style: TextStyle(color: Colors.black, fontSize: 18),),
                            const SizedBox(height: 10,),
                            Usertile(
                              onTap: () async {
                                // for indirect phone call. 
                              // launchUrl(Uri.parse('tel://$phoneNumber'));

                              // for direct phone call. 
                              await FlutterPhoneDirectCaller.callNumber(phoneNumber);
                              },
                              subtitle: 'Get into direct call with us.',
                              text: 'Call Us',
                              leading: Icons.phone, 
                            ),
                            const SizedBox(height: 10,),
                            const Divider(), 
                             const SizedBox(height: 10,),
                            Usertile(
                              onTap: () {
                                Get.to(() => const Livechat()); 
                              },
                              subtitle: 'Get into direct chat with us.',
                              text: 'Live Chat',
                              leading: Icons.chat_bubble, 
                            ),
                          ],
                        ),
                      ),
                     ));
                  },
                  text: 'Customer Care',
                  leading: Icons.phone,
                ),
                const SizedBox(height: 4,),
                const Divider(),
                const SizedBox(height: 10,),
                // Log out
                Usertile(
                  subtitle: 'Log out of your account.',
                  onTap: () async {
                    await authRepo.logout();
                  },
                  text: 'Log Out',
                  leading: Icons.exit_to_app,
                ),
                const SizedBox(height: 10),
                // Delete Account
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () async {
                      bool confirm = await _confirmDeleteAccount(context);
                      if (confirm) {
                        _showReauthenticateBottomSheet(context);
                      }
                    },
                    child: Container(
                      height: 50,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: Colors.red,
                        ),
                      ),
                      child: const Align(
                        child: Text(
                          'Delete Account',
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Method to show the confirmation dialog before deleting the account
  Future<bool> _confirmDeleteAccount(BuildContext context) async {
    return await showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Delete Account'),
          content: const Text(
              'Are you sure you want to delete your account? This action cannot be undone.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: const Text('No'),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(true),
              child: const Text('Yes'),
            ),
          ],
        );
      },
    ) ?? false;
  }

  // Method to show the reauthenticate form in a modal bottom sheet
  void _showReauthenticateBottomSheet(BuildContext context) {
    final TextEditingController passwordController = TextEditingController();

    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Reauthenticate to Continue',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black, 
                  padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))), 
                ),
                onPressed: () async {
                  final email = userRepo.userModel.value.email; // Get email from user model
                  await _handleReauthentication(context, email, passwordController.text.trim());
                },
                child: const Text('Permanently Delete My Account', 
                style: TextStyle(color: Colors.white),),
              ),
            ],
          ),
        );
      },
    );
  }

  // Method to handle reauthentication and account deletion
  Future<void> _handleReauthentication(BuildContext context, String email, String password) async {
    try {
      // Reauthenticate the user
      await AuthenticationRepository.instance.reAuthenticateWithEmailAndPassword(email, password);

      // If successful, proceed to delete the user account
      await AuthenticationRepository.instance.deleteAccount();
      await UserRepository.instance.removeUserRecord(userRepo.userModel.value.id); // Assuming there's an ID in the user model

      // Show success snackbar
      _showSnackbar(context, 'Success', 'Your account has been successfully deleted.', ContentType.success);

      // Redirect to login screen
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => const LoginScreen()), // Adjust to your LoginScreen path
        (Route<dynamic> route) => false,
      );
    } catch (e) {
      // If there's an error (wrong credentials, etc.), show an error snackbar
      _showSnackbar(context, 'Error', 'Failed to delete account: ${e.toString()}', ContentType.failure);
    }
  }

  // Method to show snackbar using AwesomeSnackbarContent
  void _showSnackbar(BuildContext context, String title, String message, ContentType type) {
    final snackBar = SnackBar(
      content: AwesomeSnackbarContent(
        title: title,
        message: message,
        contentType: type,
      ),
      backgroundColor: Colors.transparent,
      elevation: 0,
      behavior: SnackBarBehavior.floating,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}

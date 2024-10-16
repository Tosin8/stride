

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:stride/auth/repository/auth_repo.dart';
import 'package:stride/auth/repository/user_repo.dart';
import 'package:stride/model/user_model.dart';

import 'package:stride/screens/shop/home/profile/usertile/personal_data.dart';


class UserProfile extends StatelessWidget {
  final userRepo = UserRepository.instance;
  final authRepo = AuthenticationRepository.instance;

  UserProfile({super.key});

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
                        : const AssetImage('assets/default_profile.png')
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
                    Get.to(() =>  PersonalData(user: user));
                  },
                  text: 'Personal Data',
                  leading: Iconsax.user,
                ),
                // payment card
                Usertile(
                  onTap: () {},
                  subtitle: 'Securely store and manage your payment methods.',
                  text: 'Payment Cards',
                  leading: Iconsax.card,
                ),
                // addresses
                 // 
                 
                Usertile(
                  onTap: () {},
                  subtitle: 'Save your delivery addresses along with your beneficiaries.',
                  text: 'Addresses',
                  leading: Iconsax.house_2,
                ),
                // settings
                Usertile(
                  subtitle:
                      'Customize your app preferences, privacy, and options.',
                  onTap: () {},
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
               onTap: (){}, 
               text: 'Pending Reviews', leading: Iconsax.activity, ), 
                

                const SizedBox(height: 4,) , 
              const Divider(), 
             const SizedBox(height: 4,), 
          
              // personal data
                        Usertile(
               subtitle: 'Find answers to common questions and issues',
               onTap: (){}, 
          text: 'FAQs', leading: Icons.question_answer, ), 
          
                // settings 
                                 Usertile(
                subtitle: 'Get help and support for any inquiries.',
              onTap: (){}, 
               text: 'Customer Care', leading: Icons.phone, ),

                const SizedBox(height: 4,) , 
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
                        await authRepo.deleteAccount();
                      }
                    },
                    child: Container(
                      height: 50,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: Colors.red,
                          )),
                      child: const Align(
                        child: Text(
                          'Delete Account',
                          style: TextStyle(
                              color: Colors.red,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
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
    ) ??
        false;
  }
}

class Usertile extends StatelessWidget {
  const Usertile({
    super.key,
    required this.text,
    required this.subtitle,
    this.onTap,
    required this.leading,
  });

  final String text;
  final String subtitle;
  final void Function()? onTap;
  final IconData leading;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ListTile(
        leading: Container(
          height: 38,
          width: 38,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            color: Colors.white,
          ),
          child: Icon(
            leading,
            color: Colors.black,
          ),
        ),
        title: Text(
          text,
          style: const TextStyle(fontWeight: FontWeight.w500),
        ),
        subtitle: Text(
          subtitle,
          style: const TextStyle(fontSize: 13),
        ),
        trailing: const Icon(Iconsax.arrow_right),
      ),
    );
  }
}

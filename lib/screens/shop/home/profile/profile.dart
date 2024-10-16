// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:iconsax/iconsax.dart';

import 'package:stride/screens/shop/home/profile/usertile/personal_data.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const ListTile(
                leading: CircleAvatar(
                  radius: 30, 
                  backgroundColor: Colors.grey,
                  
                ),
                title: Text('John Doe', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),),
                subtitle: Text('johndoe@gmail.com'),
              ), 
          
              const SizedBox(height: 4,) , 
              const Divider(), 
              const SizedBox(height: 4,), 
          
              // personal data
              Usertile(
                subtitle: 'Manage your account details here',
                onTap: (){
                  Get.to(() => const PersonalData()); 
                }, 
                text: 'Personal Data', leading: Iconsax.user, ), 
          
          // payment card
           Usertile(
                onTap: (){}, 
                subtitle: 'Securely store and manage your payment methods.',
                text: 'Payment Cards', leading: Iconsax.card, ), 
                // settings 
                Usertile(
                  subtitle: 'Customize your app preferences, privacy and options.',
                onTap: (){}, 
                text: 'Settings', leading: Iconsax.setting, ), 
                
                // cart
                Usertile(
                  subtitle: 'View your purchase history and track orders',
                onTap: (){}, 
                text: 'Orders ', leading: Iconsax.shopping_bag, ),
                
                // notification
                 Usertile(
                  subtitle: 'Stay updated with important alerts and messages.',
                onTap: (){}, 
                text: 'Notifications', leading: Iconsax.message, ), 

                // pending review
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
          
              // personal data
              Usertile(
                subtitle: 'Log out of your account.',
                onTap: (){}, 
              text: 'Log Out', leading: Icons.exit_to_app, ),
              const SizedBox(height: 10,), 
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: (){},
                  child: Container(
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: Colors.red, 
                      )
                    ),
                    child: const Align(child: Text('Delete Account', style: TextStyle(color: Colors.red, fontSize: 16, fontWeight: FontWeight.bold),)),
                  ),
                ),
              ), 
            ],
          ),
        ),
      ),
    );
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
        leading:  Container(
          height: 38, width: 38, 
          decoration:  BoxDecoration(
            border: Border.all(
 color: Colors.black
            ),
            borderRadius: const BorderRadius.all(Radius.circular(8)),
              color: Colors.white, 
          ),
          child: Icon(leading, color: Colors.black,)), 
        title: Text(text, style: const TextStyle(fontWeight: FontWeight.w500),),
        subtitle: Text(subtitle, style: const TextStyle(fontSize: 13),),
        
        trailing: const Icon(Iconsax.arrow_right),
      ),
    );
  }
}

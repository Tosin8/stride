// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
          
              const SizedBox(height: 12,) , 
              const Divider(), 
              const SizedBox(height: 10,), 
          
              // personal data
              Usertile(
                onTap: (){
                  Get.to(() => const PersonalData()); 
                }, 
                text: 'Personal Data', leading: Iconsax.user, ), 
          
          // payment card
           Usertile(
                onTap: (){}, 
                text: 'Payment Cards', leading: Iconsax.card, ), 
                // settings 
                Usertile(
                onTap: (){}, 
                text: 'Settings', leading: Iconsax.setting, ), 
                
                // cart
                Usertile(
                onTap: (){}, 
                text: 'Orders ', leading: Iconsax.shopping_bag, ),
                
                // notification
                 Usertile(
                onTap: (){}, 
                text: 'Notifications', leading: Iconsax.message, ), 

                // pending review
                 Usertile(
                onTap: (){}, 
                text: 'Pending Reviews', leading: Iconsax.activity, ), 
                

                const SizedBox(height: 12,) , 
              const Divider(), 
              const SizedBox(height: 10,), 
          
              // personal data
              Usertile(
                onTap: (){}, 
              text: 'FAQs', leading: Icons.question_answer, ), 
          
                // settings 
                Usertile(
                onTap: (){}, 
                text: 'Customer Care', leading: Icons.phone, ),

                const SizedBox(height: 12,) , 
              const Divider(), 
              const SizedBox(height: 10,), 
          
              // personal data
              Usertile(
                onTap: (){}, 
              text: 'Log Out', leading: Icons.exit_to_app, ),
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
    this.onTap,
    required this.leading,
  
  });

final String text; 
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
        
        trailing: const Icon(Iconsax.arrow_right),
      ),
    );
  }
}

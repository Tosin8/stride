// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';



import '../../utils/helpers/helper_function.dart';
import '../../utils/widgets/constants/images_c.dart';
import '../controllers/verity_mail_c.dart';
import '../repository/auth_repo.dart';




class VerifyMail extends StatelessWidget {
  const VerifyMail({
    super.key,
    this.email,
  });

final String? email; 
  @override
  Widget build(BuildContext context) {

    final controller = Get.put(VerifyMailController()); 

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () => AuthenticationRepository.instance.logout(),  icon: const Icon(CupertinoIcons.clear))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:  const EdgeInsets.all(15), 
          child: Column(
            children: [
              // Image
              Image(image: const AssetImage(SImages.deliveredEmailllustration), 
              width: BHelperFunctions.screenWidth() * 0.6,
              ), 
              const SizedBox(height: 20,),

              /// title and subtitle
              Text('BTexts.confirmEmail', 
              style: Theme.of(context).textTheme.headlineMedium,
               textAlign: TextAlign.center,), 
               const SizedBox(height: 15,), 

               Text(email ?? '', 
                style: Theme.of(context).textTheme.labelLarge,textAlign: TextAlign.center), 

                  const SizedBox(height: 15,), 
                  Text('BTexts.confirmEmailSubTitle', 
              style: Theme.of(context).textTheme.labelMedium,
               textAlign: TextAlign.center,),
               const SizedBox(height:15,), 

               ///Button
               SizedBox(width: double.infinity, 
               child: ElevatedButton(
                onPressed: () => 
                  controller.checkEmailVerificationStatus(), 
               
                child: const Text('Kindly Continue'), 
                ),), 


               const SizedBox(height: 20,), 
                SizedBox(width: double.infinity, 
               child: TextButton(onPressed: () => controller.sendEmailVerification(),
                child: const Text('BTexts.resendEmail'), 
                ),), 


            ],
          ),),
      ),
    );
  }
}

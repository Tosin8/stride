import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/widgets/constants/images_c.dart';
import '../controllers/verity_mail_c.dart';

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
      // appBar: AppBar(
      //   automaticallyImplyLeading: false,
      //   actions: [
      //     IconButton(
      //       onPressed: () => AuthenticationRepository.instance.logout(),
      //       icon: const Icon(CupertinoIcons.clear),
      //     ),
      //   ],
      // ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.05), // Responsive padding
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween, 
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Image
              Image(
                image: const AssetImage(SImages.deliveredEmailllustration),
                width: MediaQuery.of(context).size.width * 0.6,
              ),
 

              // Title and subtitle
              Text(
                'Verify your email address',
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 15),

              Text(
                email ?? '',
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width * 0.05, // Responsive font size
                  fontWeight: FontWeight.normal,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 15),
              const Text(
                'Congratulations! Your Account Awaits. \nVerify Your Email to Start Shopping and Experience a World of Unrivaled Deals and Personalized Offers.',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w300, color: Colors.black),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 15),

              // Verify Email Button
              SizedBox(
                width: double.infinity,
                child: GestureDetector(
                  onTap: () => controller.checkEmailVerificationStatus(),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.07, // Responsive height
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Align(
                      child: Text(
                        'Verify Email',
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.w400, fontSize: 20),
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: GestureDetector(
                  onTap: () => controller.sendEmailVerification(),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.07, // Responsive height
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Align(child: Text('Resend Email')),
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

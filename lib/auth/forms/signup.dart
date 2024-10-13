import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:stride/auth/controllers/signup_c.dart';
import 'package:stride/utils/validators/validations.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignupController());
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 30.h, horizontal: 30.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () => Get.back(),
                      child: Icon(
                        Iconsax.close_circle,
                        color: Colors.black,
                        size: 30.sp,
                      ),
                    ),
                    Text(
                      'Stride',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 30.sp,
                        fontFamily: 'Maturascript',
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.h),
                // Title
                Text(
                  'Create Account',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 10.h),
                Text(
                  'Fill your information \nbelow to create an account',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: 20.h),
                // Form
                Form(
                  key: controller.signupFormKey,
                  child: Column(
                    children: [
                      // First and Last Name Row
                      Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              controller: controller.firstName,
                              validator: (value) =>
                                  BValidator.validateEmptyText('First Name', value),
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.name,
                              expands: false,
                              decoration: InputDecoration(
                                labelText: 'First Name',
                                prefixIcon: const Icon(Iconsax.user),
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.r)),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 15.w),
                          Expanded(
                            child: TextFormField(
                              controller: controller.lastName,
                              validator: (value) =>
                                  BValidator.validateEmptyText('Last Name', value),
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.name,
                              expands: false,
                              decoration: InputDecoration(
                                labelText: 'Last Name',
                                prefixIcon: const Icon(Iconsax.user),
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.r)),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 15.h),
                      // Username Field
                      TextFormField(
                        controller: controller.username,
                        validator: (value) =>
                            BValidator.validateEmptyText('User Name', value),
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                          labelText: 'UserName',
                          prefixIcon: const Icon(Iconsax.user),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10.r)),
                          ),
                        ),
                      ),
                      SizedBox(height: 15.h),
                      // Email Field
                      TextFormField(
                        controller: controller.email,
                        validator: (value) => BValidator.validateEmail(value),
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          labelText: 'Email',
                          prefixIcon: const Icon(Iconsax.direct),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10.r)),
                          ),
                        ),
                      ),
                      SizedBox(height: 10.h),
                      // Phone Number Field
                      TextFormField(
                        controller: controller.phoneNumber,
                        validator: (value) => BValidator.validatePhoneNumber(value),
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          labelText: 'Phone Number',
                          prefixIcon: const Icon(Iconsax.call),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10.r)),
                          ),
                        ),
                      ),
                      SizedBox(height: 10.h),
                      // Password Field
                      Obx(
                        () => TextFormField(
                          controller: controller.password,
                          validator: (value) => BValidator.validatePassword(value),
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: controller.hidePassword.value,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(10.r)),
                            ),
                            labelText: 'Password',
                            prefixIcon: const Icon(Iconsax.password_check),
                            suffixIcon: IconButton(
                              onPressed: () => controller.hidePassword.value =
                                  !controller.hidePassword.value,
                              icon: Icon(controller.hidePassword.value
                                  ? Iconsax.eye_slash
                                  : Iconsax.eye),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 30.h),
                      // Terms and Conditions Checkbox
                      const TermsAndConditionCheckbox(),
                      SizedBox(height: 20.h),
                      // Create Account Button
                      GestureDetector(
                        onTap: () => controller.signup(),
                        child: Container(
                          height: 50.h,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          child: Align(
                            child: controller.isLoading.value
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CircularProgressIndicator(color: Colors.white),
                  const SizedBox(width: 10),
                  Text(
                    'Creating your account',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 20.sp,
                    ),
                  ),
                ],
              )
            : Text(
                              'Create Account',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                                fontSize: 20.sp,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TermsAndConditionCheckbox extends StatelessWidget {
  const TermsAndConditionCheckbox({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignupController());

    return Row(
      children: [
        SizedBox(
          width: 24.w,
          height: 24.h,
          child: Obx(
            () => Checkbox(
              value: controller.privacyPolicy.value,
              onChanged: (value) =>
                  controller.privacyPolicy.value = !controller.privacyPolicy.value,
            ),
          ),
        ),
        SizedBox(width: 10.w),
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: '${'I Agree to'} ',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              TextSpan(
                text: 'Privacy Policy',
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .apply(color: Colors.black, decoration: TextDecoration.underline),
              ),
              TextSpan(
                text: ' ${'and'} ',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              TextSpan(
                text: 'terms of use',
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .apply(color: Colors.black, decoration: TextDecoration.underline),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

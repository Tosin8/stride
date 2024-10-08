import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stride/auth/controllers/login_c.dart';
import 'package:stride/auth/forms/signup.dart';
import '../../utils/validators/validations.dart';
import 'forgotpwd.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());

    // Correctly passing the child widget into the builder parameter
    return ScreenUtilInit(
      designSize: const Size(360, 690), // Base size for responsiveness
      builder: (context, child) {
        return SafeArea(
          child: Scaffold(
            body: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 50.h, // Scaling for height
                  horizontal: 30.w, // Scaling for width
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'Stride',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 30.sp, // Responsive font size
                            fontFamily: 'Maturascript',
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10.h), // Scaled height
                    Text(
                      'Sign In',
                      style: TextStyle(
                          fontSize: 24.sp, // Responsive font size
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                    ),
                    SizedBox(height: 10.h),
                    Text(
                      'Welcome back, \nkindly sign in to your account',
                      style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w400),
                    ),
                    SizedBox(height: 20.h),
                    Form(
                      key: controller.loginFormKey,
                      child: Column(
                        children: [
                          TextFormField(
                            controller: controller.email,
                            validator: (value) => BValidator.validateEmail(value),
                            keyboardType: TextInputType.emailAddress,
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                              prefixIcon: Icon(Iconsax.direct_right, size: 24.r), // Scaled icon size
                              hintText: 'example@host.com',
                              hintStyle: TextStyle(color: Colors.grey, fontSize: 14.sp),
                              labelText: 'Email',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(10.r)),
                              ),
                            ),
                          ),
                          SizedBox(height: 20.h),
                          Obx(
                            () => TextFormField(
                              controller: controller.password,
                              validator: (value) => BValidator.validatePassword(value),
                              textInputAction: TextInputAction.done,
                              keyboardType: TextInputType.visiblePassword,
                              obscureText: controller.hidePassword.value,
                              decoration: InputDecoration(
                                labelText: 'Password',
                                prefixIcon: Icon(Iconsax.password_check, size: 24.r),
                                suffixIcon: IconButton(
                                  onPressed: () => controller.hidePassword.value = !controller.hidePassword.value,
                                  icon: Icon(controller.hidePassword.value
                                      ? Iconsax.eye_slash
                                      : Iconsax.eye, size: 24.r),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(10.r)),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 20.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Obx(() => Checkbox(
                                    value: controller.rememberMe.value,
                                    onChanged: (value) => controller.rememberMe.value = value!,
                                  )),
                                  Text('Remember Me', style: TextStyle(fontSize: 14.sp)),
                                ],
                              ),
                              TextButton(
                                onPressed: () {
                                  Get.to(() => const Forgotpwd());
                                },
                                child: Text('Forget Password?', style: TextStyle(fontSize: 14.sp)),
                              ),
                            ],
                          ),
                          SizedBox(height: 20.h),
                          GestureDetector(
                            onTap: () => controller.emailAndPasswordSignIn(),
                            child: Container(
                              height: 50.h,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(10.r),
                              ),
                              child: Align(
                                child: Text(
                                  'Sign In',
                                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.w400, fontSize: 20.sp),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 20.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Don't have an account?", style: TextStyle(fontSize: 14.sp)),
                              SizedBox(width: 10.w),
                              TextButton(
                                onPressed: () {
                                  Get.to(() => const Signup());
                                },
                                child: Text('Create Account', style: TextStyle(fontSize: 14.sp)),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

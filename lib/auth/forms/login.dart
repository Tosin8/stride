import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
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
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 60.0, horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Sign In',
                style: TextStyle(
                    fontSize: 24, fontWeight: FontWeight.w500, color: Colors.black),
              ),
              const SizedBox(height: 10),
              const Text(
                'Welcome back, \nkindly sign in to your account',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
              ),
              const SizedBox(height: 20),
              Form(
                key: controller.loginFormKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: controller.email,
                      validator: (value) => BValidator.validateEmail(value),
                      keyboardType: TextInputType.emailAddress,
                      
                      textInputAction: TextInputAction.next,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Iconsax.direct_right),
                        hintText: 'example@host.com',
                        hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
                        labelText: 'Email',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)) 
                        ),
                      ),
                    ),
                    const SizedBox( height: 20), 
                    // Password
                    Obx(
                      () => TextFormField(
                        controller: controller.password,
                        validator: (value) => BValidator.validatePassword(value),
                        textInputAction: TextInputAction.done,
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: controller.hidePassword.value,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          prefixIcon: const Icon(Iconsax.password_check),
                          suffixIcon: IconButton(
                            onPressed: () =>
                                controller.hidePassword.value = !controller.hidePassword.value,
                            icon: Icon(controller.hidePassword.value
                                ? Iconsax.eye_slash
                                : Iconsax.eye),
                          ),
                            border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)) 
                        ),
                        ),
                      ),
                    ),
                         const SizedBox( height: 20), 
                    // Remember Me and Forgot Password
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Remember Me.
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Obx(() => Checkbox(
                                  value: controller.rememberMe.value,
                                  onChanged: (value) =>
                                      controller.rememberMe.value = value!,
                                )),
                            const Text('Remember Me'),
                          ],
                        ),
                        // Forget Password.
                        TextButton(
                          onPressed: () {
                            Get.to(() => const Forgotpwd());
                          },
                          child: const Text('Forget Password?'),
                        ),
                      ],
                    ),
                         const SizedBox( height: 20), 
                    // Sign In Button
                    // SizedBox(
                    //   width: double.infinity,
                    //   child: ElevatedButton(
                    //       onPressed: () => controller.emailAndPasswordSignIn(),
                    //       child: const Text('Sign In')),
                    // ),
GestureDetector( 
  onTap: () => controller.emailAndPasswordSignIn(),
  child:  Container( 
    height: 50 , width: double.infinity,  
    decoration: BoxDecoration(color: Colors.black, 
    borderRadius: BorderRadius.circular(10)
    ), 
    child: const Align(child: Text('Sign In', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w400, fontSize: 20),),),
  ),
), 

                    // Create Account
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Don\'t have an account?'),
                        const SizedBox(width: 10),
                        TextButton(
                            onPressed: () {
                              Get.to(() => const Signup());
                            },
                            child: const Text('Create Account')),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

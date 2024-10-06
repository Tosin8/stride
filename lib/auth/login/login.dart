import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        body: Container( 
          child:  Padding(
            padding: const EdgeInsets.symmetric(vertical: 60.0, horizontal: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Sign In',
                 style: TextStyle(
                  fontSize: 24, 
                  fontWeight: FontWeight.w500, color: Colors.black),),
                  const SizedBox(height: 10,),  
                const Text('Welcome back, \nkindly sign in to your account', 
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),), 
                const SizedBox(height: 20,),  
          
               Form(child: Column(
                children: [
              
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    decoration: const InputDecoration(  
                      hintText: 'example@host.com',
                      hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
                      labelText: 'Email', 
                      border: OutlineInputBorder(),)
                  ), 
                ],
               ))
              ]
            ),
          )
         ), 
      
      ),
    );
  }
}
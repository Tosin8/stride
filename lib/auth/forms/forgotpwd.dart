import 'package:flutter/material.dart';

class Forgotpwd extends StatefulWidget {
  const Forgotpwd({super.key});

  @override
  State<Forgotpwd> createState() => _ForgotpwdState();
}

class _ForgotpwdState extends State<Forgotpwd> {
  @override
  Widget build(BuildContext context) {
    return Scaffold (
body: Container (
child: Padding (
padding:: const EdgeInsets.symmetric(horizonal:20, vertical:18), 
child:Column (
children:[
Text('Forgot Password'), 
],

), 


), 

), 

);
  }
}
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CallUs extends StatefulWidget {
  const CallUs({super.key});

  @override
  State<CallUs> createState() => _CallUsState();
}

class _CallUsState extends State<CallUs> {

   final String phoneNumber = '1234567890'; // Replace with your phone 
   
   void _launchDialer() async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    if (await canLaunch(launchUri.toString())) {
      await launch(launchUri.toString());
    } else {
      throw 'Could not launch $launchUri';
    }
  }
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
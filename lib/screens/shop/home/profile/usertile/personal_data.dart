import 'package:flutter/material.dart';

class PersonalData extends StatefulWidget {
  const PersonalData({super.key});

  @override
  State<PersonalData> createState() => _PersonalDataState();
}

class _PersonalDataState extends State<PersonalData> {
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(  
        appBar: AppBar( 
          title: const Text('Personal Data'), 
          centerTitle: true,
        ),

        body: const Column(
          children: [],
        )
      ),
    );
  }
}
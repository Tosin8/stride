import 'package:flutter/material.dart';

class Livechat extends StatefulWidget {
  const Livechat({super.key});

  @override
  State<Livechat> createState() => _LivechatState();
}

class _LivechatState extends State<Livechat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        title: const Text('Live Chat')
      ),
      bottomSheet: Container(
        height: 50,
        color: Colors.black,
        child: const Center(
          child: Text('Powered by Stride', style: TextStyle(color: Colors.white),),
        ),
      ),
    ) ;
  }
}
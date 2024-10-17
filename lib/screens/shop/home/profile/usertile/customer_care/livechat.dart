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
        title: const Text('Live Chat')
      ),
    ) ;
  }
}

import 'package:flutter/material.dart';

class HeaderTitle extends StatelessWidget {
  const HeaderTitle({
    required this.text, 
    super.key,
  });

final String text; 
  @override
  Widget build(BuildContext context) {
    return  Text(text, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),);
  }
}

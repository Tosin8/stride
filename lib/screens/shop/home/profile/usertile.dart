
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class Usertile extends StatelessWidget {
  const Usertile({
    super.key,
    required this.text,
    required this.subtitle,
    this.onTap,
    required this.leading,
  });

  final String text;
  final String subtitle;
  final void Function()? onTap;
  final IconData leading;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ListTile(
        leading: Container(
          height: 38,
          width: 38,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            color: Colors.white,
          ),
          child: Icon(
            leading,
            color: Colors.black,
          ),
        ),
        title: Text(
          text,
          style: const TextStyle(fontWeight: FontWeight.w500),
        ),
        subtitle: Text(
          subtitle,
          style: const TextStyle(fontSize: 13),
        ),
        trailing: const Icon(Iconsax.arrow_right),
      ),
    );
  }
}

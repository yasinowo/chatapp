import 'package:flutter/material.dart';

class ButtonGlobal extends StatelessWidget {
  final void Function()? onTap;
  final String text;

  const ButtonGlobal({
    super.key,
    required this.text,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(8),
        ), // BoxDecoration
        padding: const EdgeInsets.all(25),
        margin: const EdgeInsets.symmetric(horizontal: 25),
        child: Center(
          child: Text(text),
        ), // Center
      ), // Container
    ); // GestureDetector
  }
}

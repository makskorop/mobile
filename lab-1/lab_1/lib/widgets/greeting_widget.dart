import 'package:flutter/material.dart';

class GreetingWidget extends StatelessWidget {
  final String name;

  const GreetingWidget({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Text(
      'Привіт, $name!',
      style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
    );
  }
}
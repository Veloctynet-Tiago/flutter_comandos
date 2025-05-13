import 'package:flutter/material.dart';

class ListOfText extends StatelessWidget {
  final String textFormatation;
  const ListOfText({super.key, required this.textFormatation});

  @override
  Widget build(BuildContext context) {
    return Text(textFormatation, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold));
  }
}
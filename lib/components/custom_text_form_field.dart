import 'package:flutter/material.dart';

final class CustomTextFormField extends StatelessWidget {
  final String labeltext;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final String? hintText;

  const CustomTextFormField(
      {super.key,
      required this.labeltext,
      required this.controller,
      required this.keyboardType,
      this.hintText});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        border: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blue),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blue),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blue),
        ),
        labelStyle: const TextStyle(color: Colors.blue),
        focusColor: Colors.blue,
        fillColor: Colors.blue,
        hoverColor: Colors.blue,
        floatingLabelStyle: const TextStyle(color: Colors.blue),
        helperStyle: const TextStyle(color: Colors.blue),
        labelText: labeltext,
      ),
    );
  }
}

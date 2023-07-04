import 'package:flutter/material.dart';

class CustomTextFieldYeniHareket extends StatelessWidget {
  final String hinttext;
  final String labeltext;
  final void Function(String)? onChanged;
  final TextEditingController mycontroller;
  const CustomTextFieldYeniHareket({
    super.key,
    required this.hinttext,
    required this.labeltext,
    this.onChanged,
    required this.mycontroller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: mycontroller,
      decoration: InputDecoration(
        labelText: labeltext,
        hintText: hinttext,
        errorStyle: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
      ),
      keyboardType: TextInputType.name,
      validator: (String? text) {
        text = text!.trim();
        if (text.isEmpty) {
          return '';
        }
        return null;
      },
    );
  }
}

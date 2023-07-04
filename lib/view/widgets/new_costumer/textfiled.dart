import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final IconData icon;
  final String hinttext;
  final String labeltext;
  final void Function()? onPressedSearch;
  final void Function()? onPressedFavorite;
  final void Function(String)? onChanged;
  final TextEditingController mycontroller;
  const CustomTextField(
      {super.key,
      required this.hinttext,
      required this.labeltext,
      this.onPressedSearch,
      this.onPressedFavorite,
      this.onChanged,
      required this.mycontroller,
      required this.icon});

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
        icon: Icon(
          icon,
          color: Theme.of(context).primaryColor,
          size: 26,
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

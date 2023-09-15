// ignore_for_file: must_be_immutable, use_key_in_widget_constructors

import 'package:flutter/material.dart';

class CustomTextFiled extends StatelessWidget {
  CustomTextFiled({
    required this.prefixIcon,
    required this.label,
    required this.inputText,
    required this.validate,
    @required this.onTap,
    @required this.controller,
    @required this.onChange,
  });

  IconData prefixIcon;
  String label;
  TextInputType inputText;
  String? Function(String?) validate;
  VoidCallback? onTap;
  TextEditingController? controller;
  Function(String?)? onChange;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: onTap,
      onChanged: onChange,
      validator: validate,
      decoration: InputDecoration(
        prefix: Icon(prefixIcon),
        label: Text(label),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
      ),
      controller: controller,
      keyboardType: inputText,
    );
  }
}

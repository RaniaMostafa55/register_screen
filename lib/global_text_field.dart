import 'package:flutter/material.dart';

class GlobalTextField extends StatelessWidget {
  final TextInputAction action;
  final TextInputType type;
  final TextEditingController controller;
  final IconData prefix;
  final String hint;
  final String label;
  final String? Function(String?)? validator;
  final bool? isSecure;
  final void Function()? onSuffixTap;
  final IconData? suffix;

  const GlobalTextField(
      {super.key,
      required this.action,
      required this.type,
      required this.controller,
      required this.prefix,
      required this.hint,
      required this.label,
      this.validator,
      this.isSecure = false,
      this.onSuffixTap,
      this.suffix});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        obscureText: isSecure!,
        textInputAction: action,
        keyboardType: type,
        controller: controller,
        decoration: InputDecoration(
          fillColor: Colors.grey[200],
          filled: true,
          prefixIcon: Icon(
            prefix,
            color: Colors.purple,
          ),
          hintText: hint,
          label: Text(label),
          border: InputBorder.none,
          enabledBorder: InputBorder.none,
          suffixIcon: IconButton(
            onPressed: onSuffixTap,
            icon: Icon(
              suffix,
            ),
          ),
        ),
        validator: validator);
  }
}

import 'package:flutter/material.dart';


class DefaultTextFormField extends StatelessWidget {
   DefaultTextFormField({
    required this.controller,
    required this.type,
    this.validate,
    required this.hintText,
     this.suffixIcon,
  });

  final TextEditingController controller;
  final TextInputType type;
  final String? Function(String? val)? validate;
  final String hintText;
  final IconData? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            spreadRadius: 1,
            blurRadius: 7,
            offset: Offset(2, 3),
          ),
        ],
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextFormField(
        controller: controller,
        keyboardType: type,
        validator: validate,
        decoration: InputDecoration(
          hintText: hintText,
          filled: true,
          fillColor: Colors.white,
          suffixIcon: Icon(suffixIcon),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}

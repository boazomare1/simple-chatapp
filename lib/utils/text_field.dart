import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final bool obscureText;
  final String hintText;
  final TextEditingController controller;
  const MyTextField(
      {super.key,
      required this.obscureText,
      required this.hintText,
      required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
            fillColor: Colors.white,
            filled: true,
            hintText: hintText,
            hintStyle: const TextStyle(
              fontSize: 18,
            ),
            enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(
              color: Colors.black,
            )),
            focusedBorder:  OutlineInputBorder(
                borderSide: BorderSide(color: Colors.green.shade200))),
      ),
    );
  }
}

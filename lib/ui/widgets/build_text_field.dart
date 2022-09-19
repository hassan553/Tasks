import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  dynamic controller;
  dynamic validator;
  dynamic hint;

  CustomTextField({
    Key? key,
    this.controller,
    this.validator,
    this.hint,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.text,
      controller: controller,
      validator: validator,
      style: const TextStyle(
        color: Colors.black,
        fontSize: 14,
      ),
      onFieldSubmitted: (value) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      maxLines: null,
      cursorColor: Colors.blue,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white30,
        border: InputBorder.none,
        hintText: hint,
        hintStyle:const  TextStyle(
          color: Colors.white,
          fontSize: 14,
        ),
      ),
    );
  }
}

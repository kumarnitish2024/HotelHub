import 'package:flutter/material.dart';

class AppWidgets{
  Widget editText(String hint, TextEditingController controller){
    return TextFormField(
      decoration: InputDecoration(
        hintText: hint,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))
      ),
    );
  }
}
import 'package:flutter/material.dart';

class HomeWidget {
  BuildContext context;
  HomeWidget({required this.context});
  Widget textField(TextEditingController controller, String hintText) {
    return SizedBox(
      height: 48,
      child: TextField(
        decoration: InputDecoration(
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(40)),
          ),
          hintText: hintText,
          prefixIcon: IconButton(icon: const Icon(Icons.search),
            onPressed: () {

            },
          )
        ),
      ),
    );
  }
}


import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  String? hintText;
  String? labelText;
  bool isPass;
  TextEditingController? controller;
  String? Function(String?)? validate;
  Widget? IconData;
  MyTextField(
      {super.key,
      this.hintText,
      this.labelText,
      this.isPass = false,
      this.controller,
      this.validate,
      this.IconData});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: controller,
        validator: validate,
        obscureText: isPass == false ? isPass : isPass == true,
        decoration: InputDecoration(
          icon: IconData,
          hintText: hintText ?? "Hint Text",
          label: Text(labelText ?? "label"),
          floatingLabelAlignment: FloatingLabelAlignment.center,
          floatingLabelStyle: TextStyle(color: Colors.black),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          focusedBorder:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.green)),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
        ),
      ),
    );
  }
}

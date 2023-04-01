import 'package:flutter/material.dart';

class DeleteProduct extends StatelessWidget {
  const DeleteProduct({super.key});
  static String id = "deleteproduct";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("$id"),
      ),
    );
  }
}

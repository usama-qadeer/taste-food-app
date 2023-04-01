import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  VoidCallback? onPress;
  bool? isLoading;
  String? btnText;
  MyButton({super.key, this.isLoading = false, this.onPress, this.btnText});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: 300,
      child: TextButton(
        onPressed: onPress,
        child: Text(
          "$btnText",
          style: TextStyle(fontSize: 20, color: Colors.green),
        ),
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
                side: BorderSide(width: 2, color: Colors.green)),
          ),
          backgroundColor: MaterialStateProperty.all(Colors.white),
        ),
      ),
    );
  }
}

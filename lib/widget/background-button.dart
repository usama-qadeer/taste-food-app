import 'package:flutter/material.dart';

class BackgroundButton extends StatelessWidget {
  VoidCallback? onPress;
  bool? isLoading;
  String? btnText;
  BackgroundButton(
      {super.key, this.onPress, this.isLoading = false, this.btnText});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: 300,
      child: TextButton(
        onPressed: onPress,
        child: Text(
          "$btnText",
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          backgroundColor: MaterialStateProperty.all(Colors.green),
        ),
      ),
    );
  }
}

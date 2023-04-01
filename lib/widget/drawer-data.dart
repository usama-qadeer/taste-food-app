import 'package:flutter/material.dart';

class DrawerData extends StatelessWidget {
  String? name;
  IconData? icon;
  VoidCallback? onPress;
  DrawerData({
    super.key,
    this.icon,
    this.name,
    this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: ListTile(
        leading: Icon(
          icon,
          color: Colors.white,
        ),
        title: Text(
          "$name",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
    );
  }
}

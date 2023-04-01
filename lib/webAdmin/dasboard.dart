import 'package:flutter/material.dart';

class WebDashboard extends StatelessWidget {
  const WebDashboard({super.key});
  static String id = "dashboard";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("$id"),
      ),
    );
  }
}

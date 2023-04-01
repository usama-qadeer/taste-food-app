import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:food_ordering/screen/auth-check.dart';
import 'package:food_ordering/webAdmin/web-body.dart';
import 'package:food_ordering/webAdmin/web-login.dart';

class LayoutScreen extends StatelessWidget {
  const LayoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 850) {
          return WebLogin();
        } else {
          return AuthCheck();
        }
      },
    );
  }
}

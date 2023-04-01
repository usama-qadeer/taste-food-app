import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_ordering/screen/login-page.dart';
import 'package:food_ordering/widget/myTextField.dart';
import 'package:food_ordering/widget/simpleButton.dart';

class ForgotPassword extends StatefulWidget {
  ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  TextEditingController _mailC = TextEditingController();

  final formKey = GlobalKey<FormState>();

  // submit() {
  //   if (formKey.currentState!.validate()) {}
  // }
  Future<void> resetPassword(String email) async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: email)
          .then((value) => Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => LoginPage(),
              )));
      // Password reset email sent successfully
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("User with this email doesn't exist")));
        // User with this email doesn't exist
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(e.toString())));
      }
    } catch (e) {
      // Handle other errors
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(0, 200, 0, 0),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              MyTextField(
                controller: _mailC,
                validate: (p0) {
                  if (p0!.isEmpty) {
                    return "Enter a e-mail";
                  }
                  return null;
                },
                hintText: "Enter Register e-mail",
                labelText: "Enter Register e-mail",
              ),
              MyButton(
                btnText: "Forgot",
                onPress: () {
                  resetPassword(_mailC.text);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

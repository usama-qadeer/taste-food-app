import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:food_ordering/firebase-work/firebase-work.dart';
import 'package:food_ordering/widget/background-button.dart';
import 'package:food_ordering/widget/myTextField.dart';
import 'package:food_ordering/widget/simpleButton.dart';

class SignupScreen extends StatefulWidget {
  SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController _nameC = TextEditingController();

  TextEditingController _mailC = TextEditingController();

  TextEditingController _passC = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  bool formStateLoding = false;

  Future<void> ecoDialogue(String error, BuildContext context) async {
    showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            title: Text(error),
            actions: [
              MyButton(
                btnText: "Close",
                onPress: () {
                  Navigator.pop(context);
                },
              ),
            ],
          );
        });
  }

  submit(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      if (_passC.text.length >= 6) {
        setState(() {
          formStateLoding = true;
        });
        String? acctStatus =
            await FirebaseWork.signupAcct(_mailC.text, _passC.text)
                .whenComplete(() {
          _nameC.clear();
          _passC.clear();
          _mailC.clear();
        });
        if (acctStatus != null) {
          ecoDialogue(acctStatus, context);
          setState(() {
            formStateLoding = false;
          });
        } else {
          _nameC.clear();
          _mailC.clear();
          _passC.clear();
          //_confirmPass.clear();
          Navigator.pop(context);
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(50, 70, 0, 0),
              child: Material(
                elevation: 2,
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white24,
                      borderRadius: BorderRadius.circular(50)),
                  height: 500,
                  width: 400,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Register.",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ),
                          MyTextField(
                            controller: _nameC,
                            validate: (p0) {
                              if (p0!.isEmpty) {
                                return "Enter your name";
                              }
                              return null;
                            },
                            hintText: "Full Name",
                            labelText: "Full Name",
                          ),
                          MyTextField(
                            controller: _mailC,
                            validate: (p0) {
                              if (p0!.isEmpty) {
                                return "Enter e-mail";
                              }
                              return null;
                            },
                            hintText: "Enter e-mail",
                            labelText: "Enter e-mail",
                            isPass: false,
                          ),
                          MyTextField(
                            controller: _passC,
                            validate: (p0) {
                              if (p0!.isEmpty) {
                                return "Enter Password";
                              }
                              return null;
                            },
                            hintText: "Enter Password",
                            labelText: "Enter Password",
                            isPass: true,
                          ),
                          // Padding(
                          //   padding: const EdgeInsets.all(8.0),
                          //   child: Text("Forgot Password?"),
                          // ),
                          BackgroundButton(
                            btnText: "Sign Up",
                            onPress: () => submit(context),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            MyButton(
                              btnText: "Login ",
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

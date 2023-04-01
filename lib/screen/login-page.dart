import 'package:flutter/material.dart';
import 'package:food_ordering/firebase-work/firebase-work.dart';
import 'package:food_ordering/screen/forgot-pass.dart';
import 'package:food_ordering/screen/home-page.dart';
import 'package:food_ordering/screen/signup-page.dart';
import 'package:food_ordering/widget/background-button.dart';
import 'package:food_ordering/widget/myTextField.dart';
import 'package:food_ordering/widget/simpleButton.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
                btnText: 'CLOSE',
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
      setState(() {
        formStateLoding = true;
      });
      String? acctStatus =
          await FirebaseWork.loginAcct(_mailC.text, _passC.text);
      if (acctStatus != null) {
        ecoDialogue(acctStatus, context);
        setState(() {
          formStateLoding = false;
        });
      } else {
        Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            return HomePage();
          },
        ));
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
                              "Login.",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ),
                          MyTextField(
                            controller: _mailC,
                            validate: (p0) {
                              if (p0!.isEmpty) {
                                return "Enter a valid email";
                              }
                              return null;
                            },
                            hintText: "Enter e-mail",
                            labelText: "Enter e-mail",
                          ),
                          MyTextField(
                            controller: _passC,
                            validate: (p0) {
                              if (p0!.isEmpty) {
                                return "Enter a password";
                              }
                              return null;
                            },
                            hintText: "Enter Password",
                            labelText: "Enter Password",
                            isPass: true,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => ForgotPassword(),
                                      ));
                                },
                                child: Text("Forgot Password?")),
                          ),
                          BackgroundButton(
                            btnText: "Login",
                            onPress: () => submit(context),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            MyButton(
                              btnText: "Sign Up",
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

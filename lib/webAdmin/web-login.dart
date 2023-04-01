import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_ordering/firebase-work/firebase-work.dart';
import 'package:food_ordering/webAdmin/web-body.dart';
import 'package:food_ordering/widget/background-button.dart';
import 'package:food_ordering/widget/myTextField.dart';

class WebLogin extends StatefulWidget {
  WebLogin({super.key});

  @override
  State<WebLogin> createState() => _WebLoginState();
}

class _WebLoginState extends State<WebLogin> {
  TextEditingController uname = TextEditingController();
  TextEditingController passC = TextEditingController();

  final formKey = GlobalKey<FormState>();

  bool formStateLoding = false;

  submit(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      setState(() {
        formStateLoding = true;
      });
      await FirebaseWork.signInAnonymously(uname.text).then((value) async {
        if (value["password"] == passC.text && value["usama"] == uname.text) {
          UserCredential userCredential =
              await FirebaseAuth.instance.signInAnonymously().whenComplete(() {
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Admin Login Successfully")));
          });
          try {
            if (userCredential != null) {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => WebBody(),
                  ));
            } else {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => WebLogin(),
                  ));
            }
          } on FirebaseAuthException catch (e) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(e.toString())));
            setState(() {
              formStateLoding = false;
            });
            return (e.message);

            //print(e);
          } catch (e) {
            return e.toString();
          }
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          decoration:
              BoxDecoration(border: Border.all(width: 2, color: Colors.black)),
          width: 500,
          height: 500,
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Welcome Back Admin",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Login to continue",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                MyTextField(
                  controller: uname,
                  validate: (p0) {
                    if (p0!.isEmpty) {
                      return " Enter User name";
                    }
                    return null;
                  },
                  hintText: "Enter user name",
                  labelText: "Enter user name",
                ),
                MyTextField(
                  controller: passC,
                  validate: (p0) {
                    if (p0!.isEmpty) {
                      return " Enter Password";
                    }
                    return null;
                  },
                  hintText: "Enter password",
                  labelText: "Password",
                ),
                BackgroundButton(
                  onPress: () {
                    submit(context);
                  },
                  btnText: "Login",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

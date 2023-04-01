import 'package:flutter/material.dart';
import 'package:food_ordering/screen/login-page.dart';
import 'package:food_ordering/screen/signup-page.dart';
import 'package:food_ordering/widget/background-button.dart';
import 'package:food_ordering/widget/simpleButton.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
              child: Container(
            //  color: Colors.amber,
            child: Image.asset('assets/logo.jpg'),
          )),
          Expanded(
            child: Container(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "Welcome to Taste",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                    Text("Order food from our resturant and"),
                    Text("Make reservation in real - time"),
                    BackgroundButton(
                      btnText: "Login",
                      onPress: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginPage(),
                          )),
                    ),
                    MyButton(
                        btnText: "Sign-Up",
                        onPress: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SignupScreen(),
                            ))),
                  ],
                ),
              ),
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}

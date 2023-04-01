import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_ordering/firebase-work/firebase-work.dart';
import 'package:food_ordering/model/category.dart';
import 'package:food_ordering/widget/category-box.dart';
import 'package:food_ordering/widget/drawer-data.dart';
import 'package:food_ordering/widget/myTextField.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(
          backgroundColor: Colors.black,
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                UserAccountsDrawerHeader(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                            "assets/background.jpg",
                          ),
                          fit: BoxFit.cover)),
                  accountName: Text("Usama"),
                  accountEmail:
                      Text(FirebaseAuth.instance.currentUser!.email.toString()),
                  currentAccountPicture: CircleAvatar(
                    backgroundImage: AssetImage(
                      "assets/usama.jpg",
                    ),
                  ),
                ),
                DrawerData(
                  onPress: () {},
                  name: "Profile",
                  icon: Icons.person,
                ),
                DrawerData(
                  onPress: () {},
                  name: "Card",
                  icon: Icons.shopping_cart,
                ),
                DrawerData(
                  onPress: () {},
                  name: "Order",
                  icon: Icons.shop,
                ),
                Divider(
                  color: Colors.white,
                ),
                Text(
                  "Comunicate",
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
                DrawerData(
                  onPress: () {},
                  name: "Changes",
                  icon: Icons.lock,
                ),
                DrawerData(
                  onPress: () => FirebaseWork.sigout(),
                  name: "Logout",
                  icon: Icons.logout,
                ),
              ],
            ),
          ),
        ),
        appBar: AppBar(actions: [
          CircleAvatar(
            backgroundColor: Colors.red,
            backgroundImage: AssetImage("assets/usama.jpg"),
          )
        ]),
        body: Column(
          children: [
            MyTextField(
              hintText: "Search..",
              labelText: "Search",
            ),
            CategoryBox(),
          ],
        ));
  }
}

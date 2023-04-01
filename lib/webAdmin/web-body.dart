import 'package:flutter/material.dart';
import 'package:flutter_admin_scaffold/admin_scaffold.dart';
import 'package:food_ordering/webAdmin/add-product.dart';
import 'package:food_ordering/webAdmin/dasboard.dart';
import 'package:food_ordering/webAdmin/update-product.dart';
import 'package:food_ordering/widget/simpleButton.dart';

class WebBody extends StatefulWidget {
  @override
  State<WebBody> createState() => _WebBodyState();
}

class _WebBodyState extends State<WebBody> {
  Widget selectedScreen = WebDashboard();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("Web Admin Panel"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MyButton(
              onPress: () {},
              btnText: "Dashboard",
            ),
            SizedBox(
              height: 5,
            ),
            MyButton(
              onPress: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AddProduct(),
                    ));
              },
              btnText: "Add Product",
            ),
            SizedBox(
              height: 5,
            ),
            MyButton(
              onPress: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => UpdateProduct(),
                    ));
              },
              btnText: "Update Product",
            ),
            SizedBox(
              height: 5,
            ),
            MyButton(
              onPress: () {},
              btnText: "Delete Product",
            ),
            SizedBox(
              height: 5,
            ),
          ],
        ),
      ),
    );
  }
}

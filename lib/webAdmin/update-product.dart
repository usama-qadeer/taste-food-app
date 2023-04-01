import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:food_ordering/model/product-model.dart';
import 'package:food_ordering/webAdmin/update-complete-process.dart';

class UpdateProduct extends StatefulWidget {
  const UpdateProduct({super.key});
  static String id = "updateproduct";

  @override
  State<UpdateProduct> createState() => _UpdateProductState();
}

class _UpdateProductState extends State<UpdateProduct> {
  String? selectedValue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 400, 0),
            child: Column(
              children: [
                Text("Update Products"),
                Container(
                  height: 500,
                  child: StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection("products")
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      if (snapshot == null) {
                        return Text("NO DATA");
                      }
                      return Container(
                        height: 800,
                        //  decoration: BoxDecoration(color: Colors.black),
                        //padding: EdgeInsets.all(20),
                        child: ListView.builder(
                          itemCount: snapshot.data!.docs.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                decoration: BoxDecoration(color: Colors.black),
                                child: ListTile(
                                  title: Text(
                                    snapshot.data!.docs[index]["name"],
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                  trailing: Container(
                                    width: 200,
                                    child: Row(
                                      //mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        IconButton(
                                          onPressed: () {
                                            Navigator.pushReplacement(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      UpdateCompleteScreen(
                                                    id: snapshot.data!
                                                        .docs[index]["id"],
                                                    productModel: ProductModel(
                                                        category: snapshot.data!.docs[index]
                                                            ["category"],
                                                        id: snapshot.data!.docs[index]
                                                            ["id"],
                                                        name: snapshot.data!.docs[index]
                                                            ["name"],
                                                        details: snapshot.data!.docs[index]
                                                            ["details"],
                                                        price: snapshot.data!.docs[index]
                                                            ["price"],
                                                        dicountPrice: snapshot
                                                                .data!
                                                                .docs[index]
                                                            ["dicountPrice"],
                                                        imageUrl: snapshot.data!
                                                            .docs[index]["imageUrl"],
                                                        isFav: snapshot.data!.docs[index]["isFav"],
                                                        isPopular: snapshot.data!.docs[index]["isPopular"],
                                                        onSale: snapshot.data!.docs[index]["onSale"]),
                                                  ),
                                                ));
                                          },
                                          icon: Icon(Icons.edit),
                                          color: Colors.white,
                                        ),
                                        IconButton(
                                          onPressed: () {
                                            ProductModel.deleteProduct(
                                                snapshot.data!.docs[index].id);
                                          },
                                          icon: Icon(Icons.delete),
                                          color: Colors.white,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

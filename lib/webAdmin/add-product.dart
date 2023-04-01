import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:food_ordering/model/category.dart';
import 'package:food_ordering/model/product-model.dart';
import 'package:food_ordering/widget/background-button.dart';
import 'package:food_ordering/widget/myTextField.dart';
import 'package:food_ordering/widget/simpleButton.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';
import 'package:elegant_notification/elegant_notification.dart';

class AddProduct extends StatefulWidget {
  AddProduct({
    super.key,
  });
  static String id = "addproduct";

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  TextEditingController categoryC = TextEditingController();
  TextEditingController itemC = TextEditingController();
  TextEditingController detailC = TextEditingController();
  TextEditingController priceC = TextEditingController();
  TextEditingController discountC = TextEditingController();

  final formKey = GlobalKey<FormState>();
  String? selectedValue;
  bool onSale = false;
  bool isPopular = false;
  bool isFav = false;
  var uuid = Uuid();

  final imagePicker = ImagePicker();
  List<XFile> images = [];
  bool isUploading = false;
  List<String> imageUrls = [];
  bool isSaving = false;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 400, 0),
        child: Material(
          child: Center(
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Add Product",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 59, 35, 35).withOpacity(0.4),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: DropdownButtonFormField(
                      decoration:
                          const InputDecoration(border: InputBorder.none),
                      hint: Padding(
                        padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                        child: const Text("Choose a category"),
                      ),
                      validator: (value) {
                        if (value == null) {
                          return ('Category must be selected');
                        }
                        return null;
                      },
                      value: selectedValue,
                      items: categories
                          .map(
                            (e) => DropdownMenuItem<String>(
                              value: e.title,
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                                child: Text(e.title!),
                              ),
                            ),
                          )
                          .toList(),
                      onChanged: (value) {
                        setState(() {
                          selectedValue = value.toString();
                        });
                      },
                    ),
                  ),
                  MyTextField(
                    controller: itemC,
                    validate: (p0) {
                      if (p0!.isEmpty) {
                        return "Enter product name";
                      } else {
                        return null;
                      }
                    },
                    hintText: "Product Name",
                    labelText: "Product Name",
                  ),
                  MyTextField(
                    controller: detailC,
                    validate: (p0) {
                      if (p0!.isEmpty) {
                        return "Enter product description";
                      } else {
                        return null;
                      }
                    },
                    hintText: "Product Description",
                    labelText: "Product Description",
                  ),
                  MyTextField(
                    controller: priceC,
                    validate: (p0) {
                      if (p0!.isEmpty || p0.length > 4) {
                        return "Enter a valid price";
                      } else {
                        return null;
                      }
                    },
                    hintText: "Product Price",
                    labelText: "Product Price",
                  ),
                  MyTextField(
                    controller: discountC,
                    hintText: "Discount Price",
                    labelText: "Discount Price",
                  ),
                  SwitchListTile(
                    title: Text(
                      "Is this product on Sale?",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    value: onSale,
                    onChanged: (value) {
                      setState(() {
                        onSale = !onSale;
                      });
                    },
                    tileColor: Colors.deepPurple,
                    activeColor: Colors.green,
                    inactiveThumbColor: Colors.red,
                    inactiveTrackColor: Colors.white,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  SwitchListTile(
                    title: Text(
                      "Is this product Popular?",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    value: isPopular,
                    onChanged: (value) {
                      setState(() {
                        isPopular = !isPopular;
                      });
                    },
                    tileColor: Colors.deepPurple,
                    activeColor: Colors.green,
                    inactiveThumbColor: Colors.red,
                    inactiveTrackColor: Colors.white,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: double.infinity,
                    height: 200,
                    color: Colors.green.shade400,
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 10,
                      ),
                      itemCount: images.length,
                      itemBuilder: (context, index) {
                        return Stack(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                decoration:
                                    BoxDecoration(border: Border.all(width: 2)),
                                child: Image.network(
                                  File(images[index].path).path,
                                  height: 100,
                                  width: 100,
                                  fit: BoxFit.cover,
                                  filterQuality: FilterQuality.high,
                                ),
                              ),
                            ),
                            IconButton(
                                onPressed: () {
                                  setState(() {
                                    images.removeAt(index);
                                  });
                                },
                                icon: Icon(Icons.cancel_outlined))
                          ],
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                          child: Text(
                            "Upload a picture",
                            style: TextStyle(fontSize: 10),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      MyButton(
                        onPress: () => pickImages(),
                        btnText: "Select Images",
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      BackgroundButton(
                        isLoading: isSaving,
                        onPress: () => saveData(),
                        btnText: "Upload Product",
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  pickImages() async {
    final List<XFile> pickImage = await imagePicker.pickMultiImage();
    if (pickImage != null) {
      setState(() {
        images.addAll(pickImage);
      });
    } else {
      print("object");
    }
  }

  Future postImage(XFile? imageFile) async {
    setState(() {
      isUploading = true;
    });
    String urls;
    Reference ref =
        FirebaseStorage.instance.ref().child("images").child(imageFile!.path);

    if (kIsWeb) {
      await ref.putData(
        await imageFile.readAsBytes(),
        SettableMetadata(contentType: "image/jpeg"),
      );
      urls = await ref.getDownloadURL();
      setState(() {
        isUploading = false;
      });
      return urls;
    }
  }

  uploadImages() async {
    for (var image in images) {
      await postImage(image).then((downLoadUrl) => imageUrls.add(downLoadUrl));
    }
  }

  saveData() async {
    if (formKey.currentState!.validate()) {
      setState(() {
        isSaving = true;
      });
      await uploadImages();
      await ProductModel.uploadProduct(ProductModel(
              category: selectedValue ?? "category",
              id: uuid.v4(),
              name: itemC.text,
              details: detailC.text,
              price: int.parse(priceC.text),
              dicountPrice: int.parse(discountC.text),
              imageUrl: imageUrls,
              isFav: isFav,
              isPopular: isPopular,
              onSale: onSale))
          .whenComplete(() {
        categoryC.clear();
        itemC.clear();
        detailC.clear();
        priceC.clear();
        discountC.clear();
        imageUrls.clear();
        images.clear();
        isPopular = false;
        onSale = false;
      });
      return ElegantNotification.success(
              title: const Text("Update"),
              description: const Text("Your product has been updated"))
          .show(context);
    }
  }
}

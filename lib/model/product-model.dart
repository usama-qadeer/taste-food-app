import 'package:cloud_firestore/cloud_firestore.dart';

class ProductModel {
  String? category;
  String? id;
  String? name;
  String? details;
  int? price;
  int? dicountPrice;
  List<dynamic>? imageUrl;
  bool? isFav;
  bool? onSale;
  bool? isPopular;

  ProductModel({
    required this.category,
    required this.id,
    required this.name,
    required this.details,
    required this.price,
    required this.dicountPrice,
    required this.imageUrl,
    required this.isFav,
    required this.isPopular,
    required this.onSale,
  });
  static Future<void> uploadProduct(ProductModel pm) async {
    CollectionReference db = FirebaseFirestore.instance.collection("products");
    Map<String, dynamic> data = {
      " category": pm.category,
      "id": pm.id,
      "name": pm.name,
      "details": pm.details,
      "price": pm.price,
      "dicountPrice": pm.dicountPrice,
      "imageUrl": pm.imageUrl,
      "isFav": pm.isFav,
      "isPopular": pm.isPopular,
      "onSale": pm.onSale
    };
    await db.add(data);
  }

  static Future<void> showproduct(ProductModel pm) async {
    //CollectionReference db = FirebaseFirestore.instance.collection("products");
    Map<String, dynamic> data = {
      " category": pm.category,
      "id": pm.id,
      "name": pm.name,
      "details": pm.details,
      "price": pm.price,
      "dicountPrice": pm.dicountPrice,
      "imageUrl": pm.imageUrl,
      "isFav": pm.isFav,
      "isPopular": pm.isPopular,
      "onSale": pm.onSale
    };
    print(data);
    // await db.add(data);
  }

  static Future<void> updateProduct(String id, ProductModel updateModel) async {
    CollectionReference db = FirebaseFirestore.instance.collection("products");
    Map<String, dynamic> data = {
      "category": updateModel.category,
      "id": updateModel.id,
      "name": updateModel.name,
      "details": updateModel.details,
      "price": updateModel.price,
      "dicountPrice": updateModel.dicountPrice,
      "imageUrl": updateModel.imageUrl,
      "isFav": updateModel.isFav,
      "isPopular": updateModel.isPopular,
      "onSale": updateModel.onSale
    };
    await db.doc(id).update(data);
  }

  static Future<void> deleteProduct(String id) async {
    CollectionReference db = FirebaseFirestore.instance.collection("products");

    await db.doc(id).delete();
  }
}

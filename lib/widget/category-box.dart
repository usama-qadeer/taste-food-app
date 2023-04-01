import 'package:flutter/material.dart';
import 'package:food_ordering/model/category.dart';

class CategoryBox extends StatelessWidget {
  const CategoryBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      ...List.generate(
          categories.length,
          (index) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 20, 5),
                      child: InkWell(
                        onTap: () {},
                        child: Material(
                          elevation: 5,
                          child: Container(
                            width: 50,
                            height: 50,
                            child: Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(
                                        "${categories[index].image}"),
                                    fit: BoxFit.cover,
                                  ),
                                  shape: BoxShape.rectangle),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Text(
                      "${categories[index].title}",
                      style: TextStyle(color: Colors.black),
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              ))
    ]);
  }
}

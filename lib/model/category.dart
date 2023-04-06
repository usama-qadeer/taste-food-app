class Category {
  String? title;
  String? image;

  Category({this.image, this.title});
}

List<Category> categories = [
  Category(image: ("assets/sandwich.png"), title: "Sandwich"),
  Category(image: ("assets/saladd.png"), title: "Salad"),
  Category(image: ("assets/pizzaa.png"), title: "Pizza"),
  Category(image: ("assets/fastfood.png"), title: "Fast Food"),
  Category(image: ("assets/drinks.png"), title: "Drink"),
  Category(image: ("assets/appetizers.png"), title: "Appetizers"),
];

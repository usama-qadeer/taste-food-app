class Category {
  String? title;
  String? image;

  Category({this.image, this.title});
}

List<Category> categories = [
  Category(image: ("assets/burger.png"), title: "Burger"),
  Category(image: ("assets/fastfood.png"), title: "Fast Food"),
  Category(image: ("assets/protein.png"), title: "Protein"),
  Category(image: ("assets/salad.png"), title: "Salad"),
];

class Category{
  String id;
  String title;
  String image;
  Category({required this.id,required this.title,required this.image});
  static List<Category>getCategoriesList()
  {
    return [
      Category(id: "general", title: "General", image: "assets/images/general.png"),
      Category(id: "business", title: "Business", image: "assets/images/busniess.png"),
      Category(id: "sports", title: "Sports", image: "assets/images/sport.png"),
      Category(id: "health", title: "Health", image: "assets/images/helth.png"),
      Category(id: "science", title: "Science", image: "assets/images/science.png"),
      Category(id: "technology", title: "Technology", image: "assets/images/technology.png"),
      Category(id: "entertainment", title: "Entertainment", image: "assets/images/entertainment.png"),
    ];
  }
}
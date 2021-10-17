class Product{//model
  late int id;
  late String image;
  late String name;
  late String title;
  late var price;
  late var description;
  Product.fromJson(Map<String,dynamic>productMap){
    this.id=productMap['id'];
    this.name=productMap['name'];
    this.title=productMap['title'];
    this.price=productMap['price'];
    this.image =productMap['avatar'];
    this.description =productMap['description'];
  }
}
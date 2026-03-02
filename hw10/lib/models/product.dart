class Product {
  int id;
  String name;
  double price;
  double star;
  int categoryId;
  String description;
  String img;
  Product(this.id, this.name, this.price, this.star, this.description, this.categoryId, this.img);
  factory Product.formJson(Map<String, dynamic>json){
    return Product(json["id"], json ["name"], (json ["price"] as num).toDouble(), (json ["star"] as num).toDouble(), json ["description"], json ["categoryId"], json ["img"]);
  }
}
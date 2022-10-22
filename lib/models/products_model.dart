class ProductsModel {
  late int status;
  late String message;
  late List<Products>  products;

  ProductsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products.add( Products.fromJson(v));
      });
    }
  }


}

class Products {
  late int id;
  late String company;
  late String name;
  late String type;
  late String price;
  late String image;
  late String description;


  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    company = json['company'];
    name = json['name'];
    type = json['type'];
    price = json['price'];
    image = json['image'];
    description = json['description'];
  }


}

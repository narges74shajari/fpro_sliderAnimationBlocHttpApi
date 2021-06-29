class Product {
  final String productName;
  final int id;
  final String price;
  final String imageUrl;
  final String description;

  Product.fromJson(Map<String, dynamic> json)
      : productName = json['product_name'],
        id = json['id'],
        price = json['price'],
        imageUrl = json['image_url'],
        description = json['description'];
}
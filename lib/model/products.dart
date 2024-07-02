class ProductData {
  final int id;
  final String name;
  final String asset;
  final String price;
  final String shippingFee;

  ProductData({
    required this.id,
    required this.asset,
    required this.name,
    required this.price,
    this.shippingFee = "0",
  });

  factory ProductData.fromJson(Map<String, dynamic> json) => switch (json) {
        {
          "id": int id,
          "name": String name,
          "asset": String asset,
          "price": String price,
          "shipping_fee": String shippingFee,
        } =>
          ProductData(
              id: id,
              asset: asset,
              name: name,
              price: price,
              shippingFee: shippingFee),
        _ => ProductData(id: 0, asset: "", name: "", price: ""),
      };
}

class CartData {
  final ProductData product;
  int count;

  CartData({required this.product, this.count = 1});

  factory CartData.fromJson(Map<String, dynamic> json) => switch (json) {
        {
          "product": ProductData product,
          "count": int count,
        } =>
          CartData(product: product, count: count),
        _ => CartData(
            product: ProductData(id: 0, asset: "", name: "", price: ""),
            count: 0),
      };
}

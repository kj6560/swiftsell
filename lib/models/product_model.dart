// To parse this JSON data, do
//
//     final productModel = productModelFromJson(jsonString);

import 'dart:convert';

List<ProductModel> productModelFromJson(String str) => List<ProductModel>.from(json.decode(str).map((x) => ProductModel.fromJson(x)));

String productModelToJson(List<ProductModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductModel {
  int id;
  int orgId;
  String name;
  String sku;
  String productMrp;
  int isActive;
  DateTime createdAt;
  DateTime updatedAt;
  String basePrice;
  Price price;
  Uom uom;
  List<Scheme> schemes;

  ProductModel({
    required this.id,
    required this.orgId,
    required this.name,
    required this.sku,
    required this.productMrp,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
    required this.basePrice,
    required this.price,
    required this.uom,
    required this.schemes,
  });

  ProductModel.empty()
      : id = 0,
        orgId = 0,
        name = '',
        sku = '',
        productMrp = '',
        isActive = 1,
        createdAt = DateTime.now(),
        updatedAt = DateTime.now(),
        basePrice = '',
        price = Price.empty(),
        uom = Uom.empty(),
        schemes = [];

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
    id: json["id"],
    orgId: json["org_id"],
    name: json["name"],
    sku: json["sku"],
    productMrp: json["product_mrp"],
    isActive: json["is_active"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    basePrice: json["base_price"],
    price: Price.fromJson(json["price"]),
    uom: Uom.fromJson(json["uom"]),
    schemes: List<Scheme>.from(json["schemes"].map((x) => Scheme.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "org_id": orgId,
    "name": name,
    "sku": sku,
    "product_mrp": productMrp,
    "is_active": isActive,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "base_price": basePrice,
    "price": price.toJson(),
    "uom": uom.toJson(),
    "schemes": List<dynamic>.from(schemes.map((x) => x.toJson())),
  };

  ProductModel copyWith({
    int? id,
    int? orgId,
    String? name,
    String? sku,
    String? productMrp,
    int? isActive,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? basePrice,
    Price? price,
    Uom? uom,
    List<Scheme>? schemes,
  }) =>
      ProductModel(
        id: id ?? this.id,
        orgId: orgId ?? this.orgId,
        name: name ?? this.name,
        sku: sku ?? this.sku,
        productMrp: productMrp ?? this.productMrp,
        isActive: isActive ?? this.isActive,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        basePrice: basePrice ?? this.basePrice,
        price: price ?? this.price,
        uom: uom ?? this.uom,
        schemes: schemes ?? this.schemes,
      );
}

class Price {
  int id;
  int productId;
  String price;
  int uomId;
  int isActive;
  DateTime createdAt;
  DateTime updatedAt;

  Price({
    required this.id,
    required this.productId,
    required this.price,
    required this.uomId,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
  });

  Price.empty()
      : id = 0,
        productId = 0,
        price = '',
        uomId = 0,
        isActive = 1,
        createdAt = DateTime.now(),
        updatedAt = DateTime.now();

  factory Price.fromJson(Map<String, dynamic> json) => Price(
    id: json["id"],
    productId: json["product_id"],
    price: json["price"],
    uomId: json["uom_id"],
    isActive: json["is_active"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "product_id": productId,
    "price": price,
    "uom_id": uomId,
    "is_active": isActive,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}

class Scheme {
  int id;
  String schemeName;
  String schemeType;
  String schemeValue;
  bool isActive;
  DateTime createdAt;
  DateTime updatedAt;
  List<BundleProduct> bundleProducts;

  Scheme({
    required this.id,
    required this.schemeName,
    required this.schemeType,
    required this.schemeValue,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
    required this.bundleProducts,
  });

  Scheme.empty()
      : id = 0,
        schemeName = '',
        schemeType = '',
        schemeValue = '',
        isActive = true,
        createdAt = DateTime.now(),
        updatedAt = DateTime.now(),
        bundleProducts = [];

  factory Scheme.fromJson(Map<String, dynamic> json) => Scheme(
    id: json["id"],
    schemeName: json["scheme_name"],
    schemeType: json["scheme_type"],
    schemeValue: json["scheme_value"],
    isActive: json["is_active"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    bundleProducts: List<BundleProduct>.from(json["bundle_products"].map((x) => BundleProduct.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "scheme_name": schemeName,
    "scheme_type": schemeType,
    "scheme_value": schemeValue,
    "is_active": isActive,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "bundle_products": List<dynamic>.from(bundleProducts.map((x) => x.toJson())),
  };
}

class BundleProduct {
  int productId;
  int quantity;
  Product product;

  BundleProduct({
    required this.productId,
    required this.quantity,
    required this.product,
  });

  BundleProduct.empty()
      : productId = 0,
        quantity = 0,
        product = Product.empty();

  factory BundleProduct.fromJson(Map<String, dynamic> json) => BundleProduct(
    productId: json["product_id"],
    quantity: json["quantity"],
    product: Product.fromJson(json["product"]),
  );

  Map<String, dynamic> toJson() => {
    "product_id": productId,
    "quantity": quantity,
    "product": product.toJson(),
  };
}

class Product {
  int id;
  int orgId;
  String name;
  String sku;
  String productMrp;
  int isActive;
  DateTime createdAt;
  DateTime updatedAt;

  Product({
    required this.id,
    required this.orgId,
    required this.name,
    required this.sku,
    required this.productMrp,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
  });

  Product.empty()
      : id = 0,
        orgId = 0,
        name = '',
        sku = '',
        productMrp = '',
        isActive = 1,
        createdAt = DateTime.now(),
        updatedAt = DateTime.now();

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    id: json["id"],
    orgId: json["org_id"],
    name: json["name"],
    sku: json["sku"],
    productMrp: json["product_mrp"],
    isActive: json["is_active"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "org_id": orgId,
    "name": name,
    "sku": sku,
    "product_mrp": productMrp,
    "is_active": isActive,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}

class Uom {
  int id;
  String title;
  String slug;
  int isActive;
  DateTime createdAt;
  DateTime updatedAt;

  Uom({
    required this.id,
    required this.title,
    required this.slug,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
  });

  Uom.empty()
      : id = 0,
        title = '',
        slug = '',
        isActive = 1,
        createdAt = DateTime.now(),
        updatedAt = DateTime.now();

  factory Uom.fromJson(Map<String, dynamic> json) => Uom(
    id: json["id"],
    title: json["title"],
    slug: json["slug"],
    isActive: json["is_active"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "slug": slug,
    "is_active": isActive,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}

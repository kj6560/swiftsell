// To parse this JSON data, do
//
//     final homeKpi = homeKpiFromJson(jsonString);

import 'dart:convert';

HomeKpi homeKpiFromJson(String str) => HomeKpi.fromJson(json.decode(str));

String homeKpiToJson(HomeKpi data) => json.encode(data.toJson());

class HomeKpi {
  SalesData salesData;
  InventoryData inventoryData;
  ProductsData productsData;

  HomeKpi({
    required this.salesData,
    required this.inventoryData,
    required this.productsData,
  });
  factory HomeKpi.empty() => HomeKpi(
    salesData: SalesData.empty(),
    inventoryData: InventoryData.empty(),
    productsData: ProductsData.empty(),
  );

  HomeKpi copyWith({
    SalesData? salesData,
    InventoryData? inventoryData,
    ProductsData? productsData,
  }) =>
      HomeKpi(
        salesData: salesData ?? this.salesData,
        inventoryData: inventoryData ?? this.inventoryData,
        productsData: productsData ?? this.productsData,
      );

  factory HomeKpi.fromJson(Map<String, dynamic> json) => HomeKpi(
    salesData: SalesData.fromJson(json["sales_data"]),
    inventoryData: InventoryData.fromJson(json["inventory_data"]),
    productsData: ProductsData.fromJson(json["products_data"]),
  );

  Map<String, dynamic> toJson() => {
    "sales_data": salesData.toJson(),
    "inventory_data": inventoryData.toJson(),
    "products_data": productsData.toJson(),
  };
}

class InventoryData {
  int inventoryAddedToday;
  int inventoryAddedThisMonth;
  int inventoryAddedTotal;

  InventoryData({
    required this.inventoryAddedToday,
    required this.inventoryAddedThisMonth,
    required this.inventoryAddedTotal,
  });
  factory InventoryData.empty() => InventoryData(
    inventoryAddedToday: 0,
    inventoryAddedThisMonth: 0,
    inventoryAddedTotal: 0,
  );
  InventoryData copyWith({
    int? inventoryAddedToday,
    int? inventoryAddedThisMonth,
    int? inventoryAddedTotal,
  }) =>
      InventoryData(
        inventoryAddedToday: inventoryAddedToday ?? this.inventoryAddedToday,
        inventoryAddedThisMonth: inventoryAddedThisMonth ?? this.inventoryAddedThisMonth,
        inventoryAddedTotal: inventoryAddedTotal ?? this.inventoryAddedTotal,
      );

  factory InventoryData.fromJson(Map<String, dynamic> json) => InventoryData(
    inventoryAddedToday: json["inventory_added_today"],
    inventoryAddedThisMonth: json["inventory_added_this_month"],
    inventoryAddedTotal: json["inventory_added_total"],
  );

  Map<String, dynamic> toJson() => {
    "inventory_added_today": inventoryAddedToday,
    "inventory_added_this_month": inventoryAddedThisMonth,
    "inventory_added_total": inventoryAddedTotal,
  };
}

class ProductsData {
  int productsAddedToday;
  int productsAddedThisMonth;
  int productsAddedTotal;

  ProductsData({
    required this.productsAddedToday,
    required this.productsAddedThisMonth,
    required this.productsAddedTotal,
  });
  factory ProductsData.empty() => ProductsData(
    productsAddedToday: 0,
    productsAddedThisMonth: 0,
    productsAddedTotal: 0,
  );
  ProductsData copyWith({
    int? productsAddedToday,
    int? productsAddedThisMonth,
    int? productsAddedTotal,
  }) =>
      ProductsData(
        productsAddedToday: productsAddedToday ?? this.productsAddedToday,
        productsAddedThisMonth: productsAddedThisMonth ?? this.productsAddedThisMonth,
        productsAddedTotal: productsAddedTotal ?? this.productsAddedTotal,
      );

  factory ProductsData.fromJson(Map<String, dynamic> json) => ProductsData(
    productsAddedToday: json["products_added_today"],
    productsAddedThisMonth: json["products_added_this_month"],
    productsAddedTotal: json["products_added_total"],
  );

  Map<String, dynamic> toJson() => {
    "products_added_today": productsAddedToday,
    "products_added_this_month": productsAddedThisMonth,
    "products_added_total": productsAddedTotal,
  };
}

class SalesData {
  String salesToday;
  String salesThisMonth;
  int salesTotal;

  SalesData({
    required this.salesToday,
    required this.salesThisMonth,
    required this.salesTotal,
  });
  factory SalesData.empty() => SalesData(
    salesToday: '0',
    salesThisMonth: '0',
    salesTotal: 0,
  );
  SalesData copyWith({
    String? salesToday,
    String? salesThisMonth,
    int? salesTotal,
  }) =>
      SalesData(
        salesToday: salesToday ?? this.salesToday,
        salesThisMonth: salesThisMonth ?? this.salesThisMonth,
        salesTotal: salesTotal ?? this.salesTotal,
      );

  factory SalesData.fromJson(Map<String, dynamic> json) => SalesData(
    salesToday: json["sales_today"],
    salesThisMonth: json["sales_this_month"],
    salesTotal: json["sales_total"],
  );

  Map<String, dynamic> toJson() => {
    "sales_today": salesToday,
    "sales_this_month": salesThisMonth,
    "sales_total": salesTotal,
  };
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/ProductController.dart';
import '../models/product_model.dart';
import '../views/ProductDetails.dart';

class ProductHomeContent extends StatelessWidget {
  const ProductHomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ProductController>();

    return Obx(() {
      if (controller.isLoading.value) {
        return const Center(child: CircularProgressIndicator());
      }

      final products = controller.products;

      if (products.isEmpty) {
        return const Center(child: Text("No products available"));
      }

      return ListView.builder(
        itemCount: products.length,
        padding: const EdgeInsets.all(8),
        itemBuilder: (context, index) {
          final product = products[index];
          return ProductCard(product: product);
        },
      );
    });
  }
}

class ProductCard extends StatelessWidget {
  final ProductModel product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed('/product_details', arguments: {'product': product});
      },
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 8),
        elevation: 6,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Title
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    product.name,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Chip(
                    label: Text(product.uom.title),
                    backgroundColor: Colors.blue.shade100,
                  ),
                ],
              ),

              const SizedBox(height: 8),

              /// SKU and Price
              Row(
                children: [
                  Text("SKU: ${product.sku}"),
                  const Spacer(),
                  Text("₹${product.price.price}",
                      style: const TextStyle(fontWeight: FontWeight.w600)),
                ],
              ),

              const SizedBox(height: 8),

              /// MRP and Base Price
              Row(
                children: [
                  Text(
                    "MRP: ₹${product.productMrp}",
                  ),
                  const SizedBox(width: 16),
                  Text("Base: ₹${product.basePrice}"),
                ],
              ),

              const SizedBox(height: 12),

              /// Schemes Section
              if (product.schemes.isNotEmpty)
                ExpansionTile(
                  title: const Text("Available Schemes"),
                  children: product.schemes.map((scheme) {
                    return ListTile(
                      title: Text(scheme.schemeName),
                      subtitle:
                          Text("${scheme.schemeType} - ${scheme.schemeValue}"),
                      trailing: scheme.isActive
                          ? const Icon(Icons.check_circle, color: Colors.green)
                          : const Icon(Icons.cancel, color: Colors.red),
                      onTap: () => showDialog(
                        context: context,
                        builder: (_) => SchemeDetailsDialog(scheme: scheme),
                      ),
                    );
                  }).toList(),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class SchemeDetailsDialog extends StatelessWidget {
  final Scheme scheme;

  const SchemeDetailsDialog({super.key, required this.scheme});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(scheme.schemeName),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: scheme.bundleProducts.map((bp) {
          return ListTile(
            title: Text(bp.product.name),
            subtitle: Text("Qty: ${bp.quantity}"),
            trailing: Text("MRP: ₹${bp.product.productMrp}"),
          );
        }).toList(),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text("Close"),
        )
      ],
    );
  }
}

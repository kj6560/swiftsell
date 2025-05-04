import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:swiftsell/controllers/HomeController.dart';

class HomeContent extends GetView<HomeController> {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.isLoading.value) {
        return const Center(child: CircularProgressIndicator());
      }

      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            const SizedBox(height: 20),
            _buildKpiCard(
              title: "Sales Total",
              value: '${controller.homeKpi.value.salesData.salesTotal}',
              icon: Icons.attach_money,
              color: Colors.green.shade400,
            ),
            const SizedBox(height: 20),
            _buildKpiCard(
              title: "Sales Today",
              value: controller.homeKpi.value.salesData.salesToday,
              icon: Icons.calendar_today,
              color: Colors.green.shade400,
            ),
            const SizedBox(height: 20),
            _buildKpiCard(
              title: "Sales This Month",
              value: controller.homeKpi.value.salesData.salesThisMonth,
              icon: Icons.date_range,
              color: Colors.green.shade400,
            ),
            const SizedBox(height: 20),
            _buildKpiCard(
              title: "Inventory Today",
              value:
              '${controller.homeKpi.value.inventoryData.inventoryAddedToday}',
              icon: Icons.inventory,
              color: Colors.teal.shade400,
            ),
            const SizedBox(height: 20),
            _buildKpiCard(
              title: "Inventory This Month",
              value:
              '${controller.homeKpi.value.inventoryData.inventoryAddedThisMonth}',
              icon: Icons.inventory,
              color: Colors.teal.shade400,
            ),
            const SizedBox(height: 20),
            _buildKpiCard(
              title: "Inventory Total",
              value:
              '${controller.homeKpi.value.inventoryData.inventoryAddedTotal}',
              icon: Icons.inventory,
              color: Colors.teal.shade400,
            ),
            const SizedBox(height: 20),
            _buildKpiCard(
              title: "Products Today",
              value:
              '${controller.homeKpi.value.productsData.productsAddedToday}',
              icon: Icons.shopping_cart,
              color: Colors.orange.shade400,
            ),
            const SizedBox(height: 20),
            _buildKpiCard(
              title: "Products This Month",
              value:
              '${controller.homeKpi.value.productsData.productsAddedThisMonth}',
              icon: Icons.shopping_cart,
              color: Colors.orange.shade400,
            ),
            const SizedBox(height: 20),
            _buildKpiCard(
              title: "Products Total",
              value:
              '${controller.homeKpi.value.productsData.productsAddedTotal}',
              icon: Icons.shopping_cart,
              color: Colors.orange.shade400,
            ),
          ],
        ),
      );
    });
  }

  Widget _buildKpiCard({
    required String title,
    required String value,
    required IconData icon,
    required Color color,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: color.withOpacity(0.3)),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.1),
            blurRadius: 6,
            offset: Offset(2, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(
            icon,
            size: 40,
            color: color,
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: color,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  value,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: color,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

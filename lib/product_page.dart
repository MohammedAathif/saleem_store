import 'package:flutter/material.dart';

class ProductPage extends StatelessWidget {
  final Map<String, dynamic> productData;

  const ProductPage({super.key, required this.productData});

  @override
  Widget build(BuildContext context) {
    final variants = productData['variants'] ?? [];

    return Scaffold(
      appBar: AppBar(
        title: Text(productData['name']),
        backgroundColor: Colors.blue.shade600,
      ),
      body: ListView.separated(
        separatorBuilder: (ctx,index) {
          return Divider();
        },
        padding: const EdgeInsets.all(20),
        itemCount: variants.length,
        itemBuilder: (context, index) {
          final variant = variants[index];
          return ListTile(
            title: Text(variant['name']),
            trailing: Text(
              "₹${variant['price']}",
              style: const TextStyle(
                  color: Colors.green, fontWeight: FontWeight.bold),
            ),
            onTap: () {},
          );
        },
      ),
    );
  }
}

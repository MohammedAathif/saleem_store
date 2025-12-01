import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SubCategoryPage extends StatelessWidget {
  final String category;
  final Map<String, dynamic> categoryData; // from JSON

  const SubCategoryPage({
    super.key,
    required this.category,
    required this.categoryData,
  });

  @override
  Widget build(BuildContext context) {
    final subcategories = categoryData['subcategories'] ?? [];

    subcategories.sort((a, b) => a['name'].toString().toLowerCase().compareTo(b['name'].toString().toLowerCase()));


    return Scaffold(
      appBar: AppBar(
        title: Text(category),
        backgroundColor: Colors.blue.shade600,
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(20),
        itemCount: subcategories.length,
        separatorBuilder: (_, __) => const Divider(),
        itemBuilder: (context, index) {
          final sub = subcategories[index];
          return ListTile(
            title: Text(sub['name']),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {
              final categoryUrl = category;
              final brandUrl = sub['name'];
              context.push('/$categoryUrl/$brandUrl');
            },
          );
        },
      ),
    );
  }
}

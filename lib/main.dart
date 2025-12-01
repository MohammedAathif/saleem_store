import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:saleem_store/sub_category.dart';
import 'data.dart';
import 'home_page.dart';
import 'product_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final GoRouter router = GoRouter(
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => HomePage(),
        ),
        GoRoute(
          path: '/:category',
          builder: (context, state) {
            final categoryName = state.pathParameters['category']!;
            final categoryData = categories.firstWhere(
                  (c) => c['name'] == categoryName,
            );
            return SubCategoryPage(
              category: categoryName,
              categoryData: categoryData,
            );
          },
        ),
        GoRoute(
          path: '/:category/:brand',
          builder: (context, state) {
            final categoryName = state.pathParameters['category']!;
            final brandName = state.pathParameters['brand']!;
            final categoryData = categories.firstWhere(
                  (c) => c['name'] == categoryName,
            );
            final productData = (categoryData['subcategories'] as List)
                .firstWhere((s) => s['name'] == brandName);
            return ProductPage(productData: productData);
          },
        ),

      ],
    );

    return MaterialApp.router(
      routerConfig: router,
      title: 'Saleem Store',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
    );
  }
}

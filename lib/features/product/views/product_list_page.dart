// فایل: lib/features/product/views/product_list_page.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../data/fake_products.dart';
import '../models/product_model.dart';
import '../widgets/product_tile.dart';

class ProductListPage extends ConsumerStatefulWidget {
  const ProductListPage({super.key});

  @override
  ConsumerState<ProductListPage> createState() => _ProductListPageState();
}

class _ProductListPageState extends ConsumerState<ProductListPage> {
  String searchQuery = '';

  List<ProductModel> get filteredProducts {
    return fakeProducts.where((p) => p.title.contains(searchQuery)).toList();
  }

  List<ProductModel> getSectionProducts(int start) {
    return filteredProducts.skip(start).take(5).toList();
  }

  Widget buildSection(
      String title, IconData icon, List<ProductModel> items, Color color) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            children: [
              Icon(icon, color: color),
              const SizedBox(width: 6),
              Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: color,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 250,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            itemCount: items.length,
            itemBuilder: (context, index) => SizedBox(
              width: 160,
              child: ProductTile(product: items[index]),
            ),
            separatorBuilder: (_, __) => const SizedBox(width: 12),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 2,
        title: const Text(
          'GoldenTruckDecor',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.person, color: Colors.black),
            onPressed: () => context.push('/profile'),
          ),
        ],
        leading: IconButton(
          icon: const Icon(Icons.shopping_cart_outlined, color: Colors.black),
          onPressed: () => context.push('/cart'),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'جستجوی محصول...',
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Colors.white,
                contentPadding: const EdgeInsets.all(10),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
              onChanged: (value) {
                setState(() => searchQuery = value);
              },
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                buildSection('پربازدیدترین‌ها', Icons.visibility,
                    getSectionProducts(0), Colors.deepOrange),
                buildSection('پرفروش‌ترین‌ها', Icons.trending_up,
                    getSectionProducts(5), Colors.blue),
                buildSection('محبوب‌ترین‌ها', Icons.favorite,
                    getSectionProducts(2), Colors.pink),
                buildSection('جدیدترین‌ها', Icons.new_releases,
                    getSectionProducts(7), Colors.green),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

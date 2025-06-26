import 'package:flutter/material.dart';

import '../data/fake_products.dart';
import '../models/product_model.dart';
import '../widgets/product_tile.dart';

class ProductListPage extends StatefulWidget {
  const ProductListPage({super.key});
  @override
  State<ProductListPage> createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  String searchQuery = '';
  String? selectedCategory;

  List<String> get categories =>
      fakeProducts.map((p) => p.category).toSet().toList();

  List<ProductModel> get filteredProducts {
    return fakeProducts.where((p) {
      final matchesCategory =
          selectedCategory == null || p.category == selectedCategory;
      final matchesSearch = p.title.contains(searchQuery);
      return matchesCategory && matchesSearch;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('محصولات'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: TextField(
              decoration: const InputDecoration(
                labelText: 'جستجو...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
              onChanged: (v) => setState(() => searchQuery = v),
            ),
          ),
          SizedBox(
            height: 40,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 8),
              children: [
                ChoiceChip(
                  label: const Text('همه'),
                  selected: selectedCategory == null,
                  onSelected: (_) => setState(() => selectedCategory = null),
                ),
                ...categories.map((cat) => Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: ChoiceChip(
                        label: Text(cat),
                        selected: selectedCategory == cat,
                        onSelected: (_) =>
                            setState(() => selectedCategory = cat),
                      ),
                    )),
              ],
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: filteredProducts.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.75,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
              ),
              itemBuilder: (context, index) {
                final product = filteredProducts[index];
                return ProductTile(product: product);
              },
            ),
          ),
        ],
      ),
    );
  }
}

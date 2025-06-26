import 'package:flutter/material.dart';

import '../models/product_model.dart';

class ProductDetailPage extends StatelessWidget {
  final ProductModel product;
  const ProductDetailPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.title),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                product.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 16),
            Text(product.title,
                style:
                    const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text('${product.price} تومان',
                style: const TextStyle(fontSize: 20, color: Colors.green)),
            const SizedBox(height: 8),
            Text('دسته‌بندی: ${product.category}'),
            const SizedBox(height: 8),
            Text('موجودی: ${product.stock} عدد'),
            const SizedBox(height: 16),
            const Text('توضیحات:',
                style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text(product.shortDescription),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: product.stock > 0 ? () {} : null,
                child: const Text('افزودن به سبد خرید'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('سبد خرید')),
        body: const Center(child: Text('سبد خریدت خالیه فعلاً')));
  }
}

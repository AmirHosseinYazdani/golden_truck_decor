import '../models/product_model.dart';

final List<ProductModel> fakeProducts = [
  ProductModel(
    id: 'p1',
    title: 'قالپاق براق 22 اینچ',
    imageUrl: 'https://example.com/images/wheel-cover-22.jpg',
    price: 780000,
    category: 'تزئینات خارجی',
    stock: 12,
    shortDescription: 'قالپاق با کیفیت بالا مخصوص چرخ‌های 22 اینچ',
  ),
  ProductModel(
    id: 'p2',
    title: 'روکش فرمان چرمی',
    imageUrl: 'https://example.com/images/steering-cover.jpg',
    price: 320000,
    category: 'تزئینات داخلی',
    stock: 30,
    shortDescription: 'روکش ضد لغزش با طراحی لوکس',
  ),
  ProductModel(
    id: 'p3',
    title: 'چراغ سقفی LED',
    imageUrl: 'https://example.com/images/led-light.jpg',
    price: 450000,
    category: 'نورپردازی',
    stock: 7,
    shortDescription: 'چراغ سقفی کم مصرف با نور سفید',
  ),
];

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('پروفایل من'),
        centerTitle: true,
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          const SizedBox(height: 24),
          const CircleAvatar(
            radius: 45,
            backgroundColor: Colors.teal,
            child: Icon(Icons.person, size: 50, color: Colors.white),
          ),
          const SizedBox(height: 12),
          const Text(
            'سلام، امیرحسین',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 24),
          const Divider(thickness: 1),
          buildMenuItem(context, Icons.shopping_bag, 'سفارش‌های من', '/orders'),
          buildMenuItem(context, Icons.favorite, 'علاقه‌مندی‌ها', '/favorites'),
          buildMenuItem(context, Icons.edit, 'ویرایش اطلاعات', '/edit-profile'),
          buildMenuItem(context, Icons.logout, 'خروج از حساب', '/logout',
              isDanger: true),
        ],
      ),
    );
  }

  Widget buildMenuItem(
      BuildContext context, IconData icon, String title, String route,
      {bool isDanger = false}) {
    return ListTile(
      leading: Icon(icon, color: isDanger ? Colors.red : Colors.teal),
      title: Text(title,
          style: TextStyle(
              color: isDanger ? Colors.red : Colors.black,
              fontWeight: FontWeight.w500)),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: () => context.push(route),
    );
  }
}

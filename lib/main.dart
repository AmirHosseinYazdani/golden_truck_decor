import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:golden_truck_decor/core/router/app_router.dart';
import 'package:golden_truck_decor/core/theme/app_theme.dart';

void main() {
  runApp(const ProviderScope(child: GoldenTruckDecorApp()));
}

class GoldenTruckDecorApp extends StatelessWidget {
  const GoldenTruckDecorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'GoldenTruckDecor',
      debugShowCheckedModeBanner: false,
      routerConfig: goRouter,
      theme: AppTheme.light,
    );
  }
}

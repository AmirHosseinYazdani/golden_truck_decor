// مسیر: lib/src/core/router/app_router.dart

import 'package:go_router/go_router.dart';
import 'package:golden_truck_decor/features/auth/presentation/login_screen.dart';
import 'package:golden_truck_decor/features/auth/presentation/sign_up_screen.dart';
import 'package:golden_truck_decor/features/product/views/product_list_page.dart';
import 'package:golden_truck_decor/features/profile/views/profile_page.dart';
import 'package:golden_truck_decor/features/splash/presentation/splash_screen.dart';

final GoRouter goRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: '/signup',
      builder: (context, state) => const SignUpScreen(),
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: '/products',
      builder: (context, state) => const ProductListPage(),
    ),
    GoRoute(
      path: '/profile',
      builder: (context, state) => const ProfilePage(),
    ),
  ],
);

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'features/user/presentation/pages/login_page.dart';
import 'main_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

final GoRouter _router = GoRouter(
  initialLocation: "/home",
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (context, state) {
        return MainPage();
      },
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) {
        return LoginPage();
      },
    ),
  ]
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
    );
  }
}
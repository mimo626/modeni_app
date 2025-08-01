import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:modeni_app/features/user/presentation/pages/signup_age_page.dart';
import 'package:modeni_app/features/user/presentation/pages/signup_code_page.dart';
import 'package:modeni_app/features/user/presentation/pages/signup_connection_page.dart';
import 'package:modeni_app/features/user/presentation/pages/signup_finish_page.dart';
import 'package:modeni_app/features/user/presentation/pages/signup_idpassword_page.dart';
import 'package:modeni_app/features/user/presentation/pages/signup_name_page.dart';
import 'package:modeni_app/features/user/presentation/pages/signup_region_page.dart';
import 'package:modeni_app/features/user/presentation/pages/signup_role_page.dart';

import 'features/user/presentation/pages/start_page.dart';
import 'main_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

final GoRouter _router = GoRouter(
  initialLocation: "/start",
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (context, state) {
        return MainPage();
      },
    ),
    GoRoute(
      path: '/start',
      builder: (context, state) {
        return StartPage();
      },
    ),
    GoRoute(
      path: '/signup_idpassword',
      builder: (context, state) {
        return SignupIdpasswordPage();
      },
    ),
    GoRoute(
      path: '/signup_name',
      builder: (context, state) {
        return SignupNamePage();
      },
    ),
    GoRoute(
      path: '/signup_age',
      builder: (context, state) {
        return SignupAgePage();
      },
    ),
    GoRoute(
      path: '/signup_role',
      builder: (context, state) {
        return SignupRolePage();
      },
    ),
    GoRoute(
      path: '/signup_region',
      builder: (context, state) {
        return SignupRegionPage();
      },
    ),
    GoRoute(
      path: '/signup_connection',
      builder: (context, state) {
        return SignupConnectionPage();
      },
    ),
    GoRoute(
      path: '/signup_code',
      builder: (context, state) {
        return SignupCodePage();
      },
    ),
    GoRoute(
      path: '/signup_finish',
      builder: (context, state) {
        return SignupFinishPage();
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
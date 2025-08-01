import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:modeni_app/features/questions_list/presentation/pages/question_detail_page.dart';
import 'package:modeni_app/features/user/presentation/pages/login_page.dart';
import 'package:modeni_app/features/user/presentation/pages/signup_age_page.dart';
import 'package:modeni_app/features/user/presentation/pages/signup_code_page.dart';
import 'package:modeni_app/features/user/presentation/pages/signup_connection_page.dart';
import 'package:modeni_app/features/user/presentation/pages/signup_finish_page.dart';
import 'package:modeni_app/features/user/presentation/pages/signup_idpassword_page.dart';
import 'package:modeni_app/features/user/presentation/pages/signup_name_page.dart';
import 'package:modeni_app/features/user/presentation/pages/signup_region_page.dart';
import 'package:modeni_app/features/user/presentation/pages/signup_role_page.dart';

import 'features/user/presentation/controller/user_controller.dart';
import 'features/user/presentation/pages/start_page.dart';
import 'main_page.dart';
import 'package:get/get.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}
final user_controller = Get.put(UserController());

final GoRouter _router = GoRouter(
  initialLocation: "/",
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
      path: '/login',
      builder: (context, state) {
        return LoginPage();
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
    GoRoute(
      path: '/question_detail',
      builder: (context, state) {
        final extra = state.extra as Map<String, dynamic>;
        return QuestionDetailPage(index: extra["index"], question: extra["question"],);
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
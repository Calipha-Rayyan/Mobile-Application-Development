import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'data.dart';
import 'screens/about_screen.dart';
import 'screens/detail_screen.dart';
import 'screens/home_screen.dart';
import 'screens/settings_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode _mode = ThemeMode.light;

  late final GoRouter _router = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => const HomeScreen()),
      GoRoute(
        path: '/detail/:id',
        builder: (context, state) {
          final idString = state.pathParameters['id'];
          final id = int.tryParse(idString ?? '0') ?? 0;
          if (id >= 0 && id < dishes.length) {
            return DetailScreen(dish: dishes[id]);
          }
          return DetailScreen(dish: dishes[0]);
        },
      ),
      GoRoute(
        path: '/settings',
        builder: (context, state) => SettingsScreen(
          mode: _mode,
          onMode: (m) => setState(() => _mode = m),
        ),
      ),
      GoRoute(path: '/about', builder: (context, state) => const AboutScreen()),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Campus Bites',
      routerConfig: _router,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.teal,
          brightness: Brightness.dark,
        ),
      ),
      themeMode: _mode,
    );
  }
}

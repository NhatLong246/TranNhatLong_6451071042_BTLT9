import 'package:flutter/material.dart';
import '../views/home_view.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quản lý công việc',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const HomeView(), // Gọi ra màn hình chính
      debugShowCheckedModeBanner: false,
    );
  }
}
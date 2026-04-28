import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../controller/auth_controller.dart';
import '../views/home_view.dart';
import '../views/login_view.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App Xác Thực',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      // Lắng nghe sự thay đổi trạng thái đăng nhập
      home: StreamBuilder<User?>(
        stream: AuthController().authStateChanges,
        builder: (context, snapshot) {
          // Đang kiểm tra trạng thái
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Scaffold(body: Center(child: CircularProgressIndicator()));
          }
          
          // Đã có dữ liệu người dùng (Đã đăng nhập)
          if (snapshot.hasData) {
            return HomeView();
          }
          
          // Không có dữ liệu (Chưa đăng nhập hoặc đã đăng xuất)
          return const LoginView();
        },
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
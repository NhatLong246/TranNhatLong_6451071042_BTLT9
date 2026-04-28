import 'package:flutter/material.dart';
import '../controller/auth_controller.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});
  
  final AuthController _authController = AuthController();

  @override
  Widget build(BuildContext context) {
    // Lấy thông tin email của user đang đăng nhập
    final userEmail = _authController.currentUser?.email ?? 'Không xác định';

    return Scaffold(
      appBar: AppBar(
        title: const Text('Trang Chủ'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              await _authController.logout();
              // Không cần dùng Navigator.push để quay lại login. 
              // StreamBuilder ở MyApp sẽ tự động đá người dùng về màn hình Login khi phát hiện trạng thái logout.
            },
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Chào mừng bạn trở lại!', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Text('Email: $userEmail', style: const TextStyle(fontSize: 16, color: Colors.blue)),
            const SizedBox(height: 25),
            Text(
              'MSSV: 6451071042',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
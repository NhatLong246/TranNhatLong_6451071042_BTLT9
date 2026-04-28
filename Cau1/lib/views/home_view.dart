import 'package:flutter/material.dart';
import '../controller/task_controller.dart';
import '../models/task_model.dart';
import '../widget/task_item.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final TaskController _controller = TaskController();
  final TextEditingController _textController = TextEditingController();

  // Hàm mở Dialog thêm công việc
  void _showAddTaskDialog() {
    _textController.clear();
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Thêm công việc mới'),
          content: TextField(
            controller: _textController,
            decoration: const InputDecoration(
              hintText: 'Nhập tên công việc...',
            ),
            autofocus: true,
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Hủy'),
            ),
            ElevatedButton(
              onPressed: () {
                if (_textController.text.trim().isNotEmpty) {
                  _controller.addTask(_textController.text.trim());
                  Navigator.pop(context);
                }
              },
              child: const Text('Lưu'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('To-do List Firebase - 6451071042'),
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
      ),
      // Dùng StreamBuilder để tự động cập nhật UI khi Database thay đổi
      body: StreamBuilder<List<TaskModel>>(
        stream: _controller.getTasksStream(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Lỗi: ${snapshot.error}'));
          }

          final tasks = snapshot.data ?? [];

          if (tasks.isEmpty) {
            return const Center(
              child: Text('Chưa có công việc nào. Hãy thêm mới!'),
            );
          }

          return ListView.builder(
            itemCount: tasks.length,
            itemBuilder: (context, index) {
              return TaskItem(task: tasks[index], controller: _controller);
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddTaskDialog,
        backgroundColor: Colors.blueAccent,
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}

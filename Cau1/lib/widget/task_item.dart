import 'package:flutter/material.dart';
import '../models/task_model.dart';
import '../controller/task_controller.dart';
import '../utils/format_utils.dart';

class TaskItem extends StatelessWidget {
  final TaskModel task;
  final TaskController controller;

  const TaskItem({super.key, required this.task, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(task.id),
      // Key bắt buộc phải có để vuốt xóa
      direction: DismissDirection.endToStart,
      background: Container(
        color: Colors.red,
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 20),
        child: const Icon(Icons.delete, color: Colors.white),
      ),
      onDismissed: (direction) {
        controller.deleteTask(task.id); // Gọi hàm xóa khi vuốt
      },
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: CheckboxListTile(
          title: Text(
            task.title,
            style: TextStyle(
              decoration: task.isDone
                  ? TextDecoration.lineThrough
                  : TextDecoration.none,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Text(FormatUtils.formatTime(task.createdAt)),
          // Dùng Utils ở đây
          value: task.isDone,
          onChanged: (bool? newValue) {
            if (newValue != null) {
              controller.updateStatus(task.id, newValue); // Cập nhật checkbox
            }
          },
          activeColor: Colors.green,
        ),
      ),
    );
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/task_model.dart';

class TaskController {
  // Trỏ đến bảng 'tasks' trong Firestore
  final CollectionReference _tasksCollection = FirebaseFirestore.instance
      .collection('tasks');

  // 1. LẤY DỮ LIỆU (Read - Realtime)
  Stream<List<TaskModel>> getTasksStream() {
    return _tasksCollection
        .orderBy('createdAt', descending: true)
        .snapshots()
        .map((snapshot) {
          return snapshot.docs.map((doc) {
            return TaskModel.fromMap(
              doc.data() as Map<String, dynamic>,
              doc.id,
            );
          }).toList();
        });
  }

  // 2. THÊM MỚI (Create)
  Future<void> addTask(String title) async {
    await _tasksCollection.add({
      'title': title,
      'isDone': false,
      'createdAt': FieldValue.serverTimestamp(), // Tự động lấy giờ server
    });
  }

  // 3. CẬP NHẬT TRẠNG THÁI (Update)
  Future<void> updateStatus(String taskId, bool isDone) async {
    await _tasksCollection.doc(taskId).update({'isDone': isDone});
  }

  // 4. XÓA (Delete)
  Future<void> deleteTask(String taskId) async {
    await _tasksCollection.doc(taskId).delete();
  }
}

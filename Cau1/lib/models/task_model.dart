import 'package:cloud_firestore/cloud_firestore.dart';

class TaskModel {
  String id;
  String title;
  bool isDone;
  Timestamp createdAt;

  TaskModel({
    required this.id,
    required this.title,
    this.isDone = false,
    required this.createdAt,
  });

  // Chuyển dữ liệu từ Firestore (Map) thành Object Dart
  factory TaskModel.fromMap(Map<String, dynamic> data, String documentId) {
    return TaskModel(
      id: documentId,
      title: data['title'] ?? '',
      isDone: data['isDone'] ?? false,
      createdAt: data['createdAt'] ?? Timestamp.now(),
    );
  }
}
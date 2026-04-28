import 'package:cloud_firestore/cloud_firestore.dart';

class FormatUtils {
  // Hàm chuyển đổi Timestamp của Firestore thành dạng giờ/phút dễ đọc
  static String formatTime(Timestamp timestamp) {
    DateTime date = timestamp.toDate();
    return "${date.hour.toString().padLeft(2, '0')}:${date.minute.toString().padLeft(2, '0')} - ${date.day}/${date.month}/${date.year}";
  }
}

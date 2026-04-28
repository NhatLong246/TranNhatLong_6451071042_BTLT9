import 'package:firebase_auth/firebase_auth.dart';

class AuthController {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Lấy thông tin người dùng hiện tại (nếu đã đăng nhập)
  User? get currentUser => _auth.currentUser;

  // Luồng theo dõi trạng thái (đăng nhập/đăng xuất)
  Stream<User?> get authStateChanges => _auth.authStateChanges();

  // Hàm Đăng nhập
  Future<String?> login(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return null; // Trả về null nếu thành công
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') return 'Không tìm thấy tài khoản với email này.';
      if (e.code == 'wrong-password') return 'Mật khẩu không chính xác.';
      if (e.code == 'invalid-email') return 'Định dạng email không hợp lệ.';
      return 'Lỗi đăng nhập: ${e.message}';
    }
  }

  // Hàm Đăng ký
  Future<String?> register(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(email: email, password: password);
      return null; // Thành công
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') return 'Mật khẩu quá yếu (cần ít nhất 6 ký tự).';
      if (e.code == 'email-already-in-use') return 'Email này đã được đăng ký.';
      if (e.code == 'invalid-email') return 'Định dạng email không hợp lệ.';
      return 'Lỗi đăng ký: ${e.message}';
    }
  }

  // Hàm Đăng xuất
  Future<void> logout() async {
    await _auth.signOut();
  }
}
import os

readme_content = """# Flutter Firebase Exercises - To-do List & Authentication

Bài tập thực hành về kết nối Flutter với Google Firebase, tập trung vào các dịch vụ Core, Cloud Firestore và Authentication.

## 📌 Các bài tập

### Bài 1: Danh sách công việc cá nhân (To-do List - Firestore CRUD)
Ứng dụng quản lý công việc hàng ngày với các tính năng:
* **Create:** Thêm công việc mới thông qua Dialog.
* **Read:** Lấy dữ liệu thời gian thực (Real-time) từ Cloud Firestore bằng `StreamBuilder`.
* **Update:** Cập nhật trạng thái hoàn thành (Checkbox) đồng bộ ngay lập tức lên Cloud.
* **Delete:** Chức năng xóa công việc bằng hành động vuốt (Dismissible).

### Bài 2: Hệ thống Xác thực (Firebase Authentication)
Hệ thống quản lý người dùng sử dụng email và mật khẩu:
* Đăng ký tài khoản mới và lưu trữ trên Firebase Auth.
* Đăng nhập và quản lý trạng thái phiên làm việc (Auth State).
* Phân luồng giao diện tự động: Nếu đã login vào màn hình Home, nếu chưa login vào màn hình Login.
* Đăng xuất và xóa phiên làm việc.

## 📂 Cấu trúc thư mục (Project Architecture)

```text
lib/
├── apps/        # Cấu hình tổng thể ứng dụng và điều hướng chính
├── controller/  # Xử lý logic nghiệp vụ và tương tác với Firebase API
├── models/      # Định nghĩa các lớp dữ liệu (TaskModel, UserModel)
├── utils/       # Các hàm tiện ích, định dạng ngày tháng, validator
├── views/       # Giao diện người dùng (UI) chính của ứng dụng
├── widget/      # Các thành phần giao diện nhỏ, có tính tái sử dụng cao
├── main.dart    # Điểm khởi chạy ứng dụng (Entry point)
└── firebase_options.dart # Cấu hình kết nối Firebase (Tự động sinh)
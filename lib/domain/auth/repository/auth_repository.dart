import 'package:dartz/dartz.dart';
import 'package:toeicsoeasy/data/auth/models/signup_user_req_params.dart';

/// Lớp `AuthRepository` là một lớp trừu tượng, tức là nó chỉ định nghĩa các phương thức mà không có thực thi cụ thể.
/// Mục đích của lớp này là để xác định một giao diện (interface) cho các lớp thực thi cụ thể hơn.
/// Bằng cách sử dụng lớp này, chúng ta có thể dễ dàng thay thế hoặc mở rộng các chức năng xác thực mà không cần phải thay đổi nhiều trong mã nguồn.
/// Nó cung cấp hai phương thức chính: 
/// - `register`: dùng để đăng ký tài khoản mới với email và mật khẩu.
/// - `login`: dùng để đăng nhập với email và mật khẩu.
/// Các lớp thực thi cụ thể sẽ phải thực hiện các phương thức này để cung cấp chức năng đăng ký và đăng nhập thực tế.

abstract class AuthRepository { 

  Future<Either> signup(SignupReqParams signupUserReq);

  Future<Either> login(SignupReqParams user);
}

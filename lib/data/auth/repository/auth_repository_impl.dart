import 'package:dartz/dartz.dart';
import 'package:toeicsoeasy/core/service_locator.dart';
import 'package:toeicsoeasy/data/auth/models/signup_user_req_params.dart';
import 'package:toeicsoeasy/data/auth/source/auth_api_services.dart';
import 'package:toeicsoeasy/domain/auth/repository/auth_repository.dart';

class AuthRepositoryImpl extends AuthRepository {
  @override
  Future<Either> signup(SignupReqParams signupUserReq) async {
    return servicelocator<AuthApiService>().signup(signupUserReq);
  }

  @override
  Future<Either> login(user) {
    throw UnimplementedError();
  }
}

import 'package:dartz/dartz.dart';
import 'package:toeicsoeasy/core/service_locator.dart';
import 'package:toeicsoeasy/features/auth/data/models/signup_user_req_params.dart';
import 'package:toeicsoeasy/features/auth/data/datasources/auth_api_services.dart';
import 'package:toeicsoeasy/features/auth/domain/repositories/auth_repository.dart';

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

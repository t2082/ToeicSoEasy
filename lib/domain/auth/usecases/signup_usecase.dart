import 'package:dartz/dartz.dart';
import 'package:toeicsoeasy/core/service_locator.dart';
import 'package:toeicsoeasy/core/usecase/usecase.dart';
import 'package:toeicsoeasy/data/auth/models/signup_user_req_params.dart';
import 'package:toeicsoeasy/domain/auth/repository/auth_repository.dart';



class SignupUseCase implements UseCase<Either, SignupReqParams> { //Kế thừa, thực thi một giao diện có tên UseCase<T, Params>
  @override
  Future<Either> call({SignupReqParams? params}) async {
    return servicelocator<AuthRepository>().signup(params!);
  }
}

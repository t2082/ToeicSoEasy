import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:toeicsoeasy/core/contants/api_url.dart';
import 'package:toeicsoeasy/core/network/dio/api_services.dart';
import 'package:toeicsoeasy/core/service_locator.dart';
import 'package:toeicsoeasy/data/auth/models/signup_user_req_params.dart';

abstract class AuthApiService {
  Future<Either> signup(SignupReqParams signupUserReq);
}

class AuthApiServicesImp extends AuthApiService {
  @override
  Future<Either> signup(SignupReqParams signupUserReq) async {
    try {
      var response = await servicelocator<ApiService>()
          .post(ApiUrl.signup, data: signupUserReq.toMap());
      // log(response.toString(), name: 'line 19, auth_api_services.dart');
      return Right(response);
    } catch (e) {
      return Left(e);
      // log(e.toString(), name: 'line 22, auth_api_services.dart');
    }
  }
}

import 'package:get_it/get_it.dart';
import 'package:toeicsoeasy/core/network/dio/api_services.dart';
import 'package:toeicsoeasy/data/auth/repository/auth_repository_impl.dart';
import 'package:toeicsoeasy/data/auth/source/auth_api_services.dart';
import 'package:toeicsoeasy/domain/auth/repository/auth_repository.dart';
import 'package:toeicsoeasy/domain/auth/usecases/signup_usecase.dart';

// registerSingleton đăng ký một Singleton duy nhất trong source

final servicelocator = GetIt.instance;

Future<void> initializeDependencies() async {
  // Usecases
  servicelocator.registerSingleton<SignupUseCase>(SignupUseCase());
  // Repository
  servicelocator.registerSingleton<AuthRepository>(AuthRepositoryImpl());
  // Services
  servicelocator.registerSingleton<AuthApiService>(AuthApiServicesImp());

  servicelocator.registerSingleton<ApiService>(ApiService());
}

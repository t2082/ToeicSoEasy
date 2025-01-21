import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:toeicsoeasy/core/configs/app_config.dart';
import 'package:toeicsoeasy/core/service_locator.dart';

import 'core/route/app_route.dart';

Future<void> main() async {
  AppRoute().register();
  WidgetsFlutterBinding
      .ensureInitialized(); // Đảm bảo WidgetsFlutterBinding đã được khởi tạo
  try {
    await dotenv.load(fileName: ".env");
    log('Loaded .env file !!!', name: "main");
  } catch (e) {
    log('Error loading .env file: $e', name: "error");
  }
  await initializeDependencies();
  runApp(const App());
}

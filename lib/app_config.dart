import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../configs/register_app_route.dart';
import '../../../presentation/splash/bloc/splash_cubit.dart';
import '../../../presentation/splash/pages/splash_page.dart';

class App extends StatelessWidget {
  const App({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SplashCubit()
        ..appStarted(), // Gọi hàm appStarted ngay sau khi SplashCubit được tạo
      child: ResponsiveSizer(builder: (context, orientation, screenType) {
        return MaterialApp(
            initialRoute: '/',
            routes: RegisterRoutes.routes,
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            home: SplashPage());
      }),
    );
  }
}

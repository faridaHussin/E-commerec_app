import 'package:ecommerec_app/ui/auth/login/LoginScreen.dart';
import 'package:ecommerec_app/ui/auth/register/RegisterScreen.dart';
import 'package:ecommerec_app/ui/splash/SplashScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: LoginScreen.routeName,
          routes: {
            SplashScreen.routeName: (context) => SplashScreen(),
            RegisterScreen.routeName: (context) => RegisterScreen(),
            LoginScreen.routeName: (context) => LoginScreen(),
          },
        );
      },
    );
  }
}

import 'package:fastfood/fastfood/presentations/screens/account/sign_up_screen.dart';
import 'package:fastfood/fastfood/presentations/screens/map/run_map_screen.dart';
import 'package:fastfood/fastfood/presentations/screens/recommendfood/recommendfood.dart';
import 'package:flutter/material.dart';
import 'package:fastfood/fastfood/presentations/screens/Home/home_screen.dart';
import 'package:fastfood/fastfood/presentations/screens/account/login_screen.dart';
import 'package:fastfood/fastfood/presentations/screens/splash/splash_screen.dart';

final Map<String, WidgetBuilder> routes = {
  HomeScreen.routeName: (context) => const HomeScreen(),
  LoginScreen.routeName: (context) => const LoginScreen(),
  SplashScreen.routeName: (context) => const SplashScreen(),
  SignUpScreen.routeName: (context) => const SignUpScreen(),
  RecommendFoodSrceen.routeName: (context) => RecommendFoodSrceen(),
  RunMap.routeName: (context) => RunMap(),
};

class Routes {
  static String runTarget = '/runTarget';
  static String setTarget = '/setTarget';
  static String otherTarget = '/otherTarget';
  static String map = '/map';
  static String navigationHome = '/navigationHome';
  static String genderSelector = '/gender';
  static String recommend = '/recommend';
}

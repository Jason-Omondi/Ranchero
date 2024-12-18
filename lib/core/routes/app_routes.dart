import 'package:get/get.dart';
import '../../presentation/splash_screen/splash_screen.dart';
import '../../presentation/sign_up_screen/sign_up_screen.dart';
import 'package:bumpyj/presentation/dashboard/dashboard_screen.dart';
import 'package:bumpyj/presentation/login_screen/signin_screen.dart';
import '../../presentation/sign_up_screen/bindings/sign_up_bindings.dart';
import '../../presentation/splash_screen/bindings/splash_screen_bindings.dart';
import 'package:bumpyj/presentation/login_screen/bindings/signin_screen_binding.dart';
import 'package:bumpyj/presentation/dashboard/bindings/dashboard_screen_bindings.dart';

class AppRoutes {
  static const splash = '/splash';
  static const signInScreen = '/login';
  static const signUpScreen = '/signup';
  static const dashboardScreen = '/dashboard';
  //static const profile = '/profile';

  static List<GetPage> pages = [
    GetPage(
        name: splash,
        page: () => SplashScreen(),
        binding: SplashScreenBindings()),
    GetPage(
        name: signInScreen,
        page: () => SigninScreen(),
        binding: SigninScreenBinding()),
    GetPage(
        name: signUpScreen,
        page: () => SignUpScreen(),
        binding: SignupScreenBindings()),
    GetPage(
        name: dashboardScreen,
        page: () => DashboardScreen(),
        binding: DashboardScreenBindings()),
  ];
}

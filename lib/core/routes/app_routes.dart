import 'package:get/get.dart';
import '../../presentation/splash_screen/splash_screen.dart';
import 'package:bumpyj/presentation/login_screen/signin_screen.dart';
import '../../presentation/splash_screen/bindings/splash_screen_bindings.dart';
import 'package:bumpyj/presentation/login_screen/bindings/signin_screen_binding.dart';

class AppRoutes {
  static const splash = '/splash';
  static const signInScreen = '/login';
  //static const home = '/home';
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
  ];
}

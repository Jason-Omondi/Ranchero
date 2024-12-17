import 'package:get/get.dart';
import 'package:bumpyj/core/routes/app_routes.dart';
import 'package:bumpyj/presentation/login_screen/signin_screen.dart';

class SplashScreenController extends GetxController {
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    _home();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void _home() async {
    await Future.delayed(const Duration(seconds: 5));
    Get.toNamed(AppRoutes.signInScreen);
  }
}

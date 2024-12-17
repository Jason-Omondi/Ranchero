import 'package:get/get.dart';
import '../controller/splash_screen_controller.dart';


class SplashScreenBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(SplashScreenController());
  }
}

import 'package:get/get.dart';
import 'package:bumpyj/presentation/login_screen/signin_screen.dart';
import 'package:bumpyj/presentation/login_screen/controller/signin_controller.dart';

class SigninScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(SigninController());
  }
}

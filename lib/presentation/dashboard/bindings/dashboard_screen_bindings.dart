import 'package:get/get.dart';
import '../dashboard_screen.dart';

class DashboardScreenBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(DashboardScreen());
  }
}

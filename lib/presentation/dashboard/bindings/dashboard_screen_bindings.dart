import 'package:get/get.dart';
import '../controller/dashboard_controller.dart';

class DashboardScreenBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(DashboardController());
  }
}

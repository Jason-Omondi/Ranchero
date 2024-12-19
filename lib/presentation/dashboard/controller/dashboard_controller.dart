import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

final userdata = GetStorage();

class DashboardController extends GetxController {
  final isDarkMode = Get.isDarkMode;

  //var token = userdata.read("token");
  final fullName = userdata.read("fullname");
  final email = userdata.read("email");
  final phone = userdata.read("phoneNumber");
  final role = userdata.read("role");
  final employeeNo = userdata.read("employeeNumber");

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}

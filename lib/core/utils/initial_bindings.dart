import 'package:get/get.dart';
import 'package:bumpyj/core/utils/helpers.dart';
import 'package:bumpyj/data/providers/api_client.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(ApiClient());
    Connectivity connectivity = Connectivity();
    Get.put(NetworkInfo(connectivity));
  }
}

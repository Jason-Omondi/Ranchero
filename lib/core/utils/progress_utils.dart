import 'package:get/get.dart';
import 'package:flutter/material.dart';

class ProgressDialogUtils {
  static bool isProgressVisible = false;

  static void showProgressDialog({isCanacelleble = false}) async {
    if (!isProgressVisible) {
      Get.dialog(
        const Center(
          child: CircularProgressIndicator(
            strokeWidth: 4,
            valueColor: AlwaysStoppedAnimation<Color>(
              Colors.white,
            ),
          ),
        ),
        barrierDismissible: isCanacelleble,
      );
      isProgressVisible = true;
    }
  }

  static void hideProgressDialog() {
    if (isProgressVisible) Get.back();
    isProgressVisible = false;
  }
}

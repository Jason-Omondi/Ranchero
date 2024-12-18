import 'package:get/get.dart';
import '../model/signup_model.dart';
import 'package:flutter/material.dart';
import '../../../core/utils/exceptions.dart';
import '../../../data/providers/api_client.dart';
import '../../../core/constants/app_colors.dart';
import '../../../data/models/user/user_data.dart';
import '../../../data/models/login/post_login_resp.dart';

class SignupController extends GetxController {
  final FocusNode usernameFocus = FocusNode();
  final FocusNode passwordFocus = FocusNode();
  final FocusNode passwordcFocus = FocusNode();
  TextEditingController empNoController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordcController = TextEditingController();
  var isPasswordHidden = true.obs;
  var iscfPasswordHidden = true.obs;
  Rx<SignupModel> signInModelObj = SignupModel().obs;
  DefaultResponse postLoginResp = DefaultResponse();
  final isDarkMode = Get.isDarkMode;

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

  void callcreateSignUp(Map req,
      {VoidCallback? successCall, VoidCallback? errCall}) async {
    return Get.find<ApiClient>().Register(
      onSuccess: (resp) {
        onCreateSignUpSuccess(resp);
        if (successCall != null) {
          successCall();
        }
      },
      onError: (err) {
        onCreateSignUpError(err);
      },
      requestData: req,
    );
  }

  void onCreateSignUpSuccess(var response) {
    postLoginResp = DefaultResponse.fromJson(response);

    if (postLoginResp.status.toString() == "1") {
      //convert the array to user object
      var data = UserModel.fromJson(postLoginResp.data!);
      debugPrint("Login Successful: ${data.fullName},");
    }
  }

  void onCreateSignUpError(var err) {
    if (err is NoInternetException) {
      debugPrint(
          "Login Successful but something failed in the code: ${err.toString()},");
      Get.snackbar(
        "Error!",
        err != null ? '$err' : "Something went wrong, but it's not your fault",
        backgroundColor:
            isDarkMode ? AppColors.backgroundColor : AppColors.primaryColor,
        colorText:
            isDarkMode ? AppColors.darkBackground : AppColors.backgroundColor,
      );
    }
  }
}

import 'package:get/get.dart';
import '../model/signin_model.dart';
import 'package:flutter/material.dart';
import '../../../core/utils/exceptions.dart';
import 'package:bumpyj/data/providers/api_client.dart';
import 'package:bumpyj/data/models/user/user_data.dart';
import 'package:bumpyj/data/models/login/post_login_resp.dart';

class SigninController extends GetxController {
  final FocusNode usernameFocus = FocusNode();
  final FocusNode passwordFocus = FocusNode();
  TextEditingController empNoController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var isPasswordHidden = true.obs;
  Rx<SignInModel> signInModelObj = SignInModel().obs;
  DefaultResponse postLoginResp = DefaultResponse();

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
    empNoController.dispose();
    passwordController.dispose();
  }

  void callcreateLogin(Map req,
      {VoidCallback? successCall, VoidCallback? errCall}) async {
    return Get.find<ApiClient>().createLogin(
      onSuccess: (resp) {
        onCreateLoginSuccess(resp);
        if (successCall != null) {
          successCall();
        }
      },
      onError: (err) {
        onCreateLoginError(err);
      },
    );
  }

  void onCreateLoginSuccess(var response) {
    postLoginResp = DefaultResponse.fromJson(response);

    if (postLoginResp.status == 1) {
      //convert the array to user object
      var data = UserModel.fromJson(postLoginResp.data!);
      debugPrint("Login Successful: ${data},");
    }
  }

  void onCreateLoginError(var err) {
    if (err is NoInternetException) {
      Get.rawSnackbar(
        messageText: Text(
          '$err',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      );
    }
  }
}

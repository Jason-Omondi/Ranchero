import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import '../../core/widgets/custom_button.dart';
import 'package:bumpyj/core/utils/extensions.dart';
import 'package:bumpyj/core/routes/app_routes.dart';
import 'package:bumpyj/core/constants/app_colors.dart';
import 'package:bumpyj/data/models/user/user_data.dart';
import 'package:bumpyj/core/widgets/custom_text_widget.dart';
import 'package:bumpyj/presentation/login_screen/controller/signin_controller.dart';

// ignore: must_be_immutable
class SigninScreen extends GetWidget<SigninController> {
  SigninScreen({super.key});
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Get.isDarkMode;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: context.isSmallScreen ? 20.0 : 50.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: context.deviceHeight * 0.1),

              // Placeholder Lottie Animation
              Hero(
                tag: 'signup-hero',
                child: LottieBuilder.asset(
                  'assets/imgs/login_animation.json',
                  height: context.isSmallScreen
                      ? 150
                      : context.isMediumScreen
                          ? 180
                          : 220,
                ),
              ),

              SizedBox(height: context.deviceHeight * 0.02),

              // Welcome Text
              Text(
                'Welcome Back',
                style: context.theme.textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: context.isSmallScreen ? 20 : 24,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Log in to continue',
                style: context.theme.textTheme.bodyMedium?.copyWith(
                  color: context.colorScheme.onSurface.withOpacity(0.7),
                  fontSize: context.isSmallScreen ? 14 : 16,
                ),
              ),

              SizedBox(height: context.deviceHeight * 0.03),

              // Form
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    // Employee Number
                    CustomLabelText(
                      text: "Staff Number",
                      style: context.theme.textTheme.bodyMedium?.copyWith(
                        color: isDarkMode
                            ? AppColors.textDark
                            : AppColors.textLight,
                        fontWeight: FontWeight.bold,
                        fontSize: context.isSmallScreen ? 16 : 18,
                      ),
                    ),

                    TextFormField(
                      controller: controller.empNoController,
                      focusNode: controller.usernameFocus,
                      decoration: InputDecoration(
                        labelText: 'Type your employee number',
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(
                            color: context.colorScheme.secondary,
                            width: 1.0,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: context.colorScheme.primary,
                            width: 2.0,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: context.deviceHeight * 0.02),

                    // Password Field
                    CustomLabelText(
                      text: "Password",
                      style: context.theme.textTheme.bodyMedium?.copyWith(
                        color: isDarkMode
                            ? AppColors.textDark
                            : AppColors.textLight,
                        fontWeight: FontWeight.bold,
                        fontSize: context.isSmallScreen ? 16 : 18,
                      ),
                    ),
                    Obx(
                      () => TextField(
                        controller: controller.passwordController,
                        focusNode: controller.passwordFocus,
                        obscureText: controller.isPasswordHidden.value,
                        decoration: InputDecoration(
                          labelText: 'Type your password',
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(
                              color: context.colorScheme.secondary,
                              width: 1.0,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: context.colorScheme.primary,
                              width: 2.0,
                            ),
                          ),
                          suffix: InkWell(
                            onTap: () => controller.isPasswordHidden.toggle(),
                            child: Icon(
                              controller.isPasswordHidden.value
                                  ? Icons.visibility_outlined
                                  : Icons.visibility_off,
                              color: isDarkMode
                                  ? context.colorScheme.onPrimary
                                  : context.colorScheme.onSurface,
                            ),
                          ),
                        ),
                      ),
                    ),

                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {
                          // Forgot Password Handler
                        },
                        child: Text(
                          "Forgot Password?",
                          style: context.theme.textTheme.bodyMedium?.copyWith(
                            color: AppColors.textRed,
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: context.deviceHeight * 0.03),

                    // Login Button

                    CustomButton(
                      label: "Log in",
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          print("tring...");
                          ontapLoginBtn();
                        }
                        // Handle button click
                      },
                      backgroundColor: isDarkMode
                          ? AppColors.backgroundColor
                          : AppColors.primaryColor,
                      textColor: isDarkMode
                          ? AppColors.primaryColor
                          : context.colorScheme.onPrimary,
                      borderRadius: 5.0,
                      elevation: 5.0,
                      //borderColor: Colors.deepPurpleAccent,
                      borderWidth: 1.5,
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                    ),
                  ],
                ),
              ),

              SizedBox(height: context.deviceHeight * 0.04),

              // Sign Up Row
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "First time?",
                    style: TextStyle(
                      color: context.colorScheme.onSurface,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      // Handle sign up
                      ontapSignupBtn();
                    },
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                        color: context.colorScheme.secondary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void ontapSignupBtn() {
    Get.toNamed(AppRoutes.signUpScreen);
  }

  final userdata = GetStorage();
  final isDarkMode = Get.isDarkMode;

  void _onCreateLoginSuccess() async {
    if (controller.postLoginResp.status.toString() == "1") {
      Get.snackbar("Success!!", "Welcome Back To Enagel!",
          backgroundColor:
              isDarkMode ? AppColors.backgroundColor : AppColors.primaryColor,
          colorText:
              isDarkMode ? AppColor.darkBackground : AppColors.backgroundColor,
          snackPosition: SnackPosition.TOP);

      //extract the data
      final token = controller.postLoginResp.returnValue;
      userdata.write("token", token);
      final serverresp = UserModel.fromJson(controller.postLoginResp.data!);
      userdata.write("fullname", serverresp.fullName);
      userdata.write("email", serverresp.email);
      userdata.write("role", serverresp.role);
      userdata.write("phoneNumber", serverresp.phoneNumber);
      userdata.write("employeeNumber", serverresp.employeeNumber);

      Get.toNamed(AppRoutes.dashboardScreen);
    }
  }

  void _onCreateLoginError() {
    Get.snackbar(
        "Error!!",
        controller.postLoginResp.message ??
            "Invalid Credentials or Something went Wrong",
        backgroundColor: isDarkMode
            ? AppColors.snackbarbackgroundColorDark
            : AppColors.snackbarbackgroundColorLight,
        colorText:
            isDarkMode ? AppColor.darkBackground : AppColors.backgroundColor,
        snackPosition: SnackPosition.TOP);
  }

  void ontapLoginBtn() async {
    UserModel userModel = UserModel();

    userModel.employeeNumber = controller.empNoController.text.toUpperCase();
    userModel.password = controller.passwordController.text;
    userModel.email = "";
    userModel.phoneNumber = "";
    userModel.fullName = "";
    userModel.role = "";

    controller.callcreateLogin(
      userModel.toJson(),
      successCall: _onCreateLoginSuccess,
      errCall: _onCreateLoginError,
    );
  }
}

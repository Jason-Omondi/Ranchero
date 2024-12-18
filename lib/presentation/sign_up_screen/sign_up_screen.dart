import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';
import '../../core/routes/app_routes.dart';
import 'package:get_storage/get_storage.dart';
import '../../core/constants/app_colors.dart';
import '../../core/widgets/custom_button.dart';
import '../../data/models/user/user_data.dart';
import 'package:bumpyj/core/utils/extensions.dart';
import '../../core/widgets/custom_text_widget.dart';
import 'package:bumpyj/presentation/sign_up_screen/controller/signup_controller.dart';

class SignUpScreen extends GetWidget<SignupController> {
  SignUpScreen({super.key});

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

              Text(
                'Welcome!',
                style: context.theme.textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: context.isSmallScreen ? 20 : 24,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Sign in with you company staff number',
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
                        controller: controller.passwordcController,
                        focusNode: controller.passwordcFocus,
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

                    SizedBox(height: context.deviceHeight * 0.02),

                    // Password Field
                    CustomLabelText(
                      text: "Confirm Password",
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
                          labelText: 'Confirm your password',
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
                            onTap: () => controller.iscfPasswordHidden.toggle(),
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

                    SizedBox(height: context.deviceHeight * 0.03),

                    // Login Button

                    CustomButton(
                      label: "Sign up",
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          if (controller.passwordController.text ==
                              controller.passwordcController.text) {
                            ontapSignInBtn();
                          } else {
                            Get.snackbar("Info!", "Passwords do not match",
                                snackPosition: SnackPosition.TOP);
                          }
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

              SizedBox(height: context.deviceHeight * 0.03),

              // Sign Up Row
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Have an account?",
                    style: TextStyle(
                      color: context.colorScheme.onSurface,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      onTapLoginBtn();
                    },
                    child: Text(
                      'Sign In',
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

  void onTapLoginBtn() {
    Get.toNamed(AppRoutes.signInScreen);
  }

  final userdata = GetStorage();
  final isDarkMode = Get.isDarkMode;

  void _onCreateSignUpSuccess() async {
    if (controller.postLoginResp.status.toString() == "1") {
      Get.snackbar("Success!!", "Proceed to login!",
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

      Get.toNamed(AppRoutes.signInScreen);
    }
  }

  void _onCreateSignUpError() {
    print(
        "Login Successful but something failed: ${controller.postLoginResp.message},");
    Get.snackbar("Error!!", "Invalid Credentials or Something went Wrong",
        colorText:
            isDarkMode ? AppColor.darkBackground : AppColors.backgroundColor,
        snackPosition: SnackPosition.TOP);
  }

  void ontapSignInBtn() async {
    UserModel userModel = UserModel();

    userModel.employeeNumber = controller.empNoController.text.toUpperCase();
    userModel.password = controller.passwordController.text;
    userModel.email = "";
    userModel.phoneNumber = "";
    userModel.fullName = "";
    userModel.role = "";
    controller.callcreateSignUp(
      userModel.toJson(),
      successCall: _onCreateSignUpSuccess,
      errCall: _onCreateSignUpError,
    );
  }
}

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
import 'package:bumpyj/data/models/login/post_login_resp.dart';
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
              LottieBuilder.asset(
                'assets/imgs/login_animation.json',
                height: context.isSmallScreen
                    ? 150
                    : context.isMediumScreen
                        ? 180
                        : 220,
              ),

              SizedBox(height: context.deviceHeight * 0.02),

              // Welcome Text
              Text(
                'Welcome Back',
                style: context.theme.textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: context.isSmallScreen ? 16 : 20,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Log in to continue',
                style: context.theme.textTheme.bodyMedium?.copyWith(
                  color: context.colorScheme.onSurface.withOpacity(0.7),
                  fontSize: context.isSmallScreen ? 12 : 14,
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
                      text: "Employee Number",
                      style: context.theme.textTheme.bodyMedium?.copyWith(
                        color: isDarkMode
                            ? AppColors.textDark
                            : AppColors.textLight,
                      ),
                    ),

                    TextFormField(
                      controller: controller.empNoController,
                      focusNode: controller.usernameFocus,
                      decoration: InputDecoration(
                        labelText: 'Employee Number',
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
                      ),
                    ),
                    Obx(
                      () => TextField(
                        controller: controller.passwordController,
                        focusNode: controller.passwordFocus,
                        obscureText: controller.isPasswordHidden.value,
                        decoration: InputDecoration(
                          labelText: 'Password',
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
                        //if (_formKey.currentState!.validate()) {
                        print("tring...");
                        ontapLoginBtn();
                        //}
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
                    "Don't Have an Account?",
                    style: TextStyle(
                      color: context.colorScheme.onSurface,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      // Handle sign up
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

      Get.toNamed(AppRoutes.splash);
    }
  }

  void _onCreateLoginError() {
    Get.snackbar("Error!!", "Invalid Credentials or Something went Wrong",
        colorText:
            isDarkMode ? AppColor.darkBackground : AppColors.backgroundColor,
        snackPosition: SnackPosition.TOP);
  }

  void ontapLoginBtn() async {
    UserModel userModel = UserModel();

    userModel.employeeNumber = controller.empNoController.text.toUpperCase();
    userModel.password = controller.passwordController.text;
    controller.callcreateLogin(
      userModel.toJson(),
      successCall: _onCreateLoginSuccess,
      errCall: _onCreateLoginError,
    );
  }
}




/*
class SigninScreen extends GetWidget<SigninController> {
  SigninScreen({super.key});
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Get.isDarkMode;
    final deviceSize = context.deviceSize;
    final deviceHeight = context.deviceHeight;
    final deviceWidth = context.deviceWidth;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    const Gap(80),

                    // Placeholder Image
                    LottieBuilder.asset(
                      'assets/imgs/login_animation.json', // Replace with your asset
                      height: 200,
                      width: 200,
                    ),

                    const Gap(20),

                    Text(
                      'Welcome Back',
                      style: context.theme.textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: context.theme.colorScheme.onSurface,
                      ),
                    ),

                    const Gap(15),
                    Text(
                      'Log in to continue',
                      style: context.theme.textTheme.bodyMedium?.copyWith(
                        color: context.theme.colorScheme.onSurface
                            .withOpacity(0.7),
                      ),
                    ),
                    const Gap(10),
                    TextFormField(
                      controller: controller.empNoController,
                      focusNode: controller.usernameFocus,
                      decoration: InputDecoration(
                          labelText: 'Employee Number',
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: BorderSide(
                                  color: context.colorScheme.secondary,
                                  width: 1.0)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide(
                                  color: context.colorScheme.primary,
                                  width: 2.0))),
                    ),

                    const Gap(20),
                    Obx(
                      () => TextField(
                        controller: controller.passwordController,
                        focusNode: controller.passwordFocus,
                        obscureText: controller.isPasswordHidden.value,
                        decoration: InputDecoration(
                            labelText: 'Password',
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide: BorderSide(
                                    color: context.colorScheme.secondary,
                                    width: 1.0)),
                            hintText: "Password",
                            suffix: InkWell(
                                onTap: () =>
                                    controller.isPasswordHidden.toggle(),
                                child: Icon(
                                  controller.isPasswordHidden.value
                                      ? Icons.visibility_outlined
                                      : Icons.visibility_off,
                                  color: context.colorScheme.surface,
                                )),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(
                                    color: context.colorScheme.primary,
                                    width: 2.0))),
                        //obscureText: true,
                      ),
                    ),

                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                          onPressed: () {},
                          child: Text(
                            "Forgot Password?",
                            style: context.theme.textTheme.bodyMedium
                                ?.copyWith(color: AppColors.textRed),
                          )),
                    ),

                    const Gap(20),

                    //buton
                    SizedBox(
                      width: double.infinity,
                      height: deviceHeight * 0.05,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: isDarkMode
                                  ? AppColors.backgroundColor
                                  : AppColors.primaryColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              )),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              //controller.callcreateLogin();
                            }
                          },
                          child: Text(
                            "Log in",
                            style: context.theme.textTheme.bodyLarge?.copyWith(
                                color: isDarkMode
                                    ? AppColors.primaryColor
                                    : context.colorScheme.onPrimary,
                                fontWeight: FontWeight.bold),
                          )),
                    ),
                  ],
                ),
              ),

              // Sign Up Text
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't Have an Account?",
                    style: TextStyle(
                      color: context.theme.colorScheme.onSurface,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      // Handle sign up
                    },
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                        color: context.theme.colorScheme.secondary,
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
}
*/

/*                  SizedBox(
                      width: double.infinity,
                      height: context.deviceHeight * 0.06,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: isDarkMode
                              ? AppColors.backgroundColor
                              : AppColors.primaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            // Handle login
                          }
                        },
                        child: Text(
                          "Log in",
                          style: context.theme.textTheme.bodyLarge?.copyWith(
                            color: isDarkMode
                                ? AppColors.primaryColor
                                : context.colorScheme.onPrimary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
*/
                   
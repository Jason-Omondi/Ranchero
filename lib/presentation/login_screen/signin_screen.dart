import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';
import 'package:bumpyj/core/utils/extensions.dart';
import 'package:bumpyj/core/constants/app_colors.dart';
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
                              color: context.colorScheme.surface,
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
                    SizedBox(
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
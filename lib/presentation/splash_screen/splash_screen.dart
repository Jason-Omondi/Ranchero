import 'package:get/get.dart';
import 'package:gap/gap.dart';
import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/widgets/custom_clipper.dart';
import 'controller/splash_screen_controller.dart';
import 'package:bumpyj/core/utils/extensions.dart';

class SplashScreen extends GetWidget<SplashScreenController> {
  SplashScreen({
    super.key,
  });

  final controller = Get.find<SplashScreenController>();

  @override
  Widget build(BuildContext context) {
    final deviceSize = context.deviceSize;

    return Scaffold(
      body: Stack(children: [
        Positioned(
          top: 0,
          child: ClipPath(
            clipper: TopCurveClipper(),
            child: Container(
              width: context.deviceWidth,
              height: context.deviceHeight * 0.3,
              //TODO:handle this color depending on app theme
              color: AppColors.primaryColor,
            ),
          ),
        ),
        //const Gap(10),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Gap(450),
              Image.asset(
                'assets/imgs/splash_icon.png',
                height: deviceSize.height * 0.1,
                fit: BoxFit.contain,
              ),
              const Gap(10),
              Text(
                "Ranchero",
                style: context.theme.textTheme.headlineMedium!.copyWith(
                    color: context.colorScheme.primary,
                    fontWeight: FontWeight.w600),
              ),
              const Gap(10),
              Text(
                "Self Service App",
                style: context.theme.textTheme.headlineMedium!.copyWith(
                    color: context.colorScheme.primary,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
        )
      ]),
    );
  }
}

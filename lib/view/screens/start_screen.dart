import 'package:aspen/core/app_helper/app_navigator.dart';
import 'package:aspen/core/constants/app_size.dart';
import 'package:aspen/core/style/app_colors.dart';
import 'package:aspen/view/screens/home_screen.dart';
import 'package:flutter/material.dart';
import '../../core/constants/app_images.dart';
import '../widgets/custom_button.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            AppImages.startBg,
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
          Center(
            child: Padding(
              padding: EdgeInsets.only(
                bottom: AppSize.heightScale(context, 48),
                top: AppSize.heightScale(context, 90),
                right: AppSize.widthScale(context, 55),
                left: AppSize.widthScale(context, 55),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: Text(
                      'Aspen',
                      style: TextStyle(
                        color: AppColors.white,
                        // fontWeight: FontWeight.w600,
                        fontFamily: 'Hiatus',
                        fontSize: AppSize.textScale(context, 116),
                      ),
                    ),
                  ),
                  const Spacer(),
                  Text(
                    'Plan your',
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.5),
                      fontSize: AppSize.textScale(context, 24),
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  Text(
                    'Luxurious\nVacation',
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.8),
                      height: 1,
                      fontSize: AppSize.textScale(context, 40),
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: AppSize.heightScale(context, 24)),
                  CustomButton(
                    onTap: () => AppNavigator.push(context, const HomeScreen(),),
                    child: Text(
                      'Explore',
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: AppSize.textScale(context, 16),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

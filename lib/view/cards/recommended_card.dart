import 'package:aspen/core/constants/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../core/app_helper/app_navigator.dart';
import '../../core/constants/app_size.dart';
import '../../core/style/app_colors.dart';
import '../../model/home/place_model.dart';
import '../screens/place_details_screen.dart';
import '../widgets/custom_icon_with_text.dart';

class RecommendedCard extends StatelessWidget {
  const RecommendedCard({
    super.key,
    required this.placeData,
  });

  final PlaceModel placeData;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => AppNavigator.push(
        context,
        PlaceDetailsScreen(
          placeData: placeData,
        ),
      ),
      child: Container(
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(16)),
            color: AppColors.white,
            boxShadow: [
              BoxShadow(
                color: AppColors.darkGray.withOpacity(0.1),
                offset: const Offset(0, 3),
                blurRadius: 0.2,
                spreadRadius: 0,
              ),
            ]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: AppSize.heightScale(context, 110),
              child: Stack(
                children: [
                  Container(
                    width: AppSize.widthScale(context, 166),
                    height: AppSize.heightScale(context, 102),
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(12),
                      ),
                      image: DecorationImage(
                        image: NetworkImage(placeData.image),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    right: 12,
                    bottom: 0,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(9)),
                          border: Border.all(color: AppColors.white, width: 2),
                          color: AppColors.darkSlateGray),
                      child: Text(
                        placeData.label.toString(),
                        style: TextStyle(
                          fontSize: AppSize.textScale(context, 10),
                          color: AppColors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Text(
              placeData.name,
              style: TextStyle(
                fontSize: AppSize.textScale(context, 14),
                fontWeight: FontWeight.w500,
              ),
            ),
            CustomIconWithText(
              icon: SvgPicture.asset(AppImages.trending),
              text: placeData.reason.toString(),
              textStyle: TextStyle(
                fontSize: AppSize.textScale(context, 10),
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:aspen/controller/home/home_cubit.dart';
import 'package:aspen/core/constants/app_size.dart';
import 'package:aspen/model/home/place_model.dart';
import '../../core/app_helper/app_navigator.dart';
import 'package:flutter/material.dart';
import '../../core/style/app_colors.dart';
import '../screens/place_details_screen.dart';
import '../widgets/custom_icon_with_text.dart';
import '../widgets/fav_button_widget.dart';

class PopularPlacesCard extends StatelessWidget {
  const PopularPlacesCard({super.key, required this.placeData});

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
        width: AppSize.widthScale(context, 188),
        height: AppSize.widthScale(context, 240),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(24),
          ),
          image: DecorationImage(
            image: NetworkImage(placeData.image),
            fit: BoxFit.cover,
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      color: AppColors.blackGray),
                  child: Text(
                    placeData.name,
                    style: TextStyle(
                      fontSize: AppSize.textScale(context, 12),
                      color: AppColors.white,
                    ),
                  ),
                ),
                SizedBox(height: AppSize.heightScale(context, 6),),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                    color: AppColors.blackGray,
                  ),
                  child: CustomIconWithText(
                    icon: const Icon(
                      Icons.star,
                      color: Colors.amberAccent,
                      size: 16,
                    ),
                    text: placeData.rate.toString(),
                    textStyle: TextStyle(
                      fontSize: AppSize.textScale(context, 12),
                      color: AppColors.white,
                    ),
                  ),
                ),
              ],
            ),
            const Spacer(),
            FavButtonWidget(
                isFav: placeData.isFav == 1,
                onTap: () => HomeCubit.get(context)
                    .toggleFav(placeData.id, placeData.isFav)),
          ],
        ),
      ),
    );
  }
}

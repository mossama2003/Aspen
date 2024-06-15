import 'package:aspen/controller/home/home_cubit.dart';
import 'package:aspen/core/constants/app_images.dart';
import 'package:aspen/model/home/place_model.dart';
import 'package:aspen/view/widgets/custom_button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../controller/home/home_state.dart';
import '../../core/app_helper/app_navigator.dart';
import 'package:flutter/material.dart';
import 'package:read_more_text/read_more_text.dart';
import '../../core/constants/app_size.dart';
import '../../core/style/app_colors.dart';
import '../widgets/custom_icon_with_text.dart';
import '../widgets/facilities_widget.dart';
import '../widgets/fav_button_widget.dart';

class PlaceDetailsScreen extends StatelessWidget {
  const PlaceDetailsScreen({
    super.key,
    required this.placeData,
  });

  final PlaceModel placeData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              /// Body Screen
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: AppSize.heightScale(context, 365),
                        child: Stack(
                          children: [
                            Container(
                              height: AppSize.heightScale(context, 340),
                              padding: const EdgeInsets.all(10),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(20)),
                                image: DecorationImage(
                                  image: NetworkImage(
                                    placeData.image,
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: GestureDetector(
                                  onTap: () => AppNavigator.pop(context),
                                  child: Container(
                                    width: AppSize.widthScale(context, 33),
                                    height: AppSize.heightScale(context, 33),
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 12,
                                    ),
                                    decoration: const BoxDecoration(
                                        color: AppColors.white,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(8))),
                                    child: Center(
                                      child:
                                          SvgPicture.asset(AppImages.backArrow),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              right: 0,
                              child: BlocBuilder<HomeCubit, HomeState>(
                                builder: (context, state) {
                                  return FavButtonWidget(
                                    onTap: () => HomeCubit.get(context)
                                        .toggleFav(
                                            placeData.id, placeData.isFav),
                                    width: AppSize.widthScale(context, 45),
                                    height: AppSize.heightScale(context, 45),
                                    iconSize: 25,
                                    isFav: placeData.isFav == 1,
                                  );
                                },
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: AppSize.heightScale(context, 5),
                      ),
                      Row(
                        children: [
                          Text(
                            placeData.name,
                            style: TextStyle(
                              fontSize: AppSize.textScale(context, 24),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const Spacer(),
                          Text(
                            'Show map',
                            style: TextStyle(
                              color: AppColors.blue,
                              fontSize: AppSize.textScale(context, 14),
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: AppSize.heightScale(context, 6),
                      ),
                      CustomIconWithText(
                        icon: SvgPicture.asset(AppImages.star),
                        text:
                            '${placeData.rate} (${placeData.reviewers} Reviews)',
                        textStyle: TextStyle(
                          color: AppColors.darkGray,
                          fontSize: AppSize.textScale(context, 12),
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(
                        height: AppSize.heightScale(context, 16),
                      ),
                      ReadMoreText(
                        placeData.description,
                        numLines: 4,
                        style: TextStyle(
                          color: AppColors.darkSlateGray,
                          fontSize: AppSize.textScale(context, 14),
                          fontWeight: FontWeight.w500,
                        ),
                        readMoreAlign: Alignment.bottomLeft,
                        readMoreText: 'Read more',
                        readLessText: 'Read less',
                        readMoreTextStyle: TextStyle(
                          color: AppColors.blue,
                          fontSize: AppSize.textScale(context, 14),
                          fontWeight: FontWeight.w700,
                        ),
                        readMoreIcon: const Icon(
                          Icons.keyboard_arrow_down_rounded,
                          color: AppColors.blue,
                        ),
                        readLessIcon: const Icon(
                          Icons.keyboard_arrow_up_rounded,
                          color: AppColors.blue,
                        ),
                      ),
                      SizedBox(
                        height: AppSize.heightScale(context, 37),
                      ),
                      Text(
                        'Facilities',
                        style: TextStyle(
                          fontSize: AppSize.textScale(context, 18),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(
                        height: AppSize.heightScale(context, 16),
                      ),
                      SizedBox(
                        height: AppSize.heightScale(context, 74),
                        child: FacilitiesWidget(
                          facilities: placeData.facilities,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              /// Bottom widget
              SizedBox(
                width: double.infinity,
                height: AppSize.heightScale(context, 60),
                child: Row(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Price',
                          style: TextStyle(
                            fontSize: AppSize.textScale(context, 12),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          '\$${placeData.prices}',
                          style: TextStyle(
                              fontSize: AppSize.textScale(context, 24),
                              fontWeight: FontWeight.bold,
                              color: const Color(0xFF2DD7A4)),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: AppSize.widthScale(context, 58),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          CustomButton(
                            onTap: () {},
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Book Now',
                                  style: TextStyle(
                                    color: AppColors.white,
                                    fontSize: AppSize.textScale(context, 16),
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                SizedBox(
                                  width: AppSize.widthScale(context, 5),
                                ),
                                SvgPicture.asset(AppImages.rightArrow)
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

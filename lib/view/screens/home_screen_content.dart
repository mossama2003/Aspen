import 'package:aspen/controller/home/home_cubit.dart';
import 'package:aspen/core/constants/app_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../core/constants/app_images.dart';
import '../../core/style/app_colors.dart';
import '../widgets/categories_widget.dart';
import '../widgets/custom_icon_with_text.dart';
import '../widgets/custom_input_field.dart';
import '../widgets/popular_places_widget.dart';
import '../widgets/recommended_widget.dart';

class HomeScreenContent extends StatefulWidget {
  const HomeScreenContent({super.key});

  @override
  State<HomeScreenContent> createState() => _HomeScreenContentState();
}

class _HomeScreenContentState extends State<HomeScreenContent> {
  @override
  void initState() {
    super.initState();
    HomeCubit.get(context).getCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: AppSize.heightScale(context, 20),
        right: AppSize.widthScale(context, 20),
        left: 20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                'Explore',
                style: TextStyle(
                  fontSize: AppSize.textScale(context, 14),
                  fontWeight: FontWeight.w400,
                  color: const Color(0xFF000000),
                ),
              ),
              const Spacer(),
              CustomIconWithText(
                icon: SvgPicture.asset(AppImages.location1),
                text: 'Aspen, TR',
                textStyle: TextStyle(
                  fontSize: AppSize.textScale(context, 12),
                  fontWeight: FontWeight.w400,
                  color: AppColors.darkGray,
                ),
              ),
              SvgPicture.asset(AppImages.downArrow),
            ],
          ),
          Text(
            'Aspen',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: AppSize.textScale(context, 32),
            ),
          ),
          SizedBox(height: AppSize.heightScale(context, 20)),
          CustomInputField(
            hint: 'Find things to do',
            prefix: SvgPicture.asset(AppImages.search, height: AppSize.heightScale(context, 17.27), width: AppSize.widthScale(context, 16.89), fit: BoxFit.scaleDown,)
          ),
          SizedBox(height: AppSize.heightScale(context, 10),),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: AppSize.heightScale(context, 5),),
                  SizedBox(
                    height: AppSize.heightScale(context, 50),
                    child: const CategoriesWidget(),
                  ),
                  SizedBox(height: AppSize.heightScale(context, 32),),
                  Row(
                    children: [
                      Text(
                        'Popular',
                        style: TextStyle(
                          fontSize: AppSize.textScale(context, 18),
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        'See all',
                        style: TextStyle(
                            fontSize: AppSize.textScale(context, 12),
                            fontWeight: FontWeight.w700,
                            color: AppColors.blue),
                      ),
                    ],
                  ),
                  SizedBox(height: AppSize.textScale(context, 12),),
                  SizedBox(
                    height: AppSize.textScale(context, 240),
                    child: const PopularPlacesWidget(),
                  ),
                  SizedBox(height: AppSize.heightScale(context, 32),),
                  Text(
                    'Recommended',
                    style: TextStyle(
                      fontSize: AppSize.textScale(context, 18),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: AppSize.heightScale(context, 12),),
                  SizedBox(
                    height: AppSize.heightScale(context, 160),
                    child: const RecommendedWidget(),
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

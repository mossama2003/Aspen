import 'package:aspen/core/constants/app_size.dart';
import 'package:aspen/core/style/app_colors.dart';
import 'package:aspen/model/place_details/facility_model.dart';
import 'package:flutter/material.dart';

class FacilitiesCard extends StatelessWidget {
  const FacilitiesCard({super.key, required this.data});

  final FacilityModel data;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppSize.widthScale(context, 77),
      height: AppSize.heightScale(context, 74),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(16)),
        color: AppColors.lightGray,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network(
            data.image,
            // color: AppColors.darkGray.withOpacity(0.8),
            // size: 30,
          ),
          SizedBox(height: AppSize.heightScale(context, 5),),
          Text(
            data.name,
            style: TextStyle(
                fontSize: AppSize.textScale(context, 10), color: AppColors.darkGray.withOpacity(0.8)),
          ),
        ],
      ),
    );
  }
}

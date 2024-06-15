import 'package:aspen/controller/home/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../controller/home/home_state.dart';
import '../../core/constants/app_size.dart';
import '../../model/place_details/facility_model.dart';
import '../cards/facilities_card.dart';

class FacilitiesWidget extends StatelessWidget {
  const FacilitiesWidget({super.key, required this.facilities});

  final List<FacilityModel> facilities;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state){
          return ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return FacilitiesCard(data: facilities[index],);
            },
            separatorBuilder: (context, index) {
              return SizedBox(width: AppSize.widthScale(context, 14),);
            },
            itemCount: facilities.length,
          );
        }
    );
  }
}

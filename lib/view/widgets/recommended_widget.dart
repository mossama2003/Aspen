import 'package:aspen/controller/home/home_cubit.dart';
import 'package:aspen/controller/home/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/constants/app_size.dart';
import '../cards/recommended_card.dart';

class RecommendedWidget extends StatelessWidget {
  const RecommendedWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(builder: (context, state) {
      return ListView.separated(
        padding: const EdgeInsets.symmetric(
          horizontal: 3,
          vertical: 3,
        ),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return RecommendedCard(
            placeData: HomeCubit.get(context).recommendedPlaces[index],
          );
        },
        separatorBuilder: (context, index) {
          return SizedBox(width: AppSize.widthScale(context, 10),
          );
        },
        itemCount: HomeCubit.get(context).recommendedPlaces.length,
      );
    });
  }
}

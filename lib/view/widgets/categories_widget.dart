import 'package:aspen/controller/home/home_cubit.dart';
import 'package:aspen/controller/home/home_state.dart';
import 'package:aspen/core/style/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/constants/app_size.dart';
import '../cards/categories_card.dart';

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(builder: (context, state) {
      if (state is LoadingGetDataState) {
      return const Center(
          child: CircularProgressIndicator(
        color: AppColors.blue,
      ));
      }
      return ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return CategoryCard(
            categoryData: HomeCubit
                .get(context)
                .categories[index],
          );
        },
        separatorBuilder: (context, index) {
          return SizedBox(
            width: AppSize.widthScale(context, 10),
          );
        },
        itemCount: HomeCubit
            .get(context)
            .categories
            .length,
      );
    });
  }
}

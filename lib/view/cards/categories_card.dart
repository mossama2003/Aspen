import 'package:aspen/controller/home/home_cubit.dart';
import 'package:aspen/controller/home/home_state.dart';
import 'package:aspen/core/style/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/constants/app_size.dart';
import '../../model/home/category_model.dart';

class CategoryCard extends StatefulWidget {
  const CategoryCard({
    super.key,
    required this.categoryData,
  });

  final CategoryModel categoryData;

  @override
  State<CategoryCard> createState() => _CategoryCardState();
}

class _CategoryCardState extends State<CategoryCard> {

  late final HomeCubit cubit = HomeCubit.get(context);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => cubit.changeCategoryId(widget.categoryData.id),
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          return Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 12,
            ),
            decoration: BoxDecoration(
                color: cubit.selectedCategoryId == widget.categoryData.id ? AppColors.lightGray : Colors.transparent,
                borderRadius: const BorderRadius.all(Radius.circular(33))),
            child: Center(
              child: Text(
                widget.categoryData.name,
                style: TextStyle(
                  fontSize: AppSize.textScale(context, 14),
                  color: cubit.selectedCategoryId == widget.categoryData.id ? AppColors.blue : AppColors.gray,
                  fontWeight: cubit.selectedCategoryId == widget.categoryData.id ? FontWeight.bold : FontWeight.normal,
                ),
              ),
            ),
          );
        }
      ),
    );
  }
}

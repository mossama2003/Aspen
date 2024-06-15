import 'package:aspen/controller/home/home_cubit.dart';
import 'package:aspen/controller/home/home_state.dart';
import 'package:aspen/core/style/app_colors.dart';
import 'package:aspen/view/cards/popular_places_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/constants/app_size.dart';

class FavScreen extends StatefulWidget {
  const FavScreen({super.key});

  @override
  State<FavScreen> createState() => _FavScreenState();
}

class _FavScreenState extends State<FavScreen> {
  late final HomeCubit cubit = HomeCubit.get(context);

  @override
  void initState() {
    super.initState();
    cubit.handleFavPlaces();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 30),
      child: Center(
        child: Column(
          children: [
            Text(
              'Favourite Places',
              style: TextStyle(
                fontSize: AppSize.textScale(context, 20),
                fontWeight: FontWeight.bold,
                color: AppColors.blue,
              ),
            ),
            SizedBox(height: AppSize.heightScale(context, 30),),
            Expanded(
              child: BlocBuilder<HomeCubit, HomeState>(
                builder: (context, state) {
                  return GridView.builder(
                    gridDelegate:
                        SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: AppSize.heightScale(context, 10),
                      crossAxisSpacing: AppSize.widthScale(context, 10),
                    ),
                    itemCount: cubit.favPlaces.length,
                    itemBuilder: (context, index) {
                      return PopularPlacesCard(
                        placeData: cubit.favPlaces[index],
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

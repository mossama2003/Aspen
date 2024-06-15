import 'package:flutter/material.dart';
import '../../core/style/app_colors.dart';

class FavButtonWidget extends StatelessWidget {
  const FavButtonWidget({
    super.key,
    this.width = 30,
    this.height = 30,
    this.iconSize = 15,
    required this.isFav, required this.onTap,
  });

  final double width;
  final double height;
  final double iconSize;
  final bool isFav;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onTap,
      icon: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: AppColors.white,
          boxShadow: [
            BoxShadow(
              color: const Color(0xff0038ff).withOpacity(0.2),
              offset: const Offset(0, 6),
              blurRadius: 19,
              spreadRadius: 0,

            )
          ]
        ),
        child: Icon(
          Icons.favorite,
          color: isFav? AppColors.red : AppColors.darkGray,
          size: iconSize,
        ),
      ),
    );
  }
}

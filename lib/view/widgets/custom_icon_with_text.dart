import 'package:flutter/material.dart';

import '../../core/constants/app_size.dart';

class CustomIconWithText extends StatelessWidget {
  const CustomIconWithText({
    super.key,
    required this.icon,
    required this.text,
    this.textStyle,
  });

  final Widget icon;
  final String text;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        icon,
        SizedBox(width: AppSize.widthScale(context, 5),),
        Text(
          text,
          style: textStyle,
        ),
      ],
    );
  }
}

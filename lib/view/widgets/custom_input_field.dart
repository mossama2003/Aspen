import 'package:aspen/core/style/app_colors.dart';
import 'package:flutter/material.dart';

class CustomInputField extends StatelessWidget {
  const CustomInputField({super.key, required this.hint, this.prefix});

  final String hint;
  final Widget? prefix;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(
          color: AppColors.gray.withOpacity(0.8),
          fontWeight: FontWeight.w400,
        ),
        prefixIcon: prefix,
        prefixIconColor: AppColors.gray,
        filled: true,
        fillColor: AppColors.lightGray,
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.all(Radius.circular(24)),
        ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.all(Radius.circular(24)),
          ),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.all(Radius.circular(24)),
        ),
      ),
    );
  }
}

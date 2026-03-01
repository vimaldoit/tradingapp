import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tradingapp/core/theme/app_colors.dart';
import 'package:tradingapp/core/theme/app_theme.dart';

class AppSearchBar extends StatelessWidget {
  final String hintText;
  final ValueChanged<String>? onChanged;
  final TextEditingController? controller;

  const AppSearchBar({
    super.key,
    required this.hintText,
    this.onChanged,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: onChanged,
      style: TextStyle(fontSize: 13.sp),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: AppTheme.bodyText3.copyWith(
          color: AppColors.hintColor,
        ),
        prefixIcon: Icon(
          Icons.search,
          size: 20.sp,
          color: AppColors.iconGrey,
        ),
        contentPadding: EdgeInsets.symmetric(
          vertical: 0,
          horizontal: 12.w,
        ),
        prefixIconConstraints: BoxConstraints(
          minWidth: 40.w,
          minHeight: 40.h,
        ),
        isDense: true,
      ),
    );
  }
}

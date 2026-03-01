import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tradingapp/core/constants/images.dart';
import 'package:tradingapp/core/theme/app_colors.dart';
import 'package:tradingapp/core/theme/app_theme.dart';

class ChartButton extends StatelessWidget {
  final VoidCallback onTap;
  const ChartButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
        decoration: BoxDecoration(
          color: AppColors.card,
          borderRadius: BorderRadius.circular(4.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 4.r, // softer shadow
              spreadRadius: 0,

              offset: Offset(0, 6.h),
            ),
          ],
        ),
        child: Row(
          children: [
            SvgPicture.asset(AppImages.chartIcon, width: 12.w),
            SizedBox(width: 4.w),
            Text(
              "Chart",
              style: AppTheme.bodyText3.copyWith(
                color: AppColors.chartbuttomText,
                fontSize: 12.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

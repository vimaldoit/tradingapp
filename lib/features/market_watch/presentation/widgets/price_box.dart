import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tradingapp/core/theme/app_colors.dart';
import 'package:tradingapp/core/theme/app_theme.dart';

class PriceBox extends StatelessWidget {
  final String title;
  final String price;
  final Color color;
  const PriceBox({
    super.key,
    required this.title,
    required this.price,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 72.w,
      padding: EdgeInsets.symmetric(vertical: 8.h),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(8.r),

        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            blurRadius: 6.r,
            offset: Offset(0, 6.h),
          ),
        ],
      ),
      child: Column(
        children: [
          Text(
            title,
            style: AppTheme.bodyText3.copyWith(
              color: AppColors.primary,
              fontSize: 11.sp,
            ),
          ),
          SizedBox(height: 4.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.w),
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                price,
                style:
                    AppTheme.bodyText3.copyWith(color: color, fontSize: 11.sp),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

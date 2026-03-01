import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tradingapp/core/theme/app_colors.dart';
import 'package:tradingapp/core/theme/app_theme.dart';
import 'package:tradingapp/features/market_watch/domain/entities/stock.dart';
import 'package:tradingapp/features/market_watch/presentation/widgets/chart_button.dart';
import 'package:tradingapp/features/market_watch/presentation/widgets/price_box.dart';

class FutureTile extends StatelessWidget {
  final Stock stock;
  const FutureTile({super.key, required this.stock});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      child: Column(
        children: [
          Card(
            color: AppColors.scaffold,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10.h),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 12.r,
                              backgroundImage: AssetImage(stock.imageUrl),
                            ),
                            SizedBox(width: 4.w),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    stock.name,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    style: AppTheme.bodyText2.copyWith(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Text(
                                    stock.expiryDate,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    style: AppTheme.bodyText3.copyWith(
                                      color: AppColors.textSecondary,
                                      fontSize: 11.sp,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 6.h),
                        Row(
                          children: [
                            Icon(
                              stock.isPositive
                                  ? Icons.trending_up
                                  : Icons.trending_down,
                              size: 16.sp,
                              color: stock.isPositive
                                  ? AppColors.positive
                                  : AppColors.negative,
                            ),
                            SizedBox(width: 5.w),
                            Flexible(
                              child: Text(
                                "${stock.percentageChange > 0 ? "+" : ""}${stock.percentageChange.toStringAsFixed(2)}%",
                                overflow: TextOverflow.ellipsis,
                                style: AppTheme.bodyText3.copyWith(
                                  color: stock.isPositive
                                      ? AppColors.positive
                                      : AppColors.negative,
                                  fontSize: 12.sp,
                                ),
                              ),
                            ),
                            SizedBox(width: 8.w),
                            ChartButton(onTap: () {}),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 8.w),
                  PriceBox(
                    title: "Sell",
                    price: stock.lastSellPrice.toStringAsFixed(2),
                    color: AppColors.sell,
                  ),
                  SizedBox(width: 8.w),
                  PriceBox(
                    title: "Buy",
                    price: stock.lastBuyPrice.toStringAsFixed(2),
                    color: AppColors.buy,
                  ),
                ],
              ),
            ),
          ),
          Divider(height: 2.h),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tradingapp/core/constants/images.dart';
import 'package:tradingapp/core/theme/app_colors.dart';
import 'package:tradingapp/core/theme/app_theme.dart';
import 'package:tradingapp/core/widgets/under_construction_widget.dart';
import 'package:tradingapp/features/market_watch/presentation/pages/indian_market_page.dart';
import 'package:tradingapp/features/market_watch/presentation/widgets/future_tile.dart';

class MarketWatchScreen extends StatelessWidget {
  const MarketWatchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 4,
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverOverlapAbsorber(
                handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                  context,
                ),
                sliver: SliverAppBar(
                  pinned: true,
                  expandedHeight: 80.h,
                  scrolledUnderElevation: 0,
                  forceMaterialTransparency: false,
                  elevation: 0,
                  flexibleSpace: Container(
                    decoration: BoxDecoration(
                      gradient: AppColors.headerGradient,
                    ),
                    child: SafeArea(
                      child: Padding(
                        padding: EdgeInsetsGeometry.symmetric(horizontal: 16.w),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.menu,
                                  size: 22.sp,
                                  color: AppColors.textPrimary,
                                ),
                                SizedBox(width: 12.w),
                                Text(
                                  "Market Watch",
                                  style: AppTheme.bodyText2.copyWith(
                                    fontSize: 18.sp,
                                  ),
                                ),
                                const Spacer(),
                                _walletWidget(),
                                SizedBox(width: 12.w),

                                Badge(
                                  child: Icon(
                                    Icons.notifications,
                                    size: 28.h,
                                    color: Colors.black,
                                  ),
                                  label: Text("10", style: AppTheme.bodyText3),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  bottom: PreferredSize(
                    preferredSize: const Size.fromHeight(70),
                    child: TabBar(
                      labelColor: AppColors.textPrimary,
                      unselectedLabelColor: AppColors.textSecondary,
                      indicatorColor: AppColors.textPrimary,
                      dividerColor: Colors.transparent,
                      isScrollable: true,
                      tabAlignment: TabAlignment.center,
                      tabs: [
                        _MarketIcon(
                          title: "Indian Market",
                          icon: SizedBox(
                            width: 40.w,
                            child: Image.asset(
                              AppImages.indianMarketTab,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        _MarketIcon(
                          title: "International",
                          icon: SizedBox(
                            width: 40.w,
                            child: Image.asset(
                              AppImages.internationalTab,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        _MarketIcon(
                          title: "Forex Futures",
                          icon: SizedBox(
                            width: 40.w,
                            child: Image.asset(
                              AppImages.forexFutureTab,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        _MarketIcon(
                          title: "Crypto Futures",
                          icon: SizedBox(
                            width: 40.w,
                            child: Image.asset(
                              AppImages.cryptoFutureTab,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ];
          },
          body: TabBarView(
            children: [
              Builder(builder: (context) => const IndianMarketPage()),
              UnderConstructionWidget(),
              UnderConstructionWidget(),
              UnderConstructionWidget(),
            ],
          ),
        ),
      ),
    );
  }

  static Widget _walletWidget() {
    return Container(
      padding: const EdgeInsets.all(1.5), // This defines the border thickness
      decoration: BoxDecoration(
        gradient: AppColors.bottomNavGradient, // Your specific LinearGradient
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(5.r),
      ),
      child: Container(
        constraints: BoxConstraints(maxWidth: 100.w),
        padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 4.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.r),
          color: AppColors.textOnPrimary,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(AppImages.walletMoneyIcon),
            SizedBox(width: 6.w),
            Flexible(
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  "1222200",
                  style: AppTheme.bodyText3.copyWith(
                    color: AppColors.primary,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _MarketIcon extends StatelessWidget {
  final String title;
  final Widget icon;

  const _MarketIcon({required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        icon,
        const SizedBox(height: 6),
        Text(
          title,
          style: AppTheme.bodyText2.copyWith(
            fontSize: 10.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 6),
      ],
    );
  }
}

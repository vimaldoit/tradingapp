import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tradingapp/core/theme/app_colors.dart';
import 'package:tradingapp/core/theme/app_theme.dart';

class MarketWatchLayout extends StatelessWidget {
  final List<String> tabs;
  final Widget? searchBar;
  final List<Widget> children;

  const MarketWatchLayout({
    super.key,
    required this.tabs,
    this.searchBar,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: CustomScrollView(
        slivers: [
          SliverOverlapInjector(
            handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
          ),
          SliverToBoxAdapter(child: SizedBox(height: 5.h)),
          SliverPersistentHeader(
            pinned: true,
            delegate: _InnerTabBarDelegate(
              height: 45.h,
              child: Builder(
                builder: (context) {
                  final controller = DefaultTabController.of(context);
                  return AnimatedBuilder(
                    animation: controller,
                    builder: (context, _) {
                      return Container(
                        color: AppColors.scaffold,
                        alignment: Alignment.centerLeft,
                        child: TabBar(
                          isScrollable: true,
                          dividerColor: Colors.transparent,
                          indicatorColor: Colors.transparent,
                          labelColor: AppColors.primary,
                          unselectedLabelColor: AppColors.textSecondary,
                          tabAlignment: TabAlignment.center,
                          padding: EdgeInsets.symmetric(
                            vertical: 5.h,
                            horizontal: 12.w,
                          ),
                          labelPadding: EdgeInsets.zero,
                          tabs: List.generate(
                            tabs.length,
                            (index) =>
                                _tab(tabs[index], controller.index == index),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ),
          if (searchBar != null)
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 2.h),
                child: searchBar,
              ),
            ),
          SliverFillRemaining(child: TabBarView(children: children)),
        ],
      ),
    );
  }

  static Widget _tab(String text, bool active) {
    return Padding(
      padding: EdgeInsets.only(right: 4.w),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 6.h),
        decoration: BoxDecoration(
          gradient: active ? AppColors.activeTabGradient : null,
          color: active ? null : Colors.transparent,
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Text(
          text,
          style: AppTheme.bodyText3.copyWith(
            fontSize: 11.sp,
            color: active ? Colors.white : AppColors.textPrimary,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}

class _InnerTabBarDelegate extends SliverPersistentHeaderDelegate {
  final Widget child;
  final double height;

  _InnerTabBarDelegate({required this.child, required this.height});

  @override
  double get minExtent => height;

  @override
  double get maxExtent => height;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return child;
  }

  @override
  bool shouldRebuild(covariant _InnerTabBarDelegate oldDelegate) {
    return oldDelegate.height != height || oldDelegate.child != child;
  }
}

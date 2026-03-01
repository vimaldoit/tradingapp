import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tradingapp/core/constants/images.dart';
import '../theme/app_colors.dart';
import '../../features/navigation/presentation/bloc/bottomnavigation_bloc.dart';

class AppBottomNavigation extends StatelessWidget {
  const AppBottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomnavigationBloc, BottomnavigationState>(
      builder: (context, state) {
        return Container(
          height: 90.h,
          color: Colors.transparent,
          child: TweenAnimationBuilder<double>(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            tween: Tween<double>(
              begin: 0,
              end: state.index.toDouble(),
            ),
            builder: (context, animatedIndex, child) {
              final double itemWidth = (1.sw - 20.w) / 5;
              final double notchX = 10.w + (animatedIndex + 0.5) * itemWidth;

              return Stack(
                clipBehavior: Clip.none,
                children: [
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: CustomPaint(
                      size: Size(1.sw, 70.h),
                      painter: BottomNavPainter(notchX: notchX),
                    ),
                  ),

                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: SizedBox(
                      height: 70.h,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                              child: _buildNavItem(
                                context,
                                0,
                                AppImages.favIcon,
                                'My Favorites',
                                state.index,
                              ),
                            ),
                            Expanded(
                              child: _buildNavItem(
                                context,
                                1,
                                AppImages.orderIcon,
                                'Order',
                                state.index,
                              ),
                            ),
                            Expanded(
                              child: _buildNavItem(
                                context,
                                2,
                                AppImages.chartIcon,
                                'Watchlist',
                                state.index,
                              ),
                            ),
                            Expanded(
                              child: _buildNavItem(
                                context,
                                3,
                                AppImages.positionIcon,
                                'Positions',
                                state.index,
                              ),
                            ),
                            Expanded(
                              child: _buildNavItem(
                                context,
                                4,
                                AppImages.walletIcon,
                                'Wallet',
                                state.index,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  AnimatedPositioned(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                    bottom: 35.h,
                    left: notchX - 24.w,
                    child: GestureDetector(
                      onTap: () {}, // Handled by Row items
                      child: Container(
                        width: 48.w,
                        height: 48.w,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: AppColors.watchlistGradient,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.3),
                              blurRadius: 10,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }

  Widget _buildNavItem(
    BuildContext context,
    int index,
    String icon,
    String label,
    int currentIndex,
  ) {
    final isSelected = currentIndex == index;
    return GestureDetector(
      onTap: () => context.read<BottomnavigationBloc>().add(TabChanged(index)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Opacity(
            opacity: isSelected ? 0.0 : 1.0,
            child: SizedBox(
              width: 22.w,
              height: 22.w,
              child: SvgPicture.asset(
                icon,
                color: isSelected ? Colors.white : Colors.white.withOpacity(0.6),
                width: 22,
                height: 22.w,
              ),
            ),
          ),
          SizedBox(height: 4.h),
          Text(
            label,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.white.withOpacity(0.6),
              fontSize: 10.sp,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class BottomNavPainter extends CustomPainter {
  final double notchX;

  BottomNavPainter({required this.notchX});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..shader = AppColors.bottomNavGradient.createShader(
        Rect.fromLTWH(0, 0, size.width, size.height),
      )
      ..style = PaintingStyle.fill;

    Path path = Path();
    double dipWidth = 90.w;
    double dipHeight = 30.h;

    path.lineTo(notchX - dipWidth / 1.5, 0);

    // Smoother Bezier curve for the notch
    path.cubicTo(
      notchX - dipWidth / 3,
      0,
      notchX - dipWidth / 3,
      dipHeight,
      notchX,
      dipHeight,
    );
    path.cubicTo(
      notchX + dipWidth / 3,
      dipHeight,
      notchX + dipWidth / 3,
      0,
      notchX + dipWidth / 1.5,
      0,
    );

    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    canvas.drawShadow(path, Colors.black.withOpacity(0.5), 10, true);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(BottomNavPainter oldDelegate) =>
      oldDelegate.notchX != notchX;
}

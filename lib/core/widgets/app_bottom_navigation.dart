import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
          height: 120,
          color: Colors.transparent,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: CustomPaint(
                  size: Size(MediaQuery.of(context).size.width, 70),
                  painter: BottomNavPainter(),
                ),
              ),

              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: SizedBox(
                  height: 70,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildNavItem(
                        context,
                        0,
                        AppImages.favIcon,
                        'My Favorites',
                        state.index,
                      ),
                      _buildNavItem(
                        context,
                        1,
                        AppImages.orderIcon,
                        'Order',
                        state.index,
                      ),
                      const SizedBox(width: 80), // Space for center button
                      _buildNavItem(
                        context,
                        3,
                        AppImages.positionIcon,
                        'Positions',
                        state.index,
                      ),
                      _buildNavItem(
                        context,
                        4,
                        AppImages.walletIcon,
                        'Wallet',
                        state.index,
                      ),
                    ],
                  ),
                ),
              ),

              Positioned(
                bottom: 15,
                left: MediaQuery.of(context).size.width / 2 - 24,
                child: GestureDetector(
                  onTap: () =>
                      context.read<BottomnavigationBloc>().add(TabChanged(2)),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: 48,
                        height: 48,
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
                      const SizedBox(height: 8),
                      Text(
                        'Watchlist',
                        style: TextStyle(
                          color: state.index == 2
                              ? Colors.white
                              : Colors.white.withOpacity(0.8),
                          fontSize: 11,
                          fontWeight: state.index == 2
                              ? FontWeight.bold
                              : FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
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
      child: SizedBox(
        width: 75,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 22,
              height: 22,

              child: SvgPicture.asset(
                icon,
                color: isSelected
                    ? Colors.white
                    : Colors.white.withOpacity(0.6),
                width: 22,
                height: 22,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                color: isSelected
                    ? Colors.white
                    : Colors.white.withOpacity(0.6),
                fontSize: 10,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BottomNavPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..shader = AppColors.bottomNavGradient.createShader(
        Rect.fromLTWH(0, 0, size.width, size.height),
      )
      ..style = PaintingStyle.fill;

    Path path = Path();
    path.moveTo(0, 0); // Start at top left

    double centerX = size.width / 2;
    double dipWidth = 90;
    double dipHeight = 30;

    path.lineTo(centerX - dipWidth / 1.5, 0);

    // Smoother Bezier curve for the notch
    path.cubicTo(
      centerX - dipWidth / 3,
      0,
      centerX - dipWidth / 3,
      dipHeight,
      centerX,
      dipHeight,
    );
    path.cubicTo(
      centerX + dipWidth / 3,
      dipHeight,
      centerX + dipWidth / 3,
      0,
      centerX + dipWidth / 1.5,
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
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

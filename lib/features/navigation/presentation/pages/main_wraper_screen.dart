import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tradingapp/core/widgets/app_bottom_navigation.dart';
import 'package:tradingapp/features/indian_market/presentation/pages/indian_market_screen.dart';
import 'package:tradingapp/features/navigation/presentation/bloc/bottomnavigation_bloc.dart';

class MainWraperScreen extends StatelessWidget {
  const MainWraperScreen({super.key});

  static final _pages = [
    Placeholder(),
    Placeholder(),
    IndianMarketScreen(),
    Placeholder(),
    Placeholder(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomnavigationBloc, BottomnavigationState>(
      builder: (context, state) {
        return Scaffold(
          body: _pages[state.index],
          bottomNavigationBar: AppBottomNavigation(),
        );
      },
    );
  }
}

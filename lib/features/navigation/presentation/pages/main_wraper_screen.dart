import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tradingapp/core/widgets/app_bottom_navigation.dart';
import 'package:tradingapp/core/widgets/under_construction_widget.dart';
import 'package:tradingapp/features/market_watch/presentation/pages/market_watch_screen.dart';
import 'package:tradingapp/features/navigation/presentation/bloc/bottomnavigation_bloc.dart';

class MainWraperScreen extends StatelessWidget {
  const MainWraperScreen({super.key});

  static final _pages = [
    UnderConstructionWidget(title: "Favorite Screen"),
    UnderConstructionWidget(title: "Order Screen"),
    MarketWatchScreen(),
    UnderConstructionWidget(title: "Positions Screen"),
    UnderConstructionWidget(title: "Wallet Screen"),
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

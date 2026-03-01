import 'package:flutter/material.dart';
import 'package:tradingapp/core/widgets/under_construction_widget.dart';
import 'package:tradingapp/features/market_watch/presentation/pages/nse_future_page.dart';
import 'package:tradingapp/features/market_watch/presentation/widgets/market_watch_layout.dart';

class IndianMarketPage extends StatelessWidget {
  const IndianMarketPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MarketWatchLayout(
      tabs: const ["NSE FUTURES", "NSE OPTION", "MCX FUTURES", "MCX OPTIONS"],
      children: [
        NseFuturePage(),
        const UnderConstructionWidget(),
        const UnderConstructionWidget(),
        const UnderConstructionWidget(),
      ],
    );
  }
}

import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:tradingapp/features/market_watch/presentation/pages/indian_market_screen.dart';
import 'package:tradingapp/features/navigation/presentation/bloc/bottomnavigation_bloc.dart';
import 'package:tradingapp/features/navigation/presentation/pages/main_wraper_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  static const String mainwraper = "/";
  static const String home = "/home";

  static final GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: mainwraper,
        builder: (context, state) => BlocProvider.value(
          value: GetIt.I<BottomnavigationBloc>(),
          child: MainWraperScreen(),
        ),
      ),
      GoRoute(path: home, builder: (context, state) => IndianMarketScreen()),
    ],
  );
}

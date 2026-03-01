import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tradingapp/core/dependency_injection/di.dart';
import 'package:tradingapp/core/widgets/app_search_bar.dart';
import 'package:tradingapp/features/market_watch/presentation/bloc/nse_future/nse_future_bloc.dart';
import 'package:tradingapp/features/market_watch/presentation/widgets/future_tile.dart';

class NseFuturePage extends StatelessWidget {
  const NseFuturePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          AppContainer.sl<NseFutureBloc>()..add(LoadNseFuture()),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 2.h),
            child: Builder(
              builder: (context) {
                return AppSearchBar(
                  hintText: "Search Nse Futures",
                  onChanged: (value) {
                    context.read<NseFutureBloc>().add(SearchNseFuture(value));
                  },
                );
              },
            ),
          ),
          Expanded(
            child: BlocBuilder<NseFutureBloc, NseFutureState>(
              builder: (context, state) {
                if (state is NseFutureLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is NseFutureLoaded) {
                  return ListView.builder(
                    padding: EdgeInsets.zero,
                    itemCount: state.stocks.length,
                    physics: const AlwaysScrollableScrollPhysics(),
                    itemBuilder: (context, index) =>
                        FutureTile(stock: state.stocks[index]),
                  );
                } else if (state is NseFutureError) {
                  return Center(child: Text(state.message));
                }
                return const SizedBox.shrink();
              },
            ),
          ),
        ],
      ),
    );
  }
}

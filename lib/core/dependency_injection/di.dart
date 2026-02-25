import 'package:get_it/get_it.dart';
import 'package:tradingapp/features/navigation/presentation/bloc/bottomnavigation_bloc.dart';

class AppContainer {
  static GetIt sl = GetIt.instance;

  static Future<void> init() async {
    sl.registerFactory(() => BottomnavigationBloc());
  }
}

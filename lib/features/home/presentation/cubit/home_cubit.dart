

import 'package:clean_architecture/core/constants/enum/bottom_bar_tab.dart';
import 'package:clean_architecture/features/home/presentation/cubit/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(const HomeState());

  void onTabChanged(BottomBarEnum tab){
    emit(state.copyWith(currentTab: tab));
  }
}

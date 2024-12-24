import 'package:clean_architecture/core/constants/enum/bottom_bar_tab.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';

part 'home_state.g.dart';

@CopyWith(copyWithNull: true)
class HomeState extends Equatable {
  final BottomBarEnum currentTab;

  const HomeState({
    this.currentTab = BottomBarEnum.post,
  });

  @override
  List<Object> get props => [currentTab];
}

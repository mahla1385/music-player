part of 'bottom_navigator_cubit.dart';

@immutable
sealed class BottomNavigatorState {}

final class BottomNavigatorInitial extends BottomNavigatorState {
  final int page;
  BottomNavigatorInitial({required this.page});
}

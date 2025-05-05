import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'bottom_navigator_state.dart';

class BottomNavigatorCubit extends Cubit<BottomNavigatorState> {
  BottomNavigatorCubit() : super(BottomNavigatorInitial(page: 2));

  int _page = 2;

  void updatePage(int page){
    _page = page;
    emit(BottomNavigatorInitial(page: page));
  }


  void reload(){
    emit(BottomNavigatorInitial(page: _page));
  }

}

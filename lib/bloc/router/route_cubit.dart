import 'package:bloc/bloc.dart';
import 'package:music/utils/fade_route.dart';


class RouteCubit extends Cubit<MyNavigatorObserver> {
  RouteCubit() : super(MyNavigatorObserver()){
    emit(_router);
  }
  final MyNavigatorObserver _router = MyNavigatorObserver();


  void getRoute(){
    emit(_router);
  }


}

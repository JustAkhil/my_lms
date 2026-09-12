import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_lms/bloc/navigation/navigation_event.dart';
import 'package:my_lms/bloc/navigation/navigation_state.dart';

class NavigationBloc extends Bloc<NavigationEvent,NavigationState>{
  NavigationBloc():super(NavigationState(currIndex: 0)){
    on<NavigateToTabEvent>((event,emit){
      emit(NavigationState(currIndex: event.tabIndex));
    });
  }
}
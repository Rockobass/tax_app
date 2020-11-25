import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<HomeState> buildReducer() {
  return asReducer(
    <Object, Reducer<HomeState>>{
      HomeAction.onTabChange: tabChange,
      HomeAction.initController: initController
    },
  );
}

HomeState tabChange(HomeState state, Action action) {
  HomeState newState = state.clone();
  newState.currentIndex = action.payload;
  return newState;
}

HomeState initController(HomeState state, Action action) {
  HomeState newState = state.clone();
  newState.animationController = action.payload;
  return newState;
}


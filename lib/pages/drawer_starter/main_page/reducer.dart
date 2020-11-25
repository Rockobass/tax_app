import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';

Reducer<DrawerUserControllerState> buildReducer() {
  return asReducer(
    <Object, Reducer<DrawerUserControllerState>>{
      DrawerUserControllerAction.action: _onAction,
      DrawerUserControllerAction.updateOffset: updateOffset,
      DrawerUserControllerAction.initaController: initaController,
      DrawerUserControllerAction.initmController: initmController,
      DrawerUserControllerAction.indexChange: onIndexChange
    },
  );
}

DrawerUserControllerState _onAction(DrawerUserControllerState state, Action action) {
  final DrawerUserControllerState newState = state.clone();
  return newState;
}

DrawerUserControllerState updateOffset(DrawerUserControllerState state, Action action) {
  DrawerUserControllerState newState = state.clone();
  newState.scrolloffset = action.payload;
  return newState;
}

DrawerUserControllerState initaController(DrawerUserControllerState state, Action action) {
  DrawerUserControllerState newState = state.clone();
  newState.animationController = action.payload;
  return newState;
}

DrawerUserControllerState initmController(DrawerUserControllerState state, Action action) {
  DrawerUserControllerState newState = state.clone();
  newState.iconAnimationController = action.payload;
  return newState;
}

DrawerUserControllerState onIndexChange(DrawerUserControllerState state, Action action) {
  DrawerUserControllerState newState = state.clone();
  newState.currentIndex = action.payload;
  return newState;
}

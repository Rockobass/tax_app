import 'package:fish_redux/fish_redux.dart';
import 'package:toast/toast.dart';

import 'action.dart';
import 'state.dart';

Reducer<FileSelectorState> buildReducer() {
  return asReducer(
    <Object, Reducer<FileSelectorState>>{
      FileSelectorAction.action: _onAction,
      FileSelectorAction.update: update,
    },
  );
}

FileSelectorState _onAction(FileSelectorState state, Action action) {
  final FileSelectorState newState = state.clone();
  return newState;
}

FileSelectorState update(FileSelectorState state, Action action) {
  FileSelectorState newState = state.clone();
  newState.info.path = action.payload.path;
  newState.info.name = action.payload.name;
  newState.info.size = action.payload.size;
  print('reducer');
  return newState;
}


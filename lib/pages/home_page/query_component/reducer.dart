import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';

Reducer<QueryPageState> buildReducer() {
  return asReducer(
    <Object, Reducer<QueryPageState>>{
      QueryPageAction.update: onUpdate,
      QueryPageAction.searchText: searchText,
    },
  );
}

QueryPageState onUpdate(QueryPageState state, Action action) {
  QueryPageState newState = state.clone();
  newState.taxCode = action.payload;
  return newState;
}

QueryPageState searchText(QueryPageState state, Action action) {
  QueryPageState newState = state.clone();
  newState.searchText = action.payload;
  return newState;
}

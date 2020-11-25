import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_app/model/tax_code.dart';
import 'package:flutter_app/utils/service.dart';
import 'action.dart';
import 'state.dart';

Effect<QueryPageState> buildEffect() {
  return combineEffects(<Object, Effect<QueryPageState>>{
    QueryPageAction.query: onQuery,
  });
}

void onQuery(Action action, Context<QueryPageState> ctx) async{
  ctx.dispatch(QueryPageActionCreator.searchText(action.payload));
  TaxCode t = await Service.getTaxCode(action.payload);
  ctx.dispatch(QueryPageActionCreator.onUpdate(t));
}

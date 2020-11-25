import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_app/model/tax_code.dart';

//TODO replace with your own action
enum QueryPageAction { query, update, searchText }

class QueryPageActionCreator {
  static Action onQuery(String name) {
    return  Action(QueryPageAction.query, payload: name);
  }

  static Action onUpdate(TaxCode t) {
    return Action(QueryPageAction.update, payload: t);
  }

  static Action searchText(String text) {
    return Action(QueryPageAction.searchText, payload: text);
  }
}

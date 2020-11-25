import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app/model/tax_code.dart';
import 'package:flutter_app/pages/home_page/query_component/query_row_component/state.dart';

class QueryPageState extends MutableSource implements Cloneable<QueryPageState> {
  String searchText;
  TaxCode taxCode;
  TextEditingController query;


  @override
  QueryPageState clone() {
    return QueryPageState()
    ..taxCode = taxCode
    ..searchText = searchText
    ..query = query;
  }

  @override
  Object getItemData(int index) {
    QueryRowState state = QueryRowState();
    state.query = query;
    state.searchText = searchText;
    List<dynamic> datas = [
      state,
      taxCode
    ];
    return datas[index];
  }

  @override
  String getItemType(int index) {
    List<String> types = [
      "query_row",
      "res_block"
    ];
    return types[index];
  }

  @override
  // TODO: implement itemCount
  int get itemCount => 2;

  @override
  void setItemData(int index, Object data) {
    switch (index) {
      case 0: query = (data as QueryRowState).query; searchText = (data as QueryRowState).searchText; break;
      case 1: taxCode = data;break;
      default: break;
    }
  }
}

QueryPageState initState(Map<String, dynamic> args) {
  return QueryPageState();
}

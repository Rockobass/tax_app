

import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart';

class QueryRowState implements Cloneable<QueryRowState> {
  TextEditingController query;
  String searchText;

  @override
  QueryRowState clone() {
    return QueryRowState()
      ..query = query
      ..searchText = searchText;
  }

}
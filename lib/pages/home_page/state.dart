import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/model/file_info.dart';
import 'package:flutter_app/model/tax_code.dart';
import 'package:flutter_app/pages/home_page/file_query_component/state.dart';

import 'query_component/state.dart';


class HomeState implements Cloneable<HomeState> {
  AnimationController animationController;
  int currentIndex;
  List<String> components = [
    "query_page",
    "que"
  ];

  String searchText;
  TaxCode taxCode;
  FileInfo info;
  TextEditingController query;
  @override
  HomeState clone() {
    return HomeState()
      ..animationController = animationController
      ..taxCode = taxCode
      ..currentIndex = currentIndex
      ..searchText = searchText
      ..components = components
      ..query = query
      ..info = info
    ;
  }
}

class QueryPageConn extends ConnOp<HomeState, QueryPageState> {

  @override
  QueryPageState get(HomeState state) {
    QueryPageState sub = new  QueryPageState();
    sub.taxCode = state.taxCode;
    sub.searchText = state.searchText;
    sub.query = state.query;
    return sub;
  }

  @override
  void set(HomeState state, QueryPageState subState) {
    state.taxCode = subState.taxCode;
    state.searchText = subState.searchText;
    state.query = subState.query;
  }
}

class FilePageConn extends ConnOp<HomeState, FileSelectorState> {

  @override
  FileSelectorState get(HomeState state) {
    FileSelectorState sub = FileSelectorState();
    sub.info = state.info;
    return sub;
  }

  @override
  void set(HomeState state, FileSelectorState subState) {
    state.info = subState.info;
  }
}

HomeState initState(Map<String, dynamic> args) {
  HomeState state = HomeState();
  state.currentIndex = 0;
  state.searchText = "";
  state.taxCode = TaxCode.fromJson({
    "code": "",
    "name": "",
    "goods": "",
    "rate": "",
  });
  state.query = TextEditingController();
  state.info = FileInfo("", "", "");
  return state;
}
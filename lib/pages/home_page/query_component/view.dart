import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/utils/app_theme.dart';
import 'appbar/appbar.dart';
import 'state.dart';

Widget buildView(QueryPageState state, Dispatch dispatch, ViewService viewService) {
  final ListAdapter listAdapter = viewService.buildAdapter();
  return Container(
    child: Scaffold(
      appBar: queryAppBar(),
      backgroundColor: AppTheme.white,
      body: Container(
        child: Center(
          child: Container(
            child: Column(
              children: <Widget>[
                Expanded(
                  child: ListView.builder(itemBuilder: listAdapter.itemBuilder, itemCount: listAdapter.itemCount,)
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}

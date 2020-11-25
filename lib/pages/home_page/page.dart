import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Page;
import 'package:flutter_app/pages/home_page/file_query_component/component.dart';
import 'package:flutter_app/pages/home_page/view.dart';
import 'effect.dart';
import 'query_component/component.dart';
import 'reducer.dart';
import 'state.dart';

class _HomePageState extends ComponentState<HomeState> with SingleTickerProviderStateMixin{

}

class HomePage extends Page<HomeState, Map<String, dynamic>>{
  @override
  _HomePageState createState() => _HomePageState();
  HomePage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<HomeState>(
                adapter: null,
                slots: <String, Dependent<HomeState>>{
                  "query_page": QueryPageConn() + QueryPageComponent(),
                  "que": FilePageConn() + FileSelectorComponent()
                }),
  );
}

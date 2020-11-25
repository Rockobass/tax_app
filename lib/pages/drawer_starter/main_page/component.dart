import 'package:fish_redux/fish_redux.dart' as f;
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class _DrawerUserControllerComponent extends f.ComponentState<DrawerUserControllerState> with TickerProviderStateMixin {

}



class DrawerUserControllerComponent extends f.Page<DrawerUserControllerState, Map<String, dynamic>> {

  @override
  _DrawerUserControllerComponent createState() => _DrawerUserControllerComponent();

  DrawerUserControllerComponent()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: f.Dependencies<DrawerUserControllerState>(
                adapter: null,
                slots: <String, Dependent<DrawerUserControllerState>>{
//                  "home": HomePageConnector() + HomePage()
                }),);

}

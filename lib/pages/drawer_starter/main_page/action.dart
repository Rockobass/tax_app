import 'package:flutter/material.dart' hide Action;
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_app/pages/drawer_starter/utils/drawer_model.dart';

//TODO replace with your own action
enum DrawerUserControllerAction { action, updateOffset ,initaController, initmController, indexChange}

class DrawerUserControllerActionCreator {
  static Action onAction() {
    return const Action(DrawerUserControllerAction.action);
  }

  static Action updateOffset(double offset) {
    return Action(DrawerUserControllerAction.updateOffset, payload: offset);
  }

  static Action initaController(AnimationController animationController) {
    return Action(DrawerUserControllerAction.initaController, payload: animationController);
  }

  static Action initmController(AnimationController animationController) {
    return Action(DrawerUserControllerAction.initmController, payload: animationController);
  }

  static Action indexChange(DrawerIndex index) {
    return Action(DrawerUserControllerAction.indexChange, payload: index);
  }
}

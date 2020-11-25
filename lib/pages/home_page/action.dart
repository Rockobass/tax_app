import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;

//TODO replace with your own action
enum HomeAction {
  onTabChange,
  initController
}

class HomeActionCreator {

  static Action onTabChange(int index) {
    return Action(HomeAction.onTabChange, payload: index);
  }

  static Action initController(AnimationController animationController) {
    return Action(HomeAction.initController, payload: animationController);
  }
}

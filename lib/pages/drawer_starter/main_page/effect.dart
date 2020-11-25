import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'action.dart';
import 'state.dart';

Effect<DrawerUserControllerState> buildEffect() {
  return combineEffects(<Object, Effect<DrawerUserControllerState>>{
    DrawerUserControllerAction.action: _onAction,
    Lifecycle.initState: init,
  });
}

void _onAction(Action action, Context<DrawerUserControllerState> ctx) {
}

void init(Action action, Context<DrawerUserControllerState> ctx) {
  final TickerProvider tickerProvider = ctx.stfState as TickerProvider;
  AnimationController animationController = AnimationController(duration: const Duration(milliseconds: 2000), vsync: tickerProvider);
  AnimationController iconAnimationController = AnimationController(vsync: tickerProvider, duration: const Duration(milliseconds: 0));
  iconAnimationController..animateTo(1.0, duration: const Duration(milliseconds: 0), curve: Curves.fastOutSlowIn);
  ctx.dispatch(DrawerUserControllerActionCreator.initaController(animationController));
  ctx.dispatch(DrawerUserControllerActionCreator.initmController(iconAnimationController));
}

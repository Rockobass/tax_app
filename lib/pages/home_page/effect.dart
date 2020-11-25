import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'action.dart';
import 'state.dart';

Effect<HomeState> buildEffect() {
  return combineEffects(<Object, Effect<HomeState>>{
    Lifecycle.initState: init
  });
}

void init(Action action, Context<HomeState> ctx) {
  final TickerProvider tickerProvider = ctx.stfState as TickerProvider;
  AnimationController animationController = AnimationController(
      duration: const Duration(milliseconds: 2000), vsync: tickerProvider);
  ctx.dispatch(HomeActionCreator.initController(animationController));
}

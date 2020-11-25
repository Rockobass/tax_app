import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:flutter_app/pages/home_page/page.dart';
import '../utils/drawer_model.dart';

class DrawerUserControllerState implements Cloneable<DrawerUserControllerState> {
  // 不变的state
  final Map<DrawerIndex, Widget> screens = {
    DrawerIndex.HOME: HomePage().buildPage(null),
    DrawerIndex.History: HomePage().buildPage(null),
    DrawerIndex.FeedBack: HomePage().buildPage(null),
    DrawerIndex.Settings: HomePage().buildPage(null),
    DrawerIndex.About: HomePage().buildPage(null),
  };
  final AnimatedIconData animatedIconData = AnimatedIcons.arrow_menu;
  Function(bool) drawerIsOpen;
  Widget menuView;
  final List<DrawerList> drawerList = <DrawerList>[
    DrawerList(
      index: DrawerIndex.HOME,
      labelName: '首页',
      icon: Icon(Icons.home),
    ),
    DrawerList(
      index: DrawerIndex.History,
      labelName: '历史记录',
      icon: Icon(Icons.assignment_rounded),
    ),
    DrawerList(
      index: DrawerIndex.FeedBack,
      labelName: '反馈',
      icon: Icon(Icons.help),
    ),
//    DrawerList(
//      index: DrawerIndex.Invite,
//      labelName: 'Invite Friend',
//      icon: Icon(Icons.group),
//    ),
    DrawerList(
      index: DrawerIndex.Settings,
      labelName: '设置',
      icon: Icon(Icons.settings),
    ),
    DrawerList(
      index: DrawerIndex.About,
      labelName: '关于我们',
      icon: Icon(Icons.info),
    ),
  ];
  //


  static String faceImage = 'assets/images/user1.jpg';
  String userName = 'Chris Hemsworth';
  DrawerIndex currentIndex = DrawerIndex.HOME;
  AnimationController iconAnimationController;
  AnimationController animationController;
  double scrolloffset = 0.0;
  Function(DrawerIndex) onDrawerCall; ///发出改变action

  @override
  DrawerUserControllerState clone() {
    return DrawerUserControllerState()
      ..drawerIsOpen = drawerIsOpen
      ..menuView = menuView
      ..userName = userName
      ..currentIndex = currentIndex
      ..iconAnimationController = iconAnimationController
      ..animationController = animationController
      ..scrolloffset = scrolloffset
    ;
  }
}

DrawerUserControllerState initState(Map<String, dynamic> args) {
  return DrawerUserControllerState();
}


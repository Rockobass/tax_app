import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/utils/app_theme.dart';
import 'package:flutter_app/utils/colors.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(HomeState state, Dispatch dispatch, ViewService viewService) {

  return Scaffold(
    body: viewService.buildComponent(state.components[state.currentIndex]),
    backgroundColor: AppTheme.cardWhite,//
    bottomNavigationBar: BubbleBottomBar(
      backgroundColor: AppTheme.bgcNotWhite1,
      opacity: 1, //0.73
      currentIndex: state.currentIndex,
      onTap: (index) => dispatch(HomeActionCreator.onTabChange(index)),
      borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      elevation: 8,
      items: <BubbleBottomBarItem>[
        BubbleBottomBarItem(
            backgroundColor: AppTheme.cardWhite,
            icon: Icon(
              Icons.map,
              color: Colors.black,
            ),
            activeIcon: Icon(
              Icons.map,
            color: AppTheme.geoGreen,
            ),
            title: Text('单条查询', style: TextStyle(color: Colors.grey),)
        ),
        BubbleBottomBarItem(
        backgroundColor: AppTheme.cardWhite,
            icon: Icon(
              Icons.text_fields,
              color: Colors.black,
            ),
            activeIcon: Icon(
              Icons.text_fields,
              color: AppTheme.nearlyDarkBlue,
            ),
            title: Text('批量查询',style: TextStyle(color: Colors.grey),)
        ),
      ],
    ),
  );
}

import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/pages/drawer_starter/utils/drawer_model.dart';
import '../home_drawer.dart';
import '../utils/app_theme.dart';
import 'action.dart';
import 'state.dart';


double drawerWidth;
ScrollController scrollController;


Widget buildView(DrawerUserControllerState state, Dispatch dispatch, ViewService viewService) {
  drawerWidth = MediaQuery.of(viewService.context).size.width * 0.75;
  scrollController = ScrollController(initialScrollOffset: drawerWidth);
  scrollController..addListener(() {
    if (scrollController.offset <= 0) {
      if (state.scrolloffset != 1.0) {
        state.scrolloffset = 1.0;
        dispatch(DrawerUserControllerActionCreator.updateOffset(1.0));
        try {
          state.drawerIsOpen(true);
        } catch (_) {}
      }
      state.iconAnimationController.animateTo(0.0, duration: const Duration(milliseconds: 0), curve: Curves.fastOutSlowIn);
    } else if (scrollController.offset > 0 && scrollController.offset < drawerWidth.floor()) {
      state.iconAnimationController.animateTo((scrollController.offset * 100 / (drawerWidth)) / 100,
          duration: const Duration(milliseconds: 0), curve: Curves.fastOutSlowIn);
    } else {
      if (state.scrolloffset != 0.0) {
        state.scrolloffset = 0.0;
        dispatch(DrawerUserControllerActionCreator.updateOffset(0.0));
        try {
          state.drawerIsOpen(false);
        } catch (_) {}
      }
      state.iconAnimationController.animateTo(1.0, duration: const Duration(milliseconds: 0), curve: Curves.fastOutSlowIn);
    }
  });
  WidgetsBinding.instance.addPostFrameCallback((_) => ()async{scrollController.jumpTo(drawerWidth);return true;});
  void onDrawerClick() {
    //if scrollcontroller.offset != 0.0 then we set to closed the drawer(with animation to offset zero position) if is not 1 then open the drawer
    if (scrollController.offset != 0.0) {
      scrollController.animateTo(
        0.0,
        duration: const Duration(milliseconds: 400),
        curve: Curves.fastOutSlowIn,
      );
    } else {
      scrollController.animateTo(
        drawerWidth,
        duration: const Duration(milliseconds: 400),
        curve: Curves.fastOutSlowIn,
      );
    }
  }

  return Container(
    color: AppTheme.nearlyWhite,
    child: SafeArea(
      top: false,
      bottom: false,
      child: Scaffold(
        backgroundColor: AppTheme.nearlyWhite,
        body: Scaffold(
          backgroundColor: AppTheme.white,
          body: SingleChildScrollView(
            controller: scrollController,
            scrollDirection: Axis.horizontal,
            physics: const PageScrollPhysics(parent: ClampingScrollPhysics()),
            child: SizedBox(
              height: MediaQuery.of(viewService.context).size.height,
              width: MediaQuery.of(viewService.context).size.width + drawerWidth,
              child: Row(
                children: <Widget>[
                  SizedBox(
                    width: drawerWidth,
                    height: MediaQuery.of(viewService.context).size.height,
                    child: AnimatedBuilder(
                      animation: state.iconAnimationController,
                      builder: (BuildContext context, Widget child) {
                        return Transform(
                            transform: Matrix4.translationValues(scrollController.offset, 0.0, 0.0),
                            child: HomeDrawer(
                              screenIndex: state.currentIndex == null ? DrawerIndex.HOME : state.currentIndex,
                              iconAnimationController: state.iconAnimationController,
                              drawerList: state.drawerList,
                              callBackIndex: (DrawerIndex indexType) {
                                onDrawerClick();
                              },
                              dispatch: dispatch,
                            ),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(viewService.context).size.width,
                    height: MediaQuery.of(viewService.context).size.height,
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppTheme.white,
                        boxShadow: <BoxShadow>[
                          BoxShadow(color: AppTheme.grey.withOpacity(0.6), blurRadius: 24),
                        ],
                      ),
                      child: Stack(
                        children: <Widget>[
                          //this IgnorePointer we use as touch(user Interface) widget.screen View, for example scrolloffset == 1 means drawer is close we just allow touching all widget.screen View
                          IgnorePointer(
                            ignoring: state.scrolloffset == 1 || false,
                            child: state.screens[state.currentIndex]
//                            viewService.buildComponent(state.screens[state.currentIndex]),
                          ),
                          //alternative touch(user Interface) for widget.screen, for example, drawer is close we need to tap on a few home screen area and close the drawer
                          if (state.scrolloffset == 1.0)
                            InkWell(
                              onTap: () {
                                onDrawerClick();
                                print(state.currentIndex);
                              },
                            ),
                          // this just menu and arrow icon animation
                          Padding(
                            padding: EdgeInsets.only(top: MediaQuery.of(viewService.context).padding.top + 8, left: 8),
                            child: SizedBox(
                              width: AppBar().preferredSize.height - 8,
                              height: AppBar().preferredSize.height - 8,
                              child: Material(
                                color: Colors.transparent,
                                child: InkWell(
                                  borderRadius: BorderRadius.circular(AppBar().preferredSize.height),
                                  child: Center(
                                    // if you use your own menu view UI you add form initialization
                                    child: AnimatedIcon(
                                        icon: state.animatedIconData != null ? state.animatedIconData : AnimatedIcons.arrow_menu,
                                        progress: state.iconAnimationController),
                                  ),
                                  onTap: () {
                                    FocusScope.of(viewService.context).requestFocus(FocusNode());
                                    onDrawerClick();
                                  },
                                ),
                              ),
                            ),
                          ),],),),),],),),),),),),);
}

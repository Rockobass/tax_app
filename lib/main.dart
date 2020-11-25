import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'pages/drawer_starter/main_page/component.dart';
import 'utils/app_theme.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
//      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Platform.isAndroid ? Brightness.dark : Brightness.light,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarDividerColor: Colors.grey,
      systemNavigationBarIconBrightness: Brightness.dark,
    ));
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: AppTheme.textTheme,
        platform: TargetPlatform.iOS,
      ),
      home: DrawerUserControllerComponent().buildPage(null)
    );
  }
}

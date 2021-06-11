import 'package:flutter/material.dart';
import 'package:milk/Homepage.dart';
import 'package:milk/myaccount.dart';
class TabNavigatorRoutes{
    static const String root = '/';
  static const String detail = '/detail';
}
class TabNavigator extends StatelessWidget {
    TabNavigator({this.navigatorKey,this.page});
    final GlobalKey<NavigatorState> navigatorKey;
  // final TabItem tabItem;
  final String page;

  @override
  Widget build(BuildContext context) {
    Widget child;
    if(page=="page1")
    child=HomePage();
    else if(page=="page2")
    child=Myaccount();
    return Navigator(
      key: navigatorKey,
      initialRoute: TabNavigatorRoutes.root,
      onGenerateRoute: (routesettings)
      {
        return MaterialPageRoute(builder: (context)
        {
         return child; 
        });
      },      
    );
  }
}
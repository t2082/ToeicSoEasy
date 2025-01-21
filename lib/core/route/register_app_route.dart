import 'package:flutter/material.dart';

class RegisterRoutes {
  static final Map<String, WidgetBuilder> routes = {};
  //create a new route
  static void create(String routeName, Widget pageWidget) {
    routes[routeName] = (context) => pageWidget;
  }
}

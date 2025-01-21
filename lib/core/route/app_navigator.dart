import 'package:flutter/material.dart';

class AppNavigator {
  void push(BuildContext context, Widget widget) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => widget));
  }

  void pushReplacement(BuildContext context, Widget widget) {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => widget));
  }

  void pushNamed(BuildContext context, String routeName) {
    Navigator.pushNamed(context, routeName);
  }

  void popAndPushNamed(BuildContext context, String routeName) {
    Navigator.popAndPushNamed(context, routeName);
  }

  void pop(BuildContext context) {
    Navigator.pop(context);
  }
  
}

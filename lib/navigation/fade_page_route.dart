import 'package:flutter/material.dart';

class FadePageRoute extends PageRouteBuilder {
  final Widget screen;

  FadePageRoute({this.screen})
      : super(
            transitionDuration: Duration(seconds: 1),
            transitionsBuilder: (BuildContext context,
                Animation<double> animation,
                Animation<double> secAnimation,
                Widget child) {
              return FadeTransition(
                opacity: animation,
                child: child,
              );
            },
            pageBuilder: (BuildContext context, Animation<double> animation,
                Animation<double> secAnimation) {
              return screen;
            });
}

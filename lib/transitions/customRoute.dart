import 'package:flutter/material.dart';

class CustomPageRoute extends PageRouteBuilder {
  CustomPageRoute({required this.child})
      : super(
        transitionDuration: const Duration(milliseconds: 150),
        reverseTransitionDuration: const Duration(milliseconds: 150),
          pageBuilder: (context, animation, secondaryAnimation) => child,
        );
  final Widget child;
  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation, Widget child) =>
      SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(1.0, 0.0),
          end: Offset.zero
        ).animate(animation),
        child: child);
}

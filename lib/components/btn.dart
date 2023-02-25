import 'package:flutter/material.dart';

class Btn extends StatelessWidget {
  final List<Color> gradient;
  final Color color;
  final double height;
  final double width;
  final GestureTapCallback onTap;
  final double borderRadius;
  final Widget child;

  Btn(
      {Key? key,
         required this.color,
        required this.onTap,
        required this.child,
        this.borderRadius = 0,
        required this.height,
        required this.width, required this.gradient})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius),
          color: color,

          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(.1),
                spreadRadius: 5,
                blurRadius: 10)
          ],
        ),
        child: Center(
          child: child,
        ),
      ),
    );
  }
}
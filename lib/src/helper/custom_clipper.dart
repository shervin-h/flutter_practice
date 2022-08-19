import 'package:flutter/material.dart';

class CurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, 0);
    Offset curvePoint = Offset(size.width * 0.1, size.height * 0.8);
    Offset endPoint = Offset(size.width, size.height);

    path.quadraticBezierTo(
      curvePoint.dx,
      curvePoint.dy,
      endPoint.dx,
      endPoint.dy,
    );
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}

class CurveClipperSample extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, 4 * size.height / 5);
    Offset curvePoint = Offset(size.width / 2, size.height);
    Offset endPoint = Offset(size.width, 4 * size.height / 5);
    path.quadraticBezierTo(
      curvePoint.dx,
      curvePoint.dy,
      endPoint.dx,
      endPoint.dy,
    );

    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}

class SinusClipperSample extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, 4/5 * size.height);

    Offset curvePoint1 = Offset(size.width / 4, size.height);
    Offset centerPoint = Offset(size.width / 2, 4/5 * size.height);
    path.quadraticBezierTo(
      curvePoint1.dx,
      curvePoint1.dy,
      centerPoint.dx,
      centerPoint.dy,
    );

    Offset curvePoint2 = Offset(3/4 * size.width, 3/5 * size.height);
    Offset endPoint = Offset(size.width, 4/5 * size.height);
    path.quadraticBezierTo(
      curvePoint2.dx,
      curvePoint2.dy,
      endPoint.dx,
      endPoint.dy,
    );

    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
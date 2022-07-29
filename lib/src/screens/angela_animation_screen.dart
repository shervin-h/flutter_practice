import 'package:flutter/material.dart';

class AngelaAnimationScreen extends StatefulWidget {
  const AngelaAnimationScreen({Key? key}) : super(key: key);

  @override
  State<AngelaAnimationScreen> createState() => _AngelaAnimationScreenState();
}

class _AngelaAnimationScreenState extends State<AngelaAnimationScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
    _animationController.forward();
    _animationController.addStatusListener((status) {
      print(status.toString());
      if (_animationController.isCompleted) {
        // _animationController.reverse();
      } else if (_animationController.isDismissed){
        // _animationController.forward();
      }
    });
    _animationController.addListener(() {
      print(_animationController.value);
    });

    _animation = CurvedAnimation(parent: _animationController, curve: Curves.easeIn);
    _animation = ColorTween(begin: Colors.red, end: Colors.blue).animate(_animationController);
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

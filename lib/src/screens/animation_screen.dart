import 'package:flutter/material.dart';

class AnimationScreen extends StatefulWidget {
  const AnimationScreen({Key? key}) : super(key: key);

  @override
  State<AnimationScreen> createState() => _AnimationScreenState();
}

class _AnimationScreenState extends State<AnimationScreen>
    with TickerProviderStateMixin {

  late AnimationController _animationController;
  late Animation<double> _animation;
  late Animation<BorderRadius> _radiusAnimation;
  late Animation<Color> _color1Animation;
  late Animation<Color?> _color2Animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 3000),
    );
    _animationController.forward();
    _animationController.addListener(() {
      setState(() {});
    });

    _color2Animation = ColorTween(begin: Colors.red, end: Colors.blue).animate(CurvedAnimation(parent: _animationController, curve: Curves.easeIn));

    _animation = CurvedAnimation(parent: _animationController, curve: Curves.easeIn);
    // _animation = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(parent: _animationController, curve: Curves.easeIn));
    _radiusAnimation = Tween(begin: BorderRadius.circular(4), end: BorderRadius.circular(34)).animate(CurvedAnimation(parent: _animationController, curve: Curves.easeIn));
    // _color1Animation = Tween<Color>(begin: Colors.red, end: Colors.blue).animate(CurvedAnimation(parent: _animationController, curve: Curves.easeIn));
  }



  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            decoration: BoxDecoration(
              color: _color2Animation.value,
            ),
          ),
            // child: Container(
            //   // width: _animation.value * 100,
            //   // height: _animation.value * 100,
            //   width: 200,
            //   height: 200,
            //   decoration: BoxDecoration(
            //     color: Colors.cyan,
            //     borderRadius: _radiusAnimation.value
            //   ),
            // ),

        ),
      ),
    );
  }
}

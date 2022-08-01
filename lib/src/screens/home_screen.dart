import 'package:flutter/material.dart';
import 'package:practice/src/helper/signature_helper.dart';
import 'package:practice/src/helper/syncfusion_flutter_gauges.dart';
import 'package:practice/src/screens/angela_animation_screen.dart';
import 'package:practice/src/screens/animation_screen.dart';
import 'package:practice/src/screens/tab_screen.dart';

import 'config_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int _currentIndex = 0;
  final List<Widget> _screens = [
    TabScreen(),
    ConfigScreen(),
    SyncfusionFlutterGaugesScreen(),
    SignatureSample(),
    AngelaAnimationScreen(),
    AnimationScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.tab), label: 'تب ها'),
            BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'تنظیمات'),
            BottomNavigationBarItem(icon: Icon(Icons.area_chart), label: 'آمپر بنزین'),
            BottomNavigationBarItem(icon: Icon(Icons.newspaper), label: 'امضا'),
            BottomNavigationBarItem(icon: Icon(Icons.animation), label: 'انیمیشن ۱'),
            BottomNavigationBarItem(icon: Icon(Icons.add_chart), label: 'انیمیشن ۲'),
          ],
        ),
        body: _screens[_currentIndex],
      ),
    );
  }
}

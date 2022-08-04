import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_signature_pad/flutter_signature_pad.dart';
import 'package:practice/src/helper/signature_helper.dart';
import 'package:practice/src/helper/sleek_circular_slider_helper.dart';
import 'package:practice/src/helper/syncfusion_flutter_gauges.dart';
import 'package:practice/src/helper/vehicle_license_plate.dart';
import 'package:practice/src/helper/work_with_files.dart' ;
import 'package:practice/src/screens/angela_animation_screen.dart';
import 'package:practice/src/screens/animation_screen.dart';
import 'package:practice/src/screens/config_screen.dart';
import 'package:practice/src/screens/home_screen.dart';
import 'package:practice/src/screens/menu_screen.dart';



void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Vazir',
        primarySwatch: Colors.blue,
      ),
      home: const MenuScreen(),
    );
  }
}

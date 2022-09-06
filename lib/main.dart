import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:flutter_signature_pad/flutter_signature_pad.dart';
import 'package:practice/src/screens/add/images_provider.dart';
import 'package:practice/src/screens/add/tabs/signature_helper.dart';
import 'package:practice/src/screens/add/tabs/sleek_circular_slider_helper.dart';
import 'package:practice/src/screens/add/tabs/syncfusion_flutter_gauges.dart';
import 'package:practice/src/screens/add/tabs/vehicle_license_plate.dart';
import 'package:practice/src/helper/work_with_files.dart';
import 'package:practice/src/screens/angela_animation_screen.dart';
import 'package:practice/src/screens/animation_screen.dart';
import 'package:practice/src/screens/config_screen.dart';
import 'package:practice/src/screens/home_screen.dart';
import 'package:practice/src/screens/add/tabs/images_screen.dart';
import 'package:practice/src/screens/login_screen.dart';
import 'package:practice/src/screens/menu_screen.dart';
import 'package:practice/src/screens/add/tab_screen.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<ImagesProvider>(create: (_) => ImagesProvider()),
      ],
      child: const MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', ''), // English, no country code
        Locale('fa', ''),
      ],
      locale: const Locale('fa'),

      theme: ThemeData(
        fontFamily: 'Vazir',
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.grey.shade300,
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: Colors.cyan,
          onPrimary: Colors.white,
          secondary: Colors.deepOrange,
          onSecondary: Colors.white,
        ),

        appBarTheme: AppBarTheme(
          elevation: 0,
          backgroundColor: Colors.white,
          titleTextStyle: TextStyle(
            fontFamily: 'Vazir',
            color: Colors.grey[700],
            fontWeight: FontWeight.bold,
          ),

        ),

        inputDecorationTheme: InputDecorationTheme(
          contentPadding: const EdgeInsets.all(4),
          filled: true,
          fillColor: Colors.grey.shade200,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide.none,
          ),
        ),

        tabBarTheme: TabBarTheme(
          labelColor: Colors.grey[700],
          labelStyle: const TextStyle(
            fontFamily: 'Vazir',
            fontWeight: FontWeight.bold,
          ),
        ),

      ),
      home: TabScreen(),
      routes: {
        TabScreen.routeName: (context) => TabScreen(),
      },
    );
  }
}

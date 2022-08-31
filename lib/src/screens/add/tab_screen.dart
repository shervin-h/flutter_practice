import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:practice/src/screens/add/tabs/signature_helper.dart';
import 'package:practice/src/screens/add/tabs/syncfusion_flutter_gauges.dart';
import 'package:practice/src/screens/add/tabs/vehicle_license_plate.dart';
import 'package:practice/src/screens/add/tabs/images_screen.dart';

import 'keys.dart';

class TabScreen extends StatefulWidget {
  TabScreen({Key? key}) : super(key: key);

  static const String routeName = 'tab-screen';

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> with TickerProviderStateMixin {
  late TabController _tabController;

  final List<Widget> _tabs = const [
    Tab(text: 'اطلاعات'),
    Tab(text: 'موقعیت'),
    Tab(text: 'تصاویر'),
    Tab(text: 'امضا'),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _tabs.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('اپلیکیشن تمرینی'),
        bottom: TabBar(
          controller: _tabController,
          tabs: _tabs,
          indicatorColor: Theme.of(context).colorScheme.primary,
        ),
      ),
      body: TabBarView(
        physics: const NeverScrollableScrollPhysics(),
        controller: _tabController,
        children: [
          const LicensePlate(),
          const SyncfusionFlutterGaugesScreen(),
          ImagePickerScreen(key: KeyUtil.imagePickerScreenKey),
          const SignatureSample(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () async {
            if (KeyUtil.imagePickerScreenKey.currentState!.imageFileFuel != null &&
                KeyUtil.imagePickerScreenKey.currentState!.imageFileKilometer != null &&
                KeyUtil.imagePickerScreenKey.currentState!.imageFileFront != null &&
                KeyUtil.imagePickerScreenKey.currentState!.imageFileBack != null &&
                KeyUtil.imagePickerScreenKey.currentState!.imageFileRightSide != null &&
                KeyUtil.imagePickerScreenKey.currentState!.imageFileLeftSide != null) {
              print('ایول همه مقدار دارند');

              File imageFuel = KeyUtil.imagePickerScreenKey.currentState!.imageFileFuel!;
              String encodedImageFuelAsString = base64.encode(await imageFuel.readAsBytes());
              print('---------------------------------');
              print('image fuel as encoded string: $encodedImageFuelAsString');

              File imageKilometer = KeyUtil.imagePickerScreenKey.currentState!.imageFileKilometer!;
              String encodedImageKilometerAsString = base64.encode(await imageKilometer.readAsBytes());
              print('---------------------------------');
              print('image kilometer as encoded string: $encodedImageKilometerAsString');

              File imageFront = KeyUtil.imagePickerScreenKey.currentState!.imageFileFront!;
              String encodedImageFrontAsString = base64.encode(await imageFront.readAsBytes());
              print('---------------------------------');
              print('image Front as encoded string: $encodedImageFrontAsString');

              File imageBack = KeyUtil.imagePickerScreenKey.currentState!.imageFileFront!;
              String encodedImageBackAsString = base64.encode(await imageBack.readAsBytes());
              print('---------------------------------');
              print('image back as encoded string: $encodedImageBackAsString');

              File imageRightSide = KeyUtil.imagePickerScreenKey.currentState!.imageFileFront!;
              String encodedImageRightSideAsString = base64.encode(await imageRightSide.readAsBytes());
              print('---------------------------------');
              print('image right side as encoded string: $encodedImageRightSideAsString');

              File imageLeftSide = KeyUtil.imagePickerScreenKey.currentState!.imageFileFront!;
              String encodedImageLeftSideAsString = base64.encode(await imageLeftSide.readAsBytes());
              print('---------------------------------');
              print('image back side as encoded string: $encodedImageLeftSideAsString');
              print('---------------------------------');
              print('حالا که همه عکس ها یا تعدادی که ما می خواهیم مقدار دهی شدند، می توانیم  بایت های فایل عکس ها را به صورت لیست از اینتجر ها بگیرم و آن ها را با استفاده از بیس ۶۴ انکد، به رشته تبدیل کنیم و این استرینگ را به سمت سرور بفرستیم   :)');
              print('---------------------------------');
            } else {
              print('لطفا همه تصاویر را مقدار دهی کنید');
            }
          },
          child: const Icon(CupertinoIcons.add)),
    );
  }
}

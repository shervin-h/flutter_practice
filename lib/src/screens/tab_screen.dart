import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TabScreen extends StatefulWidget {
  TabScreen({Key? key}) : super(key: key);

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> with TickerProviderStateMixin {
  late TabController _tabController;
  List<Widget> _tabs = [
    Tab(
      text: 'تب ۱',
      icon: Icon(Icons.abc),
    ),
    Tab(
      text: 'تب ۲',
      icon: Icon(Icons.add),
    ),
    Tab(
      text: 'تب ۳',
      icon: Icon(Icons.ac_unit),
    ),
  ];

  List<Widget> _tabScreens = [
    Container(
      child: Text('tab 1'),
    ),
    Container(
      child: Text('tab 2'),
    ),
    Container(
      child: Text('tab 3'),
    ),
  ];

  @override
  void initState() {
    super.initState();

    // WidgetsBinding.instance.addPostFrameCallback((_) async {
    //   DateTime dateTime = DateTime.now();
    //   String formattedDate = DateFormat('kk:mm:ss \n EEE d MMM').format(dateTime);
    //
    //   // Api.getCurrentCityTime
    //   // if (apitime == devicetime){}
    //   MinovitApi.getAppVersion(context).then((String? apiVersion) {
    //     String currentVersion = Provider.of<MinovitData>(context, listen: false).version;
    //
    //     if (apiVersion != null) {
    //       if (apiVersion != currentVersion) {
    //         showDialog<String>(
    //           context: context,
    //           builder: (BuildContext context) => CupertinoAlertDialog(
    //             title: const SizedBox(),
    //             content: Text('لطفاً ساعت گوشی را تنظیم کنید', style: TextStyle(color: Colors.grey.shade800),),
    //             actions: [
    //               GestureDetector(
    //                 onTap: () => Navigator.of(context).pop(),
    //                 child: const Padding(
    //                   padding: EdgeInsets.all(4.0),
    //                   child: Text(
    //                     'بستن',
    //                     textAlign: TextAlign.center,
    //                   ),
    //                 ),
    //               ),
    //             ],
    //           ),
    //         );
    //       }
    //     }
    //
    //   });
    // });

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
        title: const Text('TabBar'),
        bottom: TabBar(
          controller: _tabController,
          tabs: _tabs,
        ),
      ),
      body: TabBarView(
        physics: const BouncingScrollPhysics(),
        controller: _tabController,
        children: _tabScreens,
      ),
    );
  }
}

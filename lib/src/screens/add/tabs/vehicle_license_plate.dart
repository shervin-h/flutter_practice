import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LicensePlate extends StatefulWidget {
  const LicensePlate({Key? key}) : super(key: key);

  @override
  State<LicensePlate> createState() => _LicensePlateState();
}

class _LicensePlateState extends State<LicensePlate> {

  String _letter = 'ب';
  String _iranNumber = '۱۱';

  late TextEditingController _twoDigitsController;
  late TextEditingController _threeDigitsController;

  final _threeDigitsFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _twoDigitsController = TextEditingController();
    _threeDigitsController = TextEditingController();

    _twoDigitsController.addListener(() {
      if(_twoDigitsController.text.length == 2){
        FocusScope.of(context).requestFocus(_threeDigitsFocusNode);
      }
    });

    _threeDigitsController.addListener(() {
      if (_threeDigitsController.text.length == 3) {
        // jump to _iranNumber as TextField
      }
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _threeDigitsFocusNode.dispose();
    _twoDigitsController.dispose();
    _threeDigitsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    // double screenHeight = MediaQuery.of(context).size.height;

    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        body: SafeArea(
          child: Center(
            child: Container(
              width: screenWidth * 0.7,
              height: screenWidth * 0.2,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  width: 2,
                  color: Colors.black,
                ),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 2,
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8),
                          bottomLeft: Radius.circular(8),
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text('🇮🇷'),
                          Text('I.R.\nIRAN', style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: TextField(
                      controller: _twoDigitsController,
                      // autofocus: true,
                      keyboardType: TextInputType.number,
                      maxLines: 1,
                      textAlign: TextAlign.center,
                      maxLength: 2,
                      style: const TextStyle(fontSize: 24),
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.all(2),
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(borderSide: BorderSide.none),
                        counterText: '',
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: PopupMenuButton(
                      iconSize: screenWidth * 0.2 * 0.6,
                      icon: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(_letter, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18,),),
                          const SizedBox(height: 2),
                          const Icon(CupertinoIcons.chevron_down, size: 12,),
                        ],
                      ),
                      initialValue: 'ب',
                      onSelected: (String value) {
                        setState(() {
                          _letter = value;
                        });
                        // print(value);
                      },
                      itemBuilder: (context) {
                        return const [
                          PopupMenuItem(value: 'ب',child: Center(child: Text('ب')),),
                          PopupMenuItem(value: 'پ',child: Center(child: Text('پ')),),
                          PopupMenuItem(value: 'ت',child: Center(child: Text('ت')),),
                          PopupMenuItem(value: 'ن',child: Center(child: Text('ن')),),
                          PopupMenuItem(value: 'م',child: Center(child: Text('م')),),
                          PopupMenuItem(value: 'د',child: Center(child: Text('د')),),
                        ];
                      },
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: TextField(
                      controller: _threeDigitsController,
                      focusNode: _threeDigitsFocusNode,
                      keyboardType: TextInputType.number,
                      maxLines: 1,
                      textAlign: TextAlign.center,
                      maxLength: 3,
                      style: const TextStyle(fontSize: 24),
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.all(2),
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(borderSide: BorderSide.none),
                        counterText: '',
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Container(
                      padding: const EdgeInsets.all(1),
                      decoration: const BoxDecoration(
                        border: Border(
                          left: BorderSide()
                        )
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('ایران', style: TextStyle(color: Colors.grey[800], fontSize: 14, fontWeight: FontWeight.bold),),
                          PopupMenuButton(
                            icon: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(_iranNumber, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14,),),
                                const SizedBox(width: 2),
                                const Icon(CupertinoIcons.chevron_down, size: 12,),
                              ],
                            ),
                            initialValue: '11',
                            onSelected: (String value) {
                              setState(() {
                                _iranNumber = value;
                              });
                            },
                            itemBuilder: (context) {
                              return const [
                                PopupMenuItem(value: '۱۱', child: Center(child: Text('۱۱'),)),
                                PopupMenuItem(value: '۲۲', child: Center(child: Text('۲۲'),)),
                                PopupMenuItem(value: '۳۳', child: Center(child: Text('۳۳'),)),
                                PopupMenuItem(value: '۴۴', child: Center(child: Text('۴۴'),)),
                                PopupMenuItem(value: '۵۵', child: Center(child: Text('۵۵'),)),
                                PopupMenuItem(value: '۶۶', child: Center(child: Text('۶۶'),)),
                                PopupMenuItem(value: '۷۷', child: Center(child: Text('۷۷'),)),
                                PopupMenuItem(value: '۸۸', child: Center(child: Text('۸۸'),)),
                                PopupMenuItem(value: '۹۹', child: Center(child: Text('۹۹'),)),
                                PopupMenuItem(value: '۱۰', child: Center(child: Text('۱۰'),)),
                                PopupMenuItem(value: '۲۰', child: Center(child: Text('۲۰'),)),
                              ];
                            },
                          ),
                          // Text('66', style: TextStyle(color: Colors.grey[800], fontSize: 20, fontWeight: FontWeight.bold),),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

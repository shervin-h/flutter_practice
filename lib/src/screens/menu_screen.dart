import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:practice/src/screens/add/tab_screen.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        backgroundColor: Colors.grey.shade400,
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        Container(
                          width: screenWidth * 0.3,
                          height: (screenWidth * 0.45) + 4,
                          margin: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            color: Colors.red,
                            border: Border.all(
                              color: Colors.white,
                              width: 3,
                            ),
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(24),
                              topRight: Radius.circular(8),
                              bottomLeft: Radius.circular(8),
                              bottomRight: Radius.circular(8),
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(CupertinoIcons.doc_text, color: Colors.white, size: 40,),
                              const SizedBox(height: 8),
                              Text('لیست صدور', style: menuTextStyle,),
                            ],
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.of(context).pushNamed(TabScreen.routeName);
                          },
                          child: Container(
                            width: screenWidth * 0.3,
                            height: (screenWidth * 0.45) + 4,
                            margin: const EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              color: Colors.grey.shade700,
                              border: Border.all(
                                color: Colors.white,
                                width: 3,
                              ),
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(8),
                                topRight: Radius.circular(8),
                                bottomLeft: Radius.circular(24),
                                bottomRight: Radius.circular(8),
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(CupertinoIcons.doc_checkmark, color: Colors.white, size: 40,),
                                const SizedBox(height: 8),
                                Text('پذیرش جدید', style: menuTextStyle,),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          width: screenWidth * 0.3,
                          height: screenWidth * 0.3,
                          margin: const EdgeInsets.only(top: 4, bottom: 4, left: 4, right: 4,),
                          decoration: BoxDecoration(
                            color: Colors.green,
                            border: Border.all(
                              color: Colors.white,
                              width: 3,
                            ),
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(8),
                              topRight: Radius.circular(8),
                              bottomLeft: Radius.circular(8),
                              bottomRight: Radius.circular(8),
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(CupertinoIcons.add, color: Colors.white, size: 34,),
                              const SizedBox(height: 8),
                              Text('جدید', style: menuTextStyle.copyWith(fontSize: 18),),
                            ],
                          ),
                        ),
                        Container(
                          width: screenWidth * 0.3,
                          height: screenWidth * 0.4,
                          margin: const EdgeInsets.only(top: 4, bottom: 4, left: 4, right: 4,),
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            border: Border.all(
                              color: Colors.white,
                              width: 3,
                            ),
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(8),
                              topRight: Radius.circular(8),
                              bottomLeft: Radius.circular(8),
                              bottomRight: Radius.circular(8),
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(CupertinoIcons.person, color: Colors.white, size: 40,),
                              const SizedBox(height: 8),
                              Text('شروین', style: menuTextStyle,),
                            ],
                          ),
                        ),
                        Container(
                          width: screenWidth * 0.3,
                          height: screenWidth * 0.2,
                          margin: const EdgeInsets.only(top: 4, bottom: 4, left: 4, right: 4,),
                          decoration: BoxDecoration(
                            color: Colors.orange,
                            border: Border.all(
                              color: Colors.white,
                              width: 3,
                            ),
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(8),
                              topRight: Radius.circular(8),
                              bottomLeft: Radius.circular(8),
                              bottomRight: Radius.circular(8),
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(CupertinoIcons.clear, color: Colors.white, size: 28,),
                              const SizedBox(height: 4),
                              Text('خروج', style: menuTextStyle.copyWith(fontSize: 16),),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          width: screenWidth * 0.3,
                          height: screenWidth * 0.2,
                          margin: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            color: Colors.pink,
                            border: Border.all(
                              color: Colors.white,
                              width: 3,
                            ),
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(8),
                              topRight: Radius.circular(24),
                              bottomLeft: Radius.circular(8),
                              bottomRight: Radius.circular(8),
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(CupertinoIcons.search, color: Colors.white, size: 26,),
                              const SizedBox(height: 4),
                              Text('جست و جو', style: menuTextStyle.copyWith(fontSize: 16),),
                            ],
                          ),
                        ),
                        Container(
                          width: screenWidth * 0.3,
                          height: screenWidth * 0.3,
                          margin: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            color: Colors.cyan,
                            border: Border.all(
                              color: Colors.white,
                              width: 3,
                            ),
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(8),
                              topRight: Radius.circular(8),
                              bottomLeft: Radius.circular(8),
                              bottomRight: Radius.circular(8),
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(CupertinoIcons.doc_richtext, color: Colors.white, size: 40,),
                              const SizedBox(height: 8),
                              Text('آیتم', style: menuTextStyle,),
                            ],
                          ),
                        ),
                        Container(
                          width: screenWidth * 0.3,
                          height: screenWidth * 0.4,
                          margin: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            color: Colors.purpleAccent,
                            border: Border.all(
                              color: Colors.white,
                              width: 3,
                            ),
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(8),
                              topRight: Radius.circular(8),
                              bottomLeft: Radius.circular(8),
                              bottomRight: Radius.circular(24),
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(CupertinoIcons.doc_on_doc, color: Colors.white, size: 40,),
                              const SizedBox(height: 8),
                              Text('پذیرش ها', style: menuTextStyle,),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

TextStyle menuTextStyle = const TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.w500,
  fontSize: 20,
);
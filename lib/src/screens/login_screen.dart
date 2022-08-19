import 'package:flutter/material.dart';
import 'package:practice/src/helper/custom_clipper.dart';

class LoginScree extends StatelessWidget {
  const LoginScree({Key? key}) : super(key: key);

  static const String routeName = 'login_screen';

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: const Text(
          'Custom Clipper',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  SizedBox(height: screenWidth * 0.8),
                  Container(
                    width: screenWidth * 0.6,
                    height: screenWidth * 0.6,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      image: DecorationImage(
                        image: AssetImage('assets/images/placeholder.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'نام کاربری',
                        hintStyle: TextStyle(fontFamily: 'Vazir'),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'رمز عبور',
                        hintStyle: TextStyle(fontFamily: 'Vazir'),
                      ),
                    ),
                  ),
                  Container(
                    width: screenWidth * 0.6,
                    height: screenWidth * 0.6,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      image: DecorationImage(
                        image: AssetImage('assets/images/placeholder.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            ClipPath(
              clipper: CurveClipper(),
              child: Container(
                width: screenWidth,
                height: screenWidth * 0.8,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.cyan,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('مشتی متن میتونه اینجا باشه', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),),
                    Text('دستم رو میذارم روی کیبورد و شروع میکنم به تایپ کردن مشتی چرت و پرت تا یه متن آزمایشی برات تولید کنم و همین طور الکی لورم ایپسوم از خودم در میکنم \n و همینطور تایپ کردن این چرتو پرتا رو برات\n ادامه میدم...', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),),
                    Container(
                      margin: const EdgeInsets.all(8),
                      width: screenWidth * 0.2,
                      height: screenWidth * 0.2,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        image: DecorationImage(
                          image: AssetImage('assets/images/placeholder.png'),
                          fit: BoxFit.cover
                        ),
                        boxShadow: [
                          BoxShadow(color: Colors.black.withOpacity(0.2), blurRadius: 4)
                        ]
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:platform_device_id/platform_device_id.dart';

class ConfigScreen extends StatefulWidget {
  const ConfigScreen({Key? key}) : super(key: key);

  // String? deviceId = await PlatformDeviceId.getDeviceId;
  @override
  State<ConfigScreen> createState() => _ConfigScreenState();
}

class _ConfigScreenState extends State<ConfigScreen> {
  Object? _groupValue = 1;
  bool specialEditionForRepresentatives = false;
  bool sendImagesWhenSaving = false;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('شرکت نرم افزاری (سروشان)'),
          leading: Container(
            margin: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: Colors.green,
              shape: BoxShape.circle,
              // image: DecorationImage(
              //   image: AssetImage(''),
              //   fit: BoxFit.fill,
              // ),
            ),
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Container(
              margin: const EdgeInsets.all(8.0),
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.green,
                  width: 2.0,
                ),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Column(
                children: [
                  TextField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.green.withOpacity(0.2),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      prefixText: 'آدرس سرور: ',
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.green,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: FutureBuilder<String?>(
                      future: PlatformDeviceId.getDeviceId,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                            child: CupertinoActivityIndicator(
                              radius: 12,
                              color: Colors.green,
                            ),
                          );
                        } else {
                          // snapshot.connectionState == ConnectionState.done
                          if (snapshot.hasError) {
                            return const Center(
                              child: Text('چی شد!!'),
                            );
                          } else if (snapshot.hasData) {
                            String? deviceId = snapshot.data;
                            return Center(
                              child: Text(deviceId ?? ''),
                            );
                          } else {
                            return const SizedBox();
                          }
                        }
                      },
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                    child: Divider(
                      height: 2,
                      color: Colors.green,
                    ),
                  ),
                  SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        const Text('رسته پذیرش: '),
                        Row(
                          children: [
                            Radio(
                              value: 1,
                              groupValue: _groupValue,
                              onChanged: (value) {
                                setState(() {
                                  _groupValue = value;
                                });
                              },
                            ),
                            const Text('خودرو'),
                          ],
                        ),
                        Row(
                          children: [
                            Radio(
                              value: 2,
                              groupValue: _groupValue,
                              onChanged: (value) {
                                setState(() {
                                  _groupValue = value;
                                });
                              },
                            ),
                            const Text('موتورسیکلت'),
                          ],
                        ),
                        Row(
                          children: [
                            Radio(
                              value: 3,
                              groupValue: _groupValue,
                              onChanged: (value) {
                                setState(() {
                                  _groupValue = value;
                                });
                              },
                            ),
                            const Text('2خودرو'),
                          ],
                        ),
                        RadioItem(
                          title: '2موتور سیکلت',
                          value: 4,
                          groupValue: _groupValue,
                          onChanged: (value) {
                            setState(() {
                              _groupValue = value;
                            });
                          },
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  ListTile(
                    title: const Text('نسخه ویژه نمایندگان: '),
                    trailing: Switch(
                      value: specialEditionForRepresentatives,
                      onChanged: (b) {
                        setState(() {
                          specialEditionForRepresentatives = b;
                        });
                      },
                    ),
                  ),
                  ListTile(
                    title: const Text('ارسال تصاویر هنگام ذخیره: '),
                    trailing: Switch(
                      value: sendImagesWhenSaving,
                      onChanged: (b) {
                        setState(() {
                          sendImagesWhenSaving = b;
                        });
                      },
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          child: const Text('ذخیره'),
                          onPressed: () {},
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: ElevatedButton(
                          child: const Text('انصراف'),
                          onPressed: () {},
                        ),
                      ),
                    ],
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

class RadioItem extends StatelessWidget {
  const RadioItem({
    required this.title,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    Key? key,
  }) : super(key: key);

  final String title;
  final int value;
  final Object? groupValue;
  final void Function(Object?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Radio(
          value: value,
          groupValue: groupValue,
          onChanged: onChanged,
        ),
        Text(title),
      ],
    );
  }
}

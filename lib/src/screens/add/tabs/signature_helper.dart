import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:ui' as ui;
import 'dart:math';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_signature_pad/flutter_signature_pad.dart';

class SignatureSample extends StatefulWidget {
  const SignatureSample({Key? key}) : super(key: key);

  @override
  State<SignatureSample> createState() => _SignatureSampleState();
}

class _SignatureSampleState extends State<SignatureSample> {
  ByteData _img = ByteData(0);
  Color color = Colors.red;
  double strokeWidth = 5.0;
  final _sign = GlobalKey<SignatureState>();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 8,
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8.0),
                      width: screenWidth,
                      height: screenWidth,
                      child: FutureBuilder<ui.Image>(
                        future: _loadImage('assets/images/car_scheme.png', (screenWidth - 16.0).toInt(), (screenWidth - 16.0).toInt()),
                        builder: (BuildContext context, AsyncSnapshot<ui.Image> snapshot) {
                          if (snapshot.connectionState == ConnectionState.waiting) {
                            return const Center(
                              child: CupertinoActivityIndicator(radius: 16),
                            );
                          } else {
                            // snapshot.connectionState = ConnectionState.done
                            if (snapshot.hasData) {
                              ui.Image image = snapshot.data!;
                              return Signature(
                                color: color,
                                key: _sign,
                                onSign: () {
                                  final sign = _sign.currentState;
                                  debugPrint(
                                      '${sign!.points.length} points in the signature');
                                },
                                backgroundPainter: _WatermarkPaint("2.0", "2.0", image),
                                strokeWidth: strokeWidth,
                              );
                            } else if (snapshot.hasError) {
                              return const Center(
                                child: Text('Error occurred to draw watermark background !'),
                              );
                            } else {
                              return const Center(
                                child: Text('whats happened ?!'),
                              );
                            }
                          }
                        },
                      ),
                    ),
                    (_img.buffer.lengthInBytes == 0)
                        ? Container()
                        : Container(
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.2),
                                  blurRadius: 6,
                                ),
                              ],
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: LimitedBox(
                                  maxHeight: 200.0,
                                  child: Image.memory(_img.buffer.asUint8List()),
                              ),
                            ),
                        ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MaterialButton(
                          color: Colors.green,
                          onPressed: () async {
                            final sign = _sign.currentState;
                            //retrieve image data, do whatever you want with it (send to server, save locally...)
                            final image = await sign!.getData();
                            ByteData? data = await image.toByteData(format: ui.ImageByteFormat.png);
                            sign.clear();
                            String encoded = base64.encode(data!.buffer.asUint8List());
                            setState(() {
                              _img = data;
                            });
                            debugPrint('onPressed ' + encoded);
                          },
                          child: const Text('Save'),
                        ),
                        const SizedBox(width: 8),
                        MaterialButton(
                          color: Colors.grey,
                          onPressed: () {
                            final sign = _sign.currentState;
                            sign!.clear();
                            setState(() {
                              _img = ByteData(0);
                            });
                            debugPrint("cleared");
                          },
                          child: const Text('Clear'),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        MaterialButton(
                          onPressed: () {
                            setState(() {
                              color = (color == Colors.green)
                                  ? Colors.red
                                  : Colors.green;
                            });
                            debugPrint('change color');
                          },
                          child: const Text('Change color'),
                        ),
                        const SizedBox(),
                        MaterialButton(
                          onPressed: () {
                            setState(() {
                              int min = 1;
                              int max = 10;
                              int selection = min + (Random().nextInt(max - min));
                              strokeWidth = selection.roundToDouble();
                              debugPrint("change stroke width to $selection");
                            });
                          },
                          child: const Text('Change stroke width'),
                        ),
                      ],
                    ),
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

class _WatermarkPaint extends CustomPainter {
  final String price;
  final String watermark;
  final ui.Image image;

  _WatermarkPaint(this.price, this.watermark, this.image);

  @override
  void paint(ui.Canvas canvas, ui.Size size) {
    // canvas.drawCircle(Offset(size.width / 2, size.height / 2), 10.8,Paint()..color = Colors.blue);

    canvas.drawImage(image, const Offset(0, 0), Paint());
  }

  @override
  bool shouldRepaint(_WatermarkPaint oldDelegate) {
    return oldDelegate != this;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is _WatermarkPaint &&
          runtimeType == other.runtimeType &&
          price == other.price &&
          watermark == other.watermark;

  @override
  int get hashCode => price.hashCode ^ watermark.hashCode;
}

Future<ui.Image> loadUiImage(String imageAssetPath) async {
  final ByteData data = await rootBundle.load(imageAssetPath);
  final Completer<ui.Image> completer = Completer();
  ui.decodeImageFromList(Uint8List.view(data.buffer), (ui.Image img) {
    return completer.complete(img);
  });
  return completer.future;
}

Future<ui.Image> _loadImage(String imageAssetPath, int width, int height) async {
  ByteData byteData = await rootBundle.load(imageAssetPath);
  final Uint8List bytes = Uint8List.view(byteData.buffer);
  final ui.Codec codec = await ui.instantiateImageCodec(bytes, targetWidth: width, targetHeight: height);
  final ui.FrameInfo frameInfo = await codec.getNextFrame();
  return frameInfo.image;
}

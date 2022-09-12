import 'dart:io';
import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:practice/src/screens/add/images_provider.dart';
import 'package:practice/src/screens/add/tabs/providers/images_tab_provider.dart';
import 'package:provider/provider.dart';

class ImagePickerScreen2 extends StatefulWidget {
  const ImagePickerScreen2({Key? key}) : super(key: key);

  @override
  State<ImagePickerScreen2> createState() => ImagePickerScreen2State();
}

class ImagePickerScreen2State extends State<ImagePickerScreen2> {

  /*
    import 'dart:convert';
    import 'dart:typed_data';
    import 'package:flutter/widgets.dart';


    Image imageFromBase64String(String base64String) {
      return Image.memory(base64Decode(base64String));
    }

    Uint8List dataFromBase64String(String base64String) {
      return base64Decode(base64String);
    }

    String base64String(Uint8List data) {
      return base64Encode(data);
    }
   */
  File? imageFileFront;
  File? imageFileBack;
  File? imageFileRightSide;
  File? imageFileLeftSide;
  File? imageFileFuel;
  File? imageFileKilometer;

  List<File?> otherImageFiles = [];

  final ImagePicker _picker = ImagePicker();


  Future<String?> _pickImage({ImageSource source = ImageSource.camera}) async {
    String? encodedImage;
    XFile? xFile = await _picker.pickImage(
      source: source,
      preferredCameraDevice: CameraDevice.rear,
    );
    if (xFile != null) {
      Uint8List bytes = await xFile.readAsBytes();
      encodedImage = base64Encode(bytes);
    }
    return encodedImage;
  }


  Future<List<String>> _pickMultiImage() async {
    List<String> encodedImages = [];

    List<XFile>? xFiles = await _picker.pickMultiImage();

    if (xFiles != null && xFiles.isNotEmpty) {
      for (XFile xFile in xFiles) {
        encodedImages.add(base64Encode(await xFile.readAsBytes()));
      }
    }
    return encodedImages;
  }

  @override
  void initState() {
    super.initState();
  }

  late ImagesTabData imagesTabData;
  @override
  void didChangeDependencies() {
    imagesTabData = Provider.of<ImagesTabData>(context, listen: false);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    // double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Consumer<ImagesProvider>(
              builder: (context, imgpro, _) {
                return Expanded(
                  flex: 2,
                  child: (imgpro.base64EncodedString != null)
                      ? Image.memory(base64Decode(imgpro.base64EncodedString!))
                      : const SizedBox(),
                );
              },
            ),
            Expanded(
              flex: 8,
              child: Container(
                margin: const EdgeInsets.only(top: 8, left: 8, right: 8, bottom: 4),
                decoration: BoxDecoration(
                  border: Border.all(color: Theme.of(context).colorScheme.primary, width: 2),
                  borderRadius: BorderRadius.circular(8)
                ),
                child: GridView(
                  padding: EdgeInsets.all(screenWidth * 0.025),
                  physics: const BouncingScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: screenWidth * 0.05,
                    crossAxisSpacing: screenWidth * 0.05,
                    childAspectRatio: 1 / 1,
                  ),
                  children: [
                    ImagePickerGridItem(
                      title: 'جلو',
                      onCameraTap: () async {
                        imagesTabData.setFront((await _pickImage())!);
                      },
                      onGalleryTap: () async {
                        imagesTabData.setFront((await _pickImage(source: ImageSource.gallery))!);
                      },
                      onClearTap: () async {
                        imagesTabData.clearFront();
                      },
                    ),
                    ImagePickerGridItem(
                      title: 'عقب',
                      onCameraTap: () async {
                        imagesTabData.setRear((await _pickImage())!);
                      },
                      onGalleryTap: () async {
                        imagesTabData.setRear((await _pickImage(source: ImageSource.gallery))!);
                      },
                      onClearTap: () async {
                        imagesTabData.clearRear();
                      },
                    ),
                    ImagePickerGridItem(
                      title: 'راست',
                      onCameraTap: () async {
                        imagesTabData.setRight((await _pickImage())!);
                      },
                      onGalleryTap: () async {
                        imagesTabData.setRight((await _pickImage(source: ImageSource.gallery))!);
                      },
                      onClearTap: () async {
                        imagesTabData.clearRight();
                      },
                    ),
                    ImagePickerGridItem(
                      title: 'چپ',
                      onCameraTap: () async {
                        imagesTabData.setLeft((await _pickImage())!);
                      },
                      onGalleryTap: () async {
                        imagesTabData.setLeft((await _pickImage(source: ImageSource.gallery))!);
                      },
                      onClearTap: () async {
                        imagesTabData.clearLeft();
                      },
                    ),
                    ImagePickerGridItem(
                      title: 'کیلومتر',
                      onCameraTap: () async {
                        imagesTabData.setKilometer((await _pickImage())!);
                      },
                      onGalleryTap: () async {
                        imagesTabData.setKilometer((await _pickImage(source: ImageSource.gallery))!);
                      },
                      onClearTap: () async {
                        imagesTabData.clearKilometer();
                      },
                    ),
                    ImagePickerGridItem(
                      title: 'سریال',
                      onCameraTap: () async {
                        imagesTabData.setSerialNO((await _pickImage())!);
                      },
                      onGalleryTap: () async {
                        imagesTabData.setSerialNO((await _pickImage(source: ImageSource.gallery))!);
                      },
                      onClearTap: () async {
                        imagesTabData.clearSerialNO();
                      },
                    ),
                  ],
                ),
              ),
            ),
            // Expanded(
            //   flex: 2,
            //   child: Container(
            //     margin: const EdgeInsets.only(top: 4, left: 8, right: 8, bottom: 8),
            //     padding: const EdgeInsets.all(4),
            //     decoration: BoxDecoration(
            //         border: Border.all(color: Theme.of(context).colorScheme.primary, width: 2),
            //         borderRadius: BorderRadius.circular(8)
            //     ),
            //     child: Stack(
            //       alignment: Alignment.bottomCenter,
            //       children: [
            //         ListView.builder(
            //             scrollDirection: Axis.horizontal,
            //             itemCount: otherImageFiles.length,
            //             itemBuilder: (context, index) {
            //               return Container(
            //                 padding: const EdgeInsets.all(4),
            //                 width: screenWidth * 0.3,
            //                 height: double.infinity,
            //                 child: ImagePickerGridItem(
            //                   file: otherImageFiles[index],
            //                   title: 'سایر',
            //                   onCameraTap: () async {
            //                     otherImageFiles[index] = await _pickImage();
            //                     setState(() {});
            //                   },
            //                   onGalleryTap: () async {
            //                     otherImageFiles[index] = await _pickImage(source: ImageSource.gallery);
            //                     setState(() {});
            //                   },
            //                   onClearTap: () async {
            //                     otherImageFiles[index] = null;
            //                     setState(() {});
            //                   },
            //                 ),
            //               );
            //             }
            //         ),
            //         InkWell(
            //           onTap: () async {
            //             otherImageFiles.addAll(await _pickMultiImage());
            //             setState(() {});
            //           },
            //           child: Container(
            //             margin: const EdgeInsets.all(8),
            //             padding: const EdgeInsets.all(8),
            //             decoration: BoxDecoration(
            //               color: Theme.of(context).colorScheme.primary,
            //               shape: BoxShape.circle,
            //             ),
            //             child: const Icon(
            //               CupertinoIcons.add,
            //               color: Colors.white,
            //             ),
            //           ),
            //         )
            //       ],
            //     ),
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}

class ImagePickerGridItem extends StatelessWidget {
  const ImagePickerGridItem({
    required this.title,
    required this.onCameraTap,
    required this.onGalleryTap,
    required this.onClearTap,
    Key? key,
  }) : super(key: key);

  final String title;
  final void Function()? onCameraTap;
  final void Function()? onGalleryTap;
  final void Function()? onClearTap;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    double radius = 8;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        image: const DecorationImage(
          image: AssetImage(
            'assets/images/placeholder.png',
          ),
          fit: BoxFit.cover,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 4,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Stack(
          children: [
            Consumer<ImagesTabData>(
              builder: (context, imagesTabData, _) {
                String? encoded;
                switch (title) {
                  case 'جلو':
                    encoded = imagesTabData.front;
                    break;

                  case 'عقب':
                    encoded = imagesTabData.rear;
                    break;

                  case 'راست':
                    encoded = imagesTabData.right;
                    break;

                  case 'چپ':
                    encoded = imagesTabData.left;
                    break;

                  case 'سقف':
                    encoded = imagesTabData.roof;
                    break;

                  case 'کیلومتر':
                    encoded = imagesTabData.kilometer;
                    break;

                  case 'سریال':
                    encoded = imagesTabData.serialNo;
                    break;
                }
                return GridTile(
                  child: (encoded != null)
                    ? Image.memory(
                        base64Decode(encoded),
                        fit: BoxFit.fill,
                        width: double.infinity,
                        height: double.infinity,
                        errorBuilder: (context, error, stackTrace) {
                          return Image.asset(
                            'assets/images/placeholder.png',
                            fit: BoxFit.cover,
                          );
                        },
                      )
                    : const SizedBox(),

                  // child: (file != null)
                  //     ? Image.file(
                  //   file!,
                  //   fit: BoxFit.fill,
                  //   width: double.infinity,
                  //   height: double.infinity,
                  //   errorBuilder: (context, error, stackTrace) {
                  //     return Image.asset(
                  //       'assets/images/placeholder.png',
                  //       fit: BoxFit.cover,
                  //     );
                  //   },
                  // )
                  //     : const SizedBox(),
                );
              },
            ),
            Container(
              margin: const EdgeInsets.all(2),
              padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 8),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.2),
                borderRadius: BorderRadius.circular(8)
              ),
              child: Text(
                title,
                style: TextStyle(
                  fontFamily: 'Vazir',
                  fontSize: screenWidth * 0.03,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 4),
                decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.6),
                    borderRadius: const BorderRadius.only(bottomRight: Radius.circular(8), bottomLeft: Radius.circular(8))
                ),
                child: SingleChildScrollView(
                  child: Row(
                    children: [
                      IconButton(
                        padding: const EdgeInsets.all(0),
                        onPressed: onCameraTap,
                        icon: Icon(
                          CupertinoIcons.camera,
                          color: Theme.of(context).colorScheme.primary,
                          size: screenWidth * 0.048,
                        ),
                      ),
                      IconButton(
                        padding: const EdgeInsets.all(0),
                        onPressed: onGalleryTap,
                        icon: Icon(
                          CupertinoIcons.photo_on_rectangle,
                          color: Theme.of(context).colorScheme.primary,
                          size: screenWidth * 0.048,
                        ),
                      ),
                      IconButton(
                        padding: const EdgeInsets.all(0),
                        onPressed: onClearTap,
                        icon: Icon(
                          CupertinoIcons.clear,
                          color: Colors.red,
                          size: screenWidth * 0.048,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

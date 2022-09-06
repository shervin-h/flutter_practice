import 'dart:io';
import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:practice/src/screens/add/images_provider.dart';
import 'package:provider/provider.dart';

class ImagePickerScreen extends StatefulWidget {
  const ImagePickerScreen({Key? key}) : super(key: key);

  @override
  State<ImagePickerScreen> createState() => ImagePickerScreenState();
}

class ImagePickerScreenState extends State<ImagePickerScreen> {

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
  File? imageFileTest;

  File? imageFileFront;
  File? imageFileBack;
  File? imageFileRightSide;
  File? imageFileLeftSide;
  File? imageFileFuel;
  File? imageFileKilometer;

  List<File?> otherImageFiles = [];

  final ImagePicker _picker = ImagePicker();


  Future<File?> _pickImage({ImageSource source = ImageSource.camera}) async {
    File? imageFile;
    XFile? xFile = await _picker.pickImage(
      source: source,
      preferredCameraDevice: CameraDevice.rear,
    );
    if (xFile != null) {
      imageFile = File(xFile.path);
    }

    return imageFile;
  }


  Future<List<File>> _pickMultiImage() async {
    List<File> imageFiles = [];

    List<XFile>? xFiles = await _picker.pickMultiImage();

    if (xFiles != null && xFiles.isNotEmpty) {
      for (XFile xFile in xFiles) {
        imageFiles.add(File(xFile.path));
      }
    }
    return imageFiles;
  }


  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

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
                      file: imageFileTest,
                      title: 'تست',
                      onCameraTap: () async {
                        imageFileTest = await _pickImage();
                        setState(() {});
                      },
                      onGalleryTap: () async {
                        imageFileTest = await _pickImage(source: ImageSource.gallery);
                        setState(() {});
                      },
                      onClearTap: () async {
                        imageFileTest = null;
                        setState(() {});
                      },
                    ),
                    ImagePickerGridItem(
                      file: imageFileFront,
                      title: 'جلو',
                      onCameraTap: () async {
                        imageFileFront = await _pickImage();
                        setState(() {});
                      },
                      onGalleryTap: () async {
                        imageFileFront = await _pickImage(source: ImageSource.gallery);
                        setState(() {});
                      },
                      onClearTap: () async {
                        imageFileFront = null;
                        setState(() {});
                      },
                    ),
                    ImagePickerGridItem(
                      file: imageFileBack,
                      title: 'عقب',
                      onCameraTap: () async {
                        imageFileBack = await _pickImage();
                        setState(() {});
                      },
                      onGalleryTap: () async {
                        imageFileBack = await _pickImage(source: ImageSource.gallery);
                        setState(() {});
                      },
                      onClearTap: () async {
                        imageFileBack = null;
                        setState(() {});
                      },
                    ),
                    ImagePickerGridItem(
                      file: imageFileRightSide,
                      title: 'کنار راست',
                      onCameraTap: () async {
                        imageFileRightSide = await _pickImage();
                        setState(() {});
                      },
                      onGalleryTap: () async {
                        imageFileRightSide = await _pickImage(source: ImageSource.gallery);
                        setState(() {});
                      },
                      onClearTap: () async {
                        imageFileRightSide = null;
                        setState(() {});
                      },
                    ),
                    ImagePickerGridItem(
                      file: imageFileLeftSide,
                      title: 'کنار چپ',
                      onCameraTap: () async {
                        imageFileLeftSide = await _pickImage();
                        setState(() {});
                      },
                      onGalleryTap: () async {
                        imageFileLeftSide = await _pickImage(source: ImageSource.gallery);
                        setState(() {});
                      },
                      onClearTap: () async {
                        imageFileLeftSide = null;
                        setState(() {});
                      },
                    ),
                    ImagePickerGridItem(
                      file: imageFileKilometer,
                      title: 'کیلومتر',
                      onCameraTap: () async {
                        imageFileKilometer = await _pickImage();
                        setState(() {});
                      },
                      onGalleryTap: () async {
                        imageFileKilometer = await _pickImage(source: ImageSource.gallery);
                        setState(() {});
                      },
                      onClearTap: () async {
                        imageFileKilometer = null;
                        setState(() {});
                      },
                    ),
                    ImagePickerGridItem(
                      file: imageFileFuel,
                      title: 'سوخت',
                      onCameraTap: () async {
                        imageFileFuel = await _pickImage();
                        setState(() {});
                      },
                      onGalleryTap: () async {
                        imageFileFuel = await _pickImage(source: ImageSource.gallery);
                        setState(() {});
                      },
                      onClearTap: () async {
                        imageFileFuel = null;
                        setState(() {});
                      },
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                margin: const EdgeInsets.only(top: 4, left: 8, right: 8, bottom: 8),
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                    border: Border.all(color: Theme.of(context).colorScheme.primary, width: 2),
                    borderRadius: BorderRadius.circular(8)
                ),
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: otherImageFiles.length,
                        itemBuilder: (context, index) {
                          return Container(
                            padding: const EdgeInsets.all(4),
                            width: screenWidth * 0.3,
                            height: double.infinity,
                            child: ImagePickerGridItem(
                              file: otherImageFiles[index],
                              title: 'سایر',
                              onCameraTap: () async {
                                otherImageFiles[index] = await _pickImage();
                                setState(() {});
                              },
                              onGalleryTap: () async {
                                otherImageFiles[index] = await _pickImage(source: ImageSource.gallery);
                                setState(() {});
                              },
                              onClearTap: () async {
                                otherImageFiles[index] = null;
                                setState(() {});
                              },
                            ),
                          );
                        }
                    ),
                    InkWell(
                      onTap: () async {
                        otherImageFiles.addAll(await _pickMultiImage());
                        setState(() {});
                      },
                      child: Container(
                        margin: const EdgeInsets.all(8),
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primary,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          CupertinoIcons.add,
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ImagePickerGridItem extends StatelessWidget {
  const ImagePickerGridItem({
    required this.file,
    required this.title,
    required this.onCameraTap,
    required this.onGalleryTap,
    required this.onClearTap,
    Key? key,
  }) : super(key: key);

  final File? file;
  final String title;
  final void Function()? onCameraTap;
  final void Function()? onGalleryTap;
  final void Function()? onClearTap;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

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
            GridTile(
              child: (file != null)
                  ? Image.file(
                    file!,
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

import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerScreen extends StatefulWidget {
  const ImagePickerScreen({Key? key}) : super(key: key);

  @override
  State<ImagePickerScreen> createState() => ImagePickerScreenState();
}

class ImagePickerScreenState extends State<ImagePickerScreen> {
  File? imageFileFront;
  File? imageFileBack;
  File? imageFileRightSide;
  File? imageFileLeftSide;
  File? imageFileFuel;
  File? imageFileKilometer;

  final ImagePicker _picker = ImagePicker();

  Future<File?> _pickImage() async {
    File? imageFile;
    XFile? xFile = await _picker.pickImage(
      source: ImageSource.camera,
      preferredCameraDevice: CameraDevice.rear,
    );
    if (xFile != null) {
      imageFile = File(xFile.path);
    }
    return imageFile;
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(8),
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
                file: imageFileFront,
                title: 'جلو',
                onCameraTap: () async {
                  imageFileFront = await _pickImage();
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
                onClearTap: () async {
                  imageFileFuel = null;
                  setState(() {});
                },
              ),
            ],
          ),
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
    required this.onClearTap,
    Key? key,
  }) : super(key: key);

  final File? file;
  final String title;
  final void Function()? onCameraTap;
  final void Function()? onClearTap;

  @override
  Widget build(BuildContext context) {
    double radius = 8;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 4,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: GridTile(
          footer: GridTileBar(
            backgroundColor: Colors.black.withOpacity(0.6),
            title: Text(
              title,
              style: const TextStyle(
                fontFamily: 'Vazir',
                fontWeight: FontWeight.bold,
              ),
            ),
            trailing: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  padding: const EdgeInsets.all(0),
                  onPressed: onCameraTap,
                  icon: Icon(
                    CupertinoIcons.camera,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                IconButton(
                  padding: const EdgeInsets.all(0),
                  onPressed: onClearTap,
                  icon: const Icon(
                    CupertinoIcons.clear,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
          ),
          child: (file != null)
              ? Image.file(
                  file!,
                  fit: BoxFit.fill,
                  errorBuilder: (context, error, stackTrace) {
                    return Image.asset(
                      'assets/images/placeholder.png',
                      fit: BoxFit.cover,
                    );
                  },
                )
              : Image.asset(
                  'assets/images/placeholder.png',
                  fit: BoxFit.cover,
                ),
        ),
      ),
    );
  }
}

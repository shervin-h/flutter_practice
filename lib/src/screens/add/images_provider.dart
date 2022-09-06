import 'package:flutter/material.dart';

class ImagesProvider extends ChangeNotifier {
  String? _base64EncodedString;

  String? get base64EncodedString {
    return _base64EncodedString;
  }

  void setBase64EncodedString(String encodedString) {
    _base64EncodedString = encodedString;
    notifyListeners();
  }
}
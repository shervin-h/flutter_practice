import 'package:flutter/material.dart';

class ImagesTabData extends ChangeNotifier {
  String? _front;
  String? _rear;
  String? _right;
  String? _left;
  String? _roof;
  String? _kilometer;
  String? _serialNo;
  String? _statement;

  List<String?> _others = [];


  // getter
  String? get front {
    return _front;
  }

  String? get rear {
    return _rear;
  }

  String? get right {
    return _right;
  }

  String? get left {
    return _left;
  }

  String? get roof {
    return _roof;
  }

  String? get kilometer {
    return _kilometer;
  }

  String? get serialNo {
    return _serialNo;
  }

  String? get statement {
    return _statement;
  }

  List<String?> get others {
    return _others;
  }


  // setter
  void setFront(String front) {
    _front = front;
    notifyListeners();
  }

  void setRear(String rear) {
    _rear = rear;
    notifyListeners();
  }

  void setRight(String right) {
    _right = right;
    notifyListeners();
  }

  void setLeft(String left) {
    _left = left;
    notifyListeners();
  }

  void setRoof(String roof) {
    _roof = roof;
    notifyListeners();
  }

  void setKilometer(String kilometer) {
    _kilometer = _kilometer;
    notifyListeners();
  }

  void setSerialNO(String serialNo) {
    _serialNo = _serialNo;
    notifyListeners();
  }

  void setStatement(String statement) {
    _statement = statement;
    notifyListeners();
  }

  void setOthers(List<String> others) {
    _others = others;
    notifyListeners();
  }


  // clear
  void clearFront() {
    _front = null;
    notifyListeners();
  }

  void clearRear() {
    _rear = null;
    notifyListeners();
  }

  void clearRight() {
    _right = null;
    notifyListeners();
  }

  void clearLeft() {
    _left = null;
    notifyListeners();
  }

  void clearRoof() {
    _roof = null;
    notifyListeners();
  }

  void clearKilometer() {
    _kilometer = null;
    notifyListeners();
  }

  void clearSerialNO() {
    _serialNo = null;
    notifyListeners();
  }

  void clearStatement() {
    _statement = null;
    notifyListeners();
  }

  void clearOthers() {
    _others = [];
    notifyListeners();
  }

}
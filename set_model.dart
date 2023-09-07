import 'package:flutter/cupertino.dart';

class SetModel extends ChangeNotifier {
  double _size = 20.0;
  double _sliderValue = 10.0;

  double get getSize => _size;
  set setSize(double newSize) {
    _size = newSize;
    notifyListeners();
  }

  double get getSliderValue => _sliderValue;
  set setSliderValue(double newSlider) {
    _sliderValue = newSlider;
    notifyListeners();
  }
}

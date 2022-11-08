import 'package:flutter/material.dart';

class MainScreenProvider extends ChangeNotifier{
  int currentIndex = 0;

  void changeCurrentIndex(int index){
    currentIndex = index;
    notifyListeners();
  }
  
}
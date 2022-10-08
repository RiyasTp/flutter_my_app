import 'package:flutter/material.dart';
import 'package:my_app/features/counter/models/counter.dart';

class CounterProvider extends ChangeNotifier {
  Counter counter = Counter();
  void incrementCounter(){
    counter.count++;
    notifyListeners();
  }
}
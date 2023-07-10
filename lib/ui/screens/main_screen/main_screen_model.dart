import 'package:flutter/material.dart';

class MainScreenModel extends ChangeNotifier {
  double latitude = 0.0;
  double longitude = 0.0;
  double zoom = 0.0;
  void search(double latitude, double longitude, double zoom) {}
}

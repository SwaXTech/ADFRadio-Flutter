import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

abstract class ButtonController extends GetxController{
  IconData icon;
  void onPressed();
}
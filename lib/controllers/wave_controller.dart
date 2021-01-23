import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WaveController extends GetxController{

  var _opacity = 0.0.obs;
  get opacity => _opacity.value;

  fadeIn() => _opacity.value = 0.0;
  fadeOut() => _opacity.value = 1.0;

}
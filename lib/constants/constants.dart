import 'package:flutter/material.dart';

bool checkPlateform({required context}) {
  return Theme.of(context).platform == TargetPlatform.android;
}

Size getScreenSize({required context}) {
  return MediaQuery.of(context).size;
}
bool checkOrientation({required context}){
  return  MediaQuery.of(context).orientation == Orientation.portrait;
}

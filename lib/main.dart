import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:q8_task/app/resources/colors_resource.dart';
import 'package:q8_task/app/util/locator.dart';
import 'package:q8_task/view/base/base_view.dart';

void main() {
  //Start injecting dependencies
  inject();
  
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..indicatorType = EasyLoadingIndicatorType.threeBounce
    ..loadingStyle = EasyLoadingStyle.custom
    ..indicatorSize = 30.0
    ..radius = 10.0
    ..progressColor = lightPurple
    ..backgroundColor = Colors.white
    ..indicatorColor = lightPurple
    ..textColor = lightPurple
    ..maskColor = Colors.grey.withOpacity(0.3)
    ..maskType = EasyLoadingMaskType.custom
    ..userInteractions = false;

  runApp(
    const BaseView(),
  );
}

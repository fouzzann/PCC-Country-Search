import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:list_search_application/core/constant/const.dart';
import 'package:list_search_application/core/theme/app_theme.dart';
import 'package:list_search_application/service/thme_controller.dart';
import 'package:list_search_application/view/pages/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final ThemeController _themeController = Get.put(ThemeController());

  @override
  Widget build(BuildContext context) {
    return Obx(() => GetMaterialApp(
      title: AppConstants.appName,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: _themeController.isDarkMode.value ? ThemeMode.dark : ThemeMode.light,
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    ));
  }
}
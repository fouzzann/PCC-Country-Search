import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:list_search_application/core/constant/const.dart';
import 'package:list_search_application/service/country_controller.dart';
import 'package:list_search_application/service/thme_controller.dart';
import 'package:list_search_application/view/widgets/country_list.dart';
import 'package:list_search_application/view/widgets/search_bar_widget.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final CountryController _countryController = Get.put(CountryController());
  final ThemeController _themeController = Get.find<ThemeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppConstants.appName),
        actions: [
          IconButton(
            icon: Obx(() => Icon(
              _themeController.isDarkMode.value ? Icons.light_mode : Icons.dark_mode,
            )),
            onPressed: () => _themeController.toggleTheme(),
          ),
        ],
      ),
      body: Column(
        children: [
          SearchBarWidget(controller: _countryController),
          Expanded(
            child: CountryListWidget(controller: _countryController),
          ),
        ],
      ),
    );
  }
}
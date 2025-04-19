import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:list_search_application/core/constant/const.dart';
import 'package:list_search_application/service/country_controller.dart';

class SearchBarWidget extends StatelessWidget {
  final CountryController controller;

  const SearchBarWidget({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: TextField(
        controller: controller.searchController,
        decoration: InputDecoration(
          hintText: AppConstants.searchHint,
          prefixIcon: const Icon(Icons.search),
          suffixIcon: Obx(() => controller.isSearching.value
              ? IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: controller.clearSearch,
                )
              : const SizedBox.shrink()),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        onChanged: controller.filterCountries,
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:list_search_application/core/constant/const.dart';
import 'package:list_search_application/model/country_model.dart';
import 'package:list_search_application/service/country_controller.dart';

class CountryListWidget extends StatelessWidget {
  final CountryController controller;

  const CountryListWidget({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.filteredCountries.isEmpty) {
        return const Center(
          child: Text(AppConstants.noResultsFound),
        );
      }

      return ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        itemCount: controller.filteredCountries.length,
        itemBuilder: (context, index) {
          Country country = controller.filteredCountries[index];
          return _buildCountryItem(context, country);
        },
      );
    });
  }

  Widget _buildCountryItem(BuildContext context, Country country) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 6),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        leading: CircleAvatar(
          child: Text(
            country.code,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        title: Text(
          country.name,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        onTap: () {
          // Implement country selection functionality if needed
          Get.snackbar(
            'Selected Country',
            'You selected ${country.name}',
            snackPosition: SnackPosition.BOTTOM,
            duration: const Duration(seconds: 2),
          );
        },
      ),
    );
  }
}
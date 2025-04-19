import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:list_search_application/data/country_service.dart';
import 'package:list_search_application/model/country_model.dart';

class CountryController extends GetxController {
  final CountryService _countryService = CountryService();
  final TextEditingController searchController = TextEditingController();
  
  RxList<Country> countries = <Country>[].obs;
  RxList<Country> filteredCountries = <Country>[].obs;
  RxBool isSearching = false.obs;

  @override
  void onInit() {
    super.onInit();
    loadCountries();
    setupSearchListener();
  }

  @override
  void onClose() {
    searchController.dispose();
    super.onClose();
  }

  void loadCountries() {
    countries.value = _countryService.getCountries();
    filteredCountries.value = countries;
  }

  void setupSearchListener() {
    searchController.addListener(() {
      filterCountries(searchController.text);
    });
  }

  void filterCountries(String query) {
    if (query.isEmpty) {
      filteredCountries.value = countries;
      isSearching.value = false;
    } else {
      isSearching.value = true;
      filteredCountries.value = countries
          .where((country) => country.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
  }

  void clearSearch() {
    searchController.clear();
    filterCountries('');
  }
}
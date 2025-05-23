# Flutter Country Search App

A modern Flutter application that displays a searchable list of countries, built with GetX state management and MVVM architecture.

## 📋 Features

- Real-time search functionality
- Dark and light theme support
- 50 countries with country codes
- MVVM architecture implementation
- GetX for reactive state management

## 🚀 Project Structure

```
lib/
├── core/                           # Core components
│   ├── constants/                  # Application constants
│   │   └── app_constants.dart
│   └── theme/                      # Theme configuration
│       ├── app_colors.dart         # Color definitions
│       └── app_theme.dart          # Theme data
│
├── data/                           # Data layer
│   └── country_service.dart        # Country data provider
│
├── model/                          # Data models
│   └── country_model.dart          # Country model class
│
├── view/                           # UI components
│   ├── pages/                      # Full pages
│   │   └── home_page.dart          # Main screen
│   └── widgets/                    # Reusable widgets
│       ├── country_list_widget.dart
│       └── search_bar_widget.dart
│
├── viewmodel/                      # Controllers/ViewModels
│   ├── country_controller.dart     # Country logic
│   └── theme_controller.dart       # Theme logic
│
└── main.dart                       # App entry point
```

## 🛠️ Setup & Installation

1. **Prerequisites**
   - Flutter SDK (latest stable version)
   - Dart SDK
   - Android Studio / VS Code with Flutter plugins

2. **Installation**
   ```bash
   # Clone the repository
   git clone https://github.com/yourusername/country_search_app.git

   # Navigate to project directory
   cd country_search_app

   # Install dependencies
   flutter pub get

   # Run the app
   flutter run
   ```

## 📱 Usage

- **Search**: Type in the search bar to filter countries in real-time
- **Theme Toggle**: Tap the theme icon in the app bar to switch between light and dark mode
- **Country Selection**: Tap on any country to view selection confirmation

## 🧩 Key Components

### CountryController

Manages the list of countries and search functionality:

```dart
class CountryController extends GetxController {
  // Manages country data and search functionality
  final TextEditingController searchController = TextEditingController();
  RxList<Country> countries = <Country>[].obs;
  RxList<Country> filteredCountries = <Country>[].obs;
  
  void filterCountries(String query) {
    // Real-time filtering logic
  }
}
```

### ThemeController

Handles theme switching:

```dart
class ThemeController extends GetxController {
  // Manages application theme state
  RxBool isDarkMode = false.obs;
  
  void toggleTheme() {
    isDarkMode.value = !isDarkMode.value;
  }
}
```

## 📚 Dependencies

```yaml
dependencies:
  flutter:
    sdk: flutter
  get: ^4.6.5        # State management
  cupertino_icons: ^1.0.5
```

## 🔧 Architecture

This project follows the MVVM (Model-View-ViewModel) architecture:

- **Model**: Data classes and services
- **View**: UI components (widgets and screens)
- **ViewModel**: Controllers that handle business logic

## 📄 License

This project is licensed under the MIT License - see the LICENSE file for details.
```

This README provides a clean, organized overview of your Country Search app with:

- A clear feature list
- Well-structured project overview showing the MVVM architecture
- Setup and installation instructions
- Component explanations with code examples
- Dependencies section
- Architecture explanation

The structure is more readable and developer-friendly, making it easy to understand the project at a glance.
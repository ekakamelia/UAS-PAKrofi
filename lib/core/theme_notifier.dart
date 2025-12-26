import 'package:flutter/material.dart';

// Simple theme notifier using ValueNotifier
class ThemeNotifier extends ValueNotifier<ThemeMode> {
  ThemeNotifier() : super(ThemeMode.light);
  
  void setLightMode() {
    value = ThemeMode.light;
  }
  
  void setDarkMode() {
    value = ThemeMode.dark;
  }
  
  void setSystemMode() {
    value = ThemeMode.system;
  }
  
  bool get isDarkMode => value == ThemeMode.dark;
  bool get isLightMode => value == ThemeMode.light;
  bool get isSystemMode => value == ThemeMode.system;
}

// Global theme notifier instance
final themeNotifier = ThemeNotifier();

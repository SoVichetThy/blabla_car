// import 'package:flutter/material.dart';
// import 'screens/ride_pref/ride_pref_screen.dart';
// import 'theme/theme.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       theme: appTheme,
//       home: Scaffold(body: RidePrefScreen()),
//     );
//   }
// }
// Observer
abstract class WeatherListener {
  void onTemperatureChanged(double temperature);
}

// Subject
class WeatherStation {
  double _temperature = 0.0;
  final List<WeatherListener> _listeners = [];

  void addListener(WeatherListener listener) {
    _listeners.add(listener);
  }

  void setTemperature(double newTemperature) {
    _temperature = newTemperature;
    _notifyListeners();
  }

  void _notifyListeners() {
    for (var listener in _listeners) {
      listener.onTemperatureChanged(_temperature);
    }
  }
}

class TVChannel extends WeatherListener {
  @override
  void onTemperatureChanged(double temperature) {
    print("TV program -* Breaking new  - New temp is $temperature");
  }
}

// Observers
class PhoneDisplay implements WeatherListener {
  @override
  void onTemperatureChanged(double temperature) {
    print("📱 Phone Display: Temperature updated to $temperature°C");
  }
}

class TVDisplay implements WeatherListener {
  @override
  void onTemperatureChanged(double temperature) {
    print("📺 TV Display: Temperature updated to $temperature°C");
  }
}

// Tests
void main() {
  WeatherStation weatherStation = WeatherStation(); //observer

  PhoneDisplay phoneDisplay = PhoneDisplay();
  TVDisplay tvDisplay = TVDisplay();
  TVChannel myTV = new TVChannel();

  // Register observers
  weatherStation.addListener(myTV);
  weatherStation.addListener(phoneDisplay); 
  weatherStation.addListener(tvDisplay);

  // Update temperature
  // print("🌡 Setting temperature to 25°C...");
  // weatherStation.setTemperature(25.0);

  // print("🌡 Setting temperature to 30°C...");
  // weatherStation.setTemperature(30.0);
}
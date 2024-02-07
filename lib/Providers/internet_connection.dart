import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

class InternetConnectionProvider extends ChangeNotifier {
  bool _isConnected = false;
  late Connectivity _connectivity;

  bool get isConnected => _isConnected;

  void updateConnectionStatus(bool isConnected) {
    if (_isConnected != isConnected) {
      _isConnected = isConnected;
      notifyListeners();
    }
  }

  InternetConnectionProvider() {
    _connectivity = Connectivity();
    _isConnected = false;

    // Subscribe to connectivity changes
    _connectivity.onConnectivityChanged.listen((result) {
      _isConnected = result != ConnectivityResult.none;
      notifyListeners();
    });

    // Initial check for connectivity
    checkInternetConnection();
  }

  Future<void> checkInternetConnection() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    bool isConnected = (connectivityResult != ConnectivityResult.none);
    updateConnectionStatus(isConnected);
  }
}

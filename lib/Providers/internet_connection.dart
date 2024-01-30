import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';

class InternetConnectionProvider extends ChangeNotifier {
  bool _isConnected = true;

  bool get isConnected => _isConnected;

  void updateConnectionStatus(bool isConnected) {
    if (_isConnected != isConnected) {
      _isConnected = isConnected;
      notifyListeners();
    }
  }

  Future<void> checkInternetConnection() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    bool isConnected = (connectivityResult != ConnectivityResult.none);
    updateConnectionStatus(isConnected);
  }
}

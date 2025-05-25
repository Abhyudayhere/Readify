import 'dart:async'; // Import for StreamSubscription
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/services.dart'; // Import for PlatformException
import 'package:get/get.dart';
import '../loader/loaders.dart';

class NetworkManager extends GetxController {
  static NetworkManager get instance => Get.find();

  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<List<ConnectivityResult>> _connectivitySubscription;

  @override
  void onInit() {
    super.onInit();
    _connectivitySubscription = _connectivity.onConnectivityChanged.listen((List<ConnectivityResult> results) {
      _updateConnectionStatus(results);
    });
  }

  Future<void> _updateConnectionStatus(List<ConnectivityResult> results) async {
    // Check if none of the connectivity options are available
    if (results.isEmpty || results.contains(ConnectivityResult.none)) {
      ReadifyLoaders.warningSnackBar(title: 'No Internet connection');
    }
  }

  Future<bool> isConnected() async {
    try {
      final results = await _connectivity.checkConnectivity();
      return results.isNotEmpty && !results.contains(ConnectivityResult.none);
    } on PlatformException catch (_) {
      return false;
    }
  }

  @override
  void onClose() {
    _connectivitySubscription.cancel(); // Cleanup first
    super.onClose(); // Then call super
  }
}

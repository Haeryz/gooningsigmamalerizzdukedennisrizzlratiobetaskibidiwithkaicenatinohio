import 'dart:ffi';
import 'dart:math';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:gooningsigmamalerizzdukedennisrizzlratiobetaskibidiwithkaicenatinohio/app/modules/connection/views/connection_view.dart';
import 'package:gooningsigmamalerizzdukedennisrizzlratiobetaskibidiwithkaicenatinohio/app/modules/home/views/home_view.dart';

class ConnectionController extends GetxController {
    final Connectivity _connectivity = Connectivity();
  final Dio _dio = Dio();

  // Observable list to store fetched articles
  var articles = [].obs;

  // Observable to track connection status
  var isConnected = false.obs;

  // Observable to track loading state
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();

    // Listen for connectivity changes
    _connectivity.onConnectivityChanged.listen((connectivityResult) {
      _updateConnectionStatus(connectivityResult.first);
    });

    // Initial connectivity check
    _checkInitialConnectivity();
  }

  void _updateConnectionStatus(ConnectivityResult connectivityResult) {
    if (connectivityResult == ConnectivityResult.none) {
      isConnected.value = false;
      isLoading.value = false; // Stop loading when no internet
      if (Get.currentRoute != '/NoConnectionView') {
        Get.offAll(() => const ConnectionView()); // Show the "No Connection" screen
      }
    } else {
      isConnected.value = true;
      if (Get.currentRoute == '/NoConnectionView') {
        Get.offAll(() => const HomeView()); // Redirect to the home page on successful connection
      }
      fetchNews(); // Attempt to fetch the news if connected
    }
  }

  Future<void> _checkInitialConnectivity() async {
    final connectivityResult = await _connectivity.checkConnectivity();
    _updateConnectionStatus(connectivityResult.first);
  }

  // Method to fetch news articles
  Future<void> fetchNews() async {
    if (!isConnected.value) return; // No need to fetch news if there's no connection

    try {
      isLoading.value = true; // Set loading state to true
      final response = await _dio.get(
        'https://newsapi.org/v2/top-headlines',
        queryParameters: {
          'country': 'us', // Example: Fetch news for the US
          'apiKey': 'API KEY', // Replace with your API key
        },
      );

      if (response.statusCode == 200) {
        articles.value = response.data['articles'] ?? [];
      } else {
        Get.snackbar('Error', 'Failed to fetch news: ${response.statusCode}');
      }
    } catch (e) {
      Get.snackbar('Error', 'Error fetching news: $e');
    } finally {
      isLoading.value = false; // Stop loading once the fetch is complete
    }
  }
}

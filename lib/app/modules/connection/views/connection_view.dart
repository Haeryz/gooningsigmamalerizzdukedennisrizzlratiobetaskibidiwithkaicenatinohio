import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/connection_controller.dart';

class ConnectionView extends GetView<ConnectionController> {
  const ConnectionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ConnectionView'),
        centerTitle: true,
      ),
      body: Obx(() {
        if (!controller.isConnected.value) {
          // If no internet connection
          return const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.wifi_off_outlined,
                  size: 100,
                  color: Colors.red,
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'No internet connection',
                  style: TextStyle(fontSize: 24),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Please check your internet connection',
                  style: TextStyle(fontSize: 16),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          );
        } else if (controller.isLoading.value) {
          // If fetching news (loading)
          return const Center(child: CircularProgressIndicator());
        } else if (controller.articles.isEmpty) {
          // If no articles fetched
          return const Center(
            child: Text('No news available'),
          );
        } else {
          // If articles are available
          return ListView.builder(
            itemCount: controller.articles.length,
            itemBuilder: (context, index) {
              final article = controller.articles[index];
              return ListTile(
                title: Text(article['title']),
                subtitle: Text(article['description'] ?? ''),
              );
            },
          );
        }
      }),
    );
  }
}

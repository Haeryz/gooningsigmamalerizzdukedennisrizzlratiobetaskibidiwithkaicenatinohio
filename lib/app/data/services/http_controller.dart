import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

import '../models/article.dart'; // Assuming your model structure remains the same

class HttpController extends GetxController {
  static const String _baseUrl = 'https://my-json-server.typicode.com/Fallid/codelab-api/';

  RxList<Article> articles = RxList<Article>([]);
  RxBool isLoading = false.obs;

  @override
  void onInit() async {
    await fetchArticles();
    super.onInit();
  }

  Future<void> fetchArticles() async {
    try {
      isLoading.value = true;
      final response = await http.get(Uri.parse('${_baseUrl}db'));

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        final articlesResult = Nopal.fromJson(jsonData);
        articles.value = articlesResult.articles;
      } else {
        print('Request failed with status: ${response.statusCode}');
      }
    } catch (e) {
      print('An error occurred: $e');
    } finally {
      isLoading.value = false;
    }
  }
}

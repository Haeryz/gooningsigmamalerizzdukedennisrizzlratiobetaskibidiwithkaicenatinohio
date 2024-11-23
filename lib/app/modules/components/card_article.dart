import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../data/models/article.dart'; // Adjust the path if necessary

class CardArticle extends StatelessWidget {
  final Article article;
  const CardArticle({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 15),
      child: ListTile(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        leading: Hero(
          tag: article.urlToImage ?? article.title, // Use a fallback tag
          child: SizedBox(
            width: 100,
            height: 100,
            child: article.urlToImage.isNotEmpty
                ? Image.network(
                    article.urlToImage,
                    fit: BoxFit.cover,
                  )
                : Container(
                    color: Colors.grey,
                    child: const Center(
                      child: Text(
                        'No Image',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
          ),
        ),
        title: Text(
          article.title,
        ),
        subtitle: Text(article.author.isNotEmpty ? article.author : 'Unknown'),
        onTap: () {
          Get.toNamed('/article_details', arguments: article); // Adjust your route if necessary
        },
      ),
    );
  }
}

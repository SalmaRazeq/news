import 'package:flutter/material.dart';
import 'package:news_app/data/api/api_manager.dart';
import 'package:news_app/data/model/articles_response/Articles.dart';
import 'package:news_app/data/model/sources_response/sources.dart';
import 'package:news_app/presentation/screens/home/tabs/news/Article_item.dart';

class ArticleListWidget extends StatelessWidget {
   ArticleListWidget({super.key, required this.source});

  Source source;
  late String searchText;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(future: ApiManager.getArticles(source.id ?? '',),
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting){
            return const Center(child: CircularProgressIndicator(),);
          }
          if(snapshot.data?.status == 'error' || snapshot.hasError){
            return Text(snapshot.data?.message ?? 'Check internet connection');
          }
          List<Article> articles = snapshot.data?.articles ?? [];
          return Expanded(child: ListView.builder(itemBuilder: (context, index) =>
              ArticleItem(article: articles[index]),itemCount: articles.length,));
        },
    );
  }
}

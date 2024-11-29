import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/utils/app_style.dart';
import 'package:news_app/core/utils/routes_manager.dart';
import 'package:news_app/data/model/articles_response/Articles.dart';
import 'package:news_app/data_model/category_DM.dart';
import 'package:news_app/presentation/screens/home/article_details/article_details.dart';

class ArticleItem extends StatelessWidget {
  ArticleItem({super.key, required this.article});
  Article article;
  
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: REdgeInsets.symmetric(vertical: 18,horizontal: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          InkWell(
            onTap: (){
              Navigator.pushNamed(context, RoutesManager.articlesDetails,
                  arguments: article);
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: CachedNetworkImage(
                imageUrl: article.urlToImage ?? '',
                placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
          ),
          SizedBox(height: 6.h,),

          Text(article.title ?? '', style: AppStyle.articleTitle,),
          SizedBox(height: 4.h,),
          Text(article.description ?? '', style: AppStyle.articleDesc,),
          SizedBox(height: 6.h,),
          Text(article.publishedAt ?? '', style: AppStyle.articleTitle.copyWith(fontSize: 14), textAlign: TextAlign.end, )
        ],
      ),
    );
  }
}

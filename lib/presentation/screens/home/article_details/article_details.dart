import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/utils/assets_manager.dart';
import 'package:news_app/core/utils/color_manager.dart';
import 'package:news_app/data/model/articles_response/Articles.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/utils/app_style.dart';

class ArticleDetails extends StatelessWidget {
  ArticleDetails({super.key});

  @override
  Widget build(BuildContext context) {
    Article article = ModalRoute.of(context)?.settings.arguments as Article;
    return Container(
      decoration: const BoxDecoration(
        image:  DecorationImage(
          image: AssetImage(AssetsManager.pattern),
        ),
          color: ColorsManager.white
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text(article.title ?? '', style: AppStyle.appBarTile,),
        ),
        body: Container(
          margin: REdgeInsets.symmetric(vertical: 18, horizontal: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(article.urlToImage ?? ''),
              ),

              SizedBox(height: 6.h,),
              Text(
                article.title ?? '',
                style: AppStyle.articleTitle,),
              SizedBox(height: 4.h,),
              Text(
                article.description ?? '',
                style: AppStyle.articleDesc,),
              SizedBox(height: 6.h,),
              Text(
                article.publishedAt ?? '',
                style: AppStyle.articleTitle.copyWith(fontSize: 14.sp),
                textAlign: TextAlign.end,
              ),
              SizedBox(height: 15.h,),

              Card(
                color: ColorsManager.white,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.r)),
                child: Padding(
                  padding: REdgeInsets.symmetric(vertical: 20, horizontal: 12),
                  child: Column(
                    children: [
                      Text(
                          article.content ?? '',
                          style: AppStyle.articleDesc.copyWith(fontWeight: FontWeight.w300, fontSize: 14.sp)
                      ),
                      SizedBox(height: 40.h,),
                      Align(
                        alignment: Alignment.bottomRight,
                          child: TextButton(onPressed: () async{
                            final Uri url = Uri.parse(article.url!);
                            await launchUrl(url, mode: LaunchMode.externalApplication);
                          },
                            child: Text('View Full Article', style: AppStyle.viewArticle,),)),
                    ],
                  ),
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}

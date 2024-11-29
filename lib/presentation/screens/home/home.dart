import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/utils/app_style.dart';
import 'package:news_app/core/utils/assets_manager.dart';
import 'package:news_app/core/utils/color_manager.dart';
import 'package:news_app/core/utils/string_manager.dart';
import 'package:news_app/data/api/api_manager.dart';
import 'package:news_app/data/model/articles_response/Articles.dart';
import 'package:news_app/data_model/category_DM.dart';
import 'package:news_app/presentation/screens/home/tabs/categories_details/categories_details.dart';
import 'package:news_app/presentation/screens/home/tabs/categories_tab/categories-tab.dart';
import 'package:news_app/presentation/screens/home/tabs/news/Article_item.dart';
import 'package:news_app/presentation/screens/home/tabs/settings_tab/settings_tab.dart';
import 'package:news_app/presentation/screens/home/widget/home_drawer/home_drawer.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Widget selectedWidget;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedWidget = CategoriesTab(
      onCategoryItemClicked: onCategoryClicked,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AssetsManager.pattern),
          ),
          color: ColorsManager.white),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            StringsManager.appTitle,
            style: AppStyle.appBarTile,
          ),
          actions: [
            Padding(
              padding: REdgeInsets.all(8),
              child: IconButton(
                onPressed: () {
                  showSearch(
                      context: context, delegate: CustumSearchDelegate());
                },
                icon: const Icon(Icons.search),
              ),
            )
          ],
        ),
        drawer: HomeDrawer(
          onDrawerItemClicked: onDrawerItemClicked,
        ),
        body: selectedWidget,
      ),
    );
  }

  void onCategoryClicked(CategoryDM category) {
    selectedWidget = CategoriesDetails(categoryDM: category);
    setState(() {});
  }

  onDrawerItemClicked(MenuItem item) {
    switch (item) {
      case MenuItem.categories:
        {
          selectedWidget = CategoriesTab(
            onCategoryItemClicked: onCategoryClicked,
          );
        }
      case MenuItem.settings:
        {
          selectedWidget = SettingsTab();
        }
    }
    Navigator.pop(context);
    setState(() {});
  }
}

class CustumSearchDelegate extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: const Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder(
      future: ApiManager.search(query),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (snapshot.data?.status == 'error' || snapshot.hasError) {
          return Text(snapshot.data?.message ?? 'Check internet connection');
        }
        List<Article> articles = snapshot.data?.articles ?? [];
        return Expanded(
            child: ListView.builder(
          itemBuilder: (context, index) =>
              ArticleItem(article: articles[index]),
          itemCount: articles.length,
        ));
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return FutureBuilder(
      future: ApiManager.search(query),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (snapshot.data?.status == 'error' || snapshot.hasError) {
          return Text(snapshot.data?.message ?? 'Check internet connection');
        }
        List<Article> articles = snapshot.data?.articles ?? [];
        return Expanded(
            child: ListView.builder(
          itemBuilder: (context, index) =>
              ArticleItem(article: articles[index]),
          itemCount: articles.length,
        ));
      },
    );
  }

  @override
  ThemeData appBarTheme(BuildContext context) {
    return ThemeData(
      appBarTheme: const AppBarTheme(
        backgroundColor: ColorsManager.green,
        toolbarHeight: 67,
        iconTheme: IconThemeData(
          color: ColorsManager.white,
          size: 34,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(50),
              bottomRight: Radius.circular(50)),
        ),
      ),
      inputDecorationTheme: const InputDecorationTheme(
        hintStyle: TextStyle(color: ColorsManager.white),
        focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: ColorsManager.white)),
      ),

    );
  }
}

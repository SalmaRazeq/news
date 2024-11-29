import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/data/model/sources_response/sources.dart';
import 'package:news_app/presentation/screens/home/tabs/categories_tab/category_widget/widget/source_widget/source_item_widget.dart';
import 'package:news_app/presentation/screens/home/tabs/news/article_list_widget.dart';

class SourcesWidget extends StatefulWidget {
  SourcesWidget({super.key, required this.sources});

  List<Source> sources;

  @override
  State<SourcesWidget> createState() => _SourcesWidgetState();
}

class _SourcesWidgetState extends State<SourcesWidget> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DefaultTabController(
          length: widget.sources.length,
          child: TabBar(
            tabAlignment: TabAlignment.start,
            labelPadding: REdgeInsets.all(8),
            onTap: (index) {
              selectedIndex = index;
              setState(() {});
            },
            indicatorColor: Colors.transparent,
            dividerColor: Colors.transparent,
            isScrollable: true,
            tabs: widget.sources
                .map(
                  (source) => SourceItemWidget(
                    source: source,
                    isSelected: widget.sources.indexOf(source) == selectedIndex,
                  ),
                )
                .toList(),
          ),
        ),
        ArticleListWidget(source: widget.sources[selectedIndex]),
      ],
    );
  }
}

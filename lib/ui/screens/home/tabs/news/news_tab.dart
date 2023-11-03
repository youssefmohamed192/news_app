import 'package:flutter/material.dart';
import 'package:news_app/data/api/api_manager.dart';
import 'package:news_app/data/model/sources_response.dart';
import 'package:news_app/utils/app_colors.dart';
import 'package:news_app/utils/app_theme.dart';

class NewsTab extends StatefulWidget {
  const NewsTab({super.key});

  @override
  State<NewsTab> createState() => _NewsTabState();
}

class _NewsTabState extends State<NewsTab> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: ApiManager.getSources(),
        builder: (context, snapShot) {
          if (snapShot.hasData) {
            return buildTabs(snapShot.data!);
          } else if (snapShot.hasError) {
            return Text(snapShot.error.toString());
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        });
  }

  Widget buildTabs(List<Source> list) {
    return DefaultTabController(
      length: list.length,
      child: Column(
        children: [
          const SizedBox(
            height: 14,
          ),
          TabBar(
            isScrollable: true,
            indicatorColor: AppColors.transparent,
            onTap: (index) {
              currentIndex = index;
              setState(() {});
            },
            tabs: list
                .map((source) => buildTabsWidget(source.name ?? "", context,
                    currentIndex == list.indexOf(source)))
                .toList(),
          ),
          Expanded(
            child: TabBarView(
                children: list
                    .map((source) => Container(
                          color: Colors.amber,
                        ))
                    .toList()),
          )
        ],
      ),
    );
  }

  Widget buildTabsWidget(String name, BuildContext context, bool isSelected) {
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        decoration: BoxDecoration(
            color: isSelected ? AppColors.primary : AppColors.white,
            border: Border.all(
                style: BorderStyle.solid, width: 2, color: AppColors.primary),
            borderRadius: BorderRadius.circular(26)),
        child: Text(
          name,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
              color: isSelected ? AppColors.white : AppColors.primary),
        ));
  }
}

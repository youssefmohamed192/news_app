import 'package:flutter/material.dart';
import 'package:news_app/data/model/category_dm.dart';
import 'package:news_app/ui/screens/home/tabs/Categories/categories_tab.dart';
import 'package:news_app/ui/screens/home/tabs/news/news_tab.dart';
import 'package:news_app/ui/screens/home/tabs/settings/settings_tab.dart';
import 'package:news_app/utils/app_assets.dart';
import 'package:news_app/utils/app_colors.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "home";

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Widget currentTab;

  @override
  void initState() {
    super.initState();
    currentTab = CategoriesTab(onCategoryClick: onCategoryClick);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        if (currentTab is! CategoriesTab) {
          currentTab = CategoriesTab(
            onCategoryClick: onCategoryClick,
          );
          setState(() {});
          return Future.value(false);
        } else {
          return Future.value(true);
        }
      },
      child: Scaffold(
        drawer: buildDrawer(context),
        appBar: AppBar(
          title: const Text("News App"),
        ),
        body: Stack(
          children: [
            Image.asset(AppAssets.patternImage,
                fit: BoxFit.cover, width: double.infinity),
            currentTab,
          ],
        ),
      ),
    );
  }

  onCategoryClick(CategoryDM categoryDM) {
    currentTab = NewsTab(categoryId: categoryDM.id);
    setState(() {});
  }

  Widget buildDrawer(BuildContext context) => Drawer(
        child: Column(
          children: [
            DrawerHeader(
                decoration: const BoxDecoration(color: AppColors.primary),
                child: Center(
                    child: Text(
                  "News App!",
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(color: AppColors.white),
                ))),
            buildDrawerRow(Icons.list, "Categories", () {
              currentTab = CategoriesTab(
                onCategoryClick: onCategoryClick,
              );
              setState(() {});
              Navigator.pop(context);
            }),
            buildDrawerRow(Icons.settings, "Settings", () {
              currentTab = SettingsTab();
              setState(() {});
              Navigator.pop(context);
            }),
          ],
        ),
      );

  Widget buildDrawerRow(IconData iconData, String title, Function onClick) {
    return InkWell(
      onTap: () => onClick(),
      child: Row(
        children: [
          const SizedBox(
            width: 16,
          ),
          Icon(iconData, color: AppColors.black, size: 40),
          const SizedBox(
            width: 16,
          ),
          Text(
            title,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ],
      ),
    );
  }
}

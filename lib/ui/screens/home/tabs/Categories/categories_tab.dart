import 'package:flutter/material.dart';
import 'package:news_app/data/model/category_dm.dart';
import 'package:news_app/utils/app_colors.dart';
import 'package:news_app/widget/category_widget.dart';

class CategoriesTab extends StatelessWidget {
  final Function(CategoryDM) onCategoryClick;

  const CategoriesTab({super.key, required this.onCategoryClick});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 34),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 34),
          Text(
            "Pick your category",
            textAlign: TextAlign.start,
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(color: AppColors.accent, fontWeight: FontWeight.bold),
          ),
          Text(
            "of interest",
            textAlign: TextAlign.start,
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(color: AppColors.accent),
          ),
          const SizedBox(height: 24),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: GridView.builder(
                  itemCount: CategoryDM.categories.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 24,
                      mainAxisSpacing: 20,
                      childAspectRatio: 0.8 / 1),
                  itemBuilder: (context, index) {
                    return InkWell(
                        onTap: () {
                          onCategoryClick(CategoryDM.categories[index]);
                        },
                        child: CategoryWidget(
                          categoryDM: CategoryDM.categories[index],
                        ));
                  }),
            ),
          )
        ],
      ),
    );
  }
}

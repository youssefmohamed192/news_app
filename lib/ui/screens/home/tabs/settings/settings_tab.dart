import 'package:flutter/material.dart';
import 'package:news_app/utils/app_colors.dart';

class SettingsTab extends StatelessWidget {
  const SettingsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * .07),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: 26,
          ),
          Text(
            "Language",
            textAlign: TextAlign.start,
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 16,),
          buildMyRow("English", context)
        ],
      ),
    );
  }

  Widget buildMyRow(String language, BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(left: 18),
      decoration: BoxDecoration(
          color: AppColors.white,
          border: Border.all(width: 1, color: AppColors.primary)),
      child: Row(
        children: [
          Text(language,style: Theme.of(context).textTheme.titleLarge!.copyWith(color: AppColors.primary)),
          const Spacer(),
          const Icon(Icons.keyboard_arrow_down,color: AppColors.primary,size: 26),
        ],
      ),
    );
  }
}

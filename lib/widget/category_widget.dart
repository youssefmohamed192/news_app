import 'package:flutter/material.dart';
import 'package:news_app/data/model/category_dm.dart';

class CategoryWidget extends StatelessWidget {
  final CategoryDM categoryDM;
  final Radius radius = const Radius.circular(16);

  const CategoryWidget({super.key, required this.categoryDM});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: categoryDM.backgroundColor,
          borderRadius: BorderRadius.only(
              topLeft: radius,
              topRight: radius,
              bottomLeft: categoryDM.isLeft ? Radius.zero : radius,
              bottomRight: categoryDM.isLeft ? radius : Radius.zero)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(categoryDM.imagePath,
              height: MediaQuery.of(context).size.height * .14),
          const SizedBox(height: 6),
          Text(categoryDM.title,style: TextStyle(color: Colors.white),),

        ],
      ),
    );
  }
}

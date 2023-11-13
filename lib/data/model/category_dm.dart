import 'package:flutter/material.dart';
import 'package:news_app/utils/app_assets.dart';
import 'package:news_app/utils/app_colors.dart';

class CategoryDM {
  String id;
  String title;
  String imagePath;
  Color backgroundColor;
  bool isLeft;

  CategoryDM(
      {required this.id,
      required this.title,
      required this.imagePath,
      required this.backgroundColor,
      required this.isLeft});

  static List<CategoryDM> categories = [
    CategoryDM(
        id: "sports", title: "Sports", imagePath: AppAssets.ballImage,
        backgroundColor: AppColors.red, isLeft: true),
    CategoryDM(
        id: "technology", title: "Technology", imagePath: AppAssets.politicsImage,
        backgroundColor: AppColors.blue, isLeft: false),
    CategoryDM(
        id: "health", title: "Health", imagePath: AppAssets.healthImage,
        backgroundColor: AppColors.purple, isLeft: true),
    CategoryDM(
        id: "business", title: "Business", imagePath: AppAssets.businessImage,
        backgroundColor: AppColors.brown, isLeft: false),
    CategoryDM(
        id: "environment", title: "Environment", imagePath: AppAssets.envImage,
        backgroundColor: AppColors.lightBlue, isLeft: true),
    CategoryDM(
        id: "science", title: "Science", imagePath: AppAssets.scienceImage,
        backgroundColor: AppColors.yellow, isLeft: false)
  ];
}

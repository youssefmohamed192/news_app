import 'package:flutter/material.dart';
import 'package:news_app/data/api/api_manager.dart';
import 'package:news_app/data/model/ArticleResponse.dart';
import 'package:news_app/widget/article_widget.dart';
import 'package:news_app/widget/error_view.dart';
import 'package:news_app/widget/loading_view.dart';

class NewsList extends StatelessWidget {
  final String sourceId;
  const NewsList({super.key, required this.sourceId});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: ApiManager.getArticles(sourceId),
        builder: (context, snapshot){
          if(snapshot.hasData){
            return buildArticlesView(snapshot.data!);
          }else if(snapshot.hasError){
            return ErrorView(message: snapshot.error.toString());
          } else{
            return const LoadingView();
          }
        });
  }

  Widget buildArticlesView(List<Article> data) {
    return ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index){
          return ArticleWidget(article: data[index]);
        });
  }
}

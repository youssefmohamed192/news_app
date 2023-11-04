import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/data/model/ArticleResponse.dart';
import 'package:news_app/widget/loading_view.dart';

class ArticleWidget extends StatelessWidget {
  final Article article;
  const ArticleWidget({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // use ClipRRect to image border radius.
          ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: CachedNetworkImage(imageUrl: article.urlToImage!,
                placeholder: (_,__){return const LoadingView();},
                errorWidget: (_,__,___){return const Icon(Icons.error);},
               ),
          ),
          const SizedBox(height: 10,),
          Text(article.source?.name ?? "", textAlign: TextAlign.start,style: Theme.of(context).textTheme.displaySmall),
          Text(article.title ?? "", textAlign: TextAlign.start,style: Theme.of(context).textTheme.displayLarge),
          Text(article.publishedAt ?? "", textAlign: TextAlign.end,style: Theme.of(context).textTheme.displayMedium)
        ],
      ),
    );
  }
}

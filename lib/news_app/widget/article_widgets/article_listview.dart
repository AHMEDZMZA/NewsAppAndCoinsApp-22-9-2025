import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer_animation/shimmer_animation.dart';
import '../../../manager_cubit/new_app_cubit/news_cubit.dart';
import 'article_item.dart';

class ArticleListview extends StatelessWidget {
  const ArticleListview({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsCubit, NewsState>(
      builder: (context, state) {
        if (state is NewsErrorState) {
          return SliverToBoxAdapter(child: Center(child: Text(state.message)));
        } else if (state is NewsSuccessState) {
          return SliverList.builder(
            itemCount: state.article.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 10,
                ),
                child: Shimmer(
                  duration: const Duration(seconds: 2),
                  color: Colors.grey.shade300,
                  colorOpacity: 0.3,
                  enabled: true,
                  child: ArticleItem(article: state.article[index]),
                ),
              );
            },
          );
        } else {
          return SliverToBoxAdapter(
            child: Center(child: CircularProgressIndicator()),
          );
        }
      },
    );
  }
}

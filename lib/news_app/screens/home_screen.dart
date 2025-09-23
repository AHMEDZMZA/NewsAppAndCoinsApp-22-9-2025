import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../manager_cubit/new_app_cubit/news_cubit.dart';
import '../consts_image.dart';
import '../../styles.dart';
import '../widget/article_widgets/article_listview.dart';
import '../widget/category_widgets/category_listview.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.teal,
            pinned: true,
            expandedHeight: 200.0,
            flexibleSpace: FlexibleSpaceBar(
              title: Text("News App", style: TextStyle(color: Colors.white)),
              background: Image.network(imageAppBar, fit: BoxFit.cover),
            ),
          ),
          SliverToBoxAdapter(child: SizedBox(height: 10)),
          SliverToBoxAdapter(child: CategoryListview()),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 25, vertical: 18),
              child: BlocBuilder<NewsCubit, NewsState>(
                builder: (context, state) {
                  return Text(
                    " ${context.read<NewsCubit>().currentCategory} News",
                    style: Styles.style30
                        .copyWith(color: Colors.black)
                        .copyWith(fontSize: 25),
                  );
                },
              ),
            ),
          ),
          ArticleListview(),
        ],
      ),
    );
  }
}

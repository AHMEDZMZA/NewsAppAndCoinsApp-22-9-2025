import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../manager_cubit/new_app_cubit/news_cubit.dart';
import '../../../styles.dart';
import '../../model/category.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({super.key, required this.category});

  final Category category;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
      child: InkWell(
        onTap: () {
          context.read<NewsCubit>().getArticle(value: category.name);
        },
        child: SizedBox(
          height: 180,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 60,
               // backgroundColor: Colors.red,
                child: ClipOval(
                  child: CachedNetworkImage(
                    imageUrl: category.image,
                    width: 120,
                    height: 120,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => CircularProgressIndicator(),
                    errorWidget: (context, url, error) => Icon(Icons.error, color: Colors.white),
                  ),
                ),
              ),

              SizedBox(height: 8),
              Text(category.name, style: Styles.style30),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

import '../../model/article.dart';

class ArticleItem extends StatefulWidget {
  const ArticleItem({super.key, required this.article});

  final Article article;

  @override
  State<ArticleItem> createState() => _ArticleItemState();
}

class _ArticleItemState extends State<ArticleItem> {
  bool isExpandedDescription = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            child:
                widget.article.urlToImage != null
                    ? Image.network(
                      widget.article.urlToImage!,
                      width: double.infinity,
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) {
                          return child;
                        }
                        return Shimmer(
                          duration: const Duration(seconds: 2),
                          color: Colors.grey.shade300,
                          colorOpacity: 0.3,
                          enabled: true,
                          child: Container(
                            width: double.infinity,
                            height: 200,
                            color: Colors.grey.shade300,
                          ),
                        );
                      },
                    )
                    : Container(
                      width: double.infinity,
                      height: 200,
                      color: Colors.grey[300],
                      child: const Icon(
                        Icons.image_not_supported,
                        size: 60,
                        color: Colors.black,
                      ),
                    ),
          ),
          SizedBox(height: 10),
          Text(
            widget.article.title ?? "No Title",
            style: TextStyle(color: Colors.black),
          ),
          SizedBox(height: 12),
          GestureDetector(
            onTap: () {
              setState(() {
                isExpandedDescription = !isExpandedDescription;
              });
            },
            child: Text(
              maxLines: isExpandedDescription ? null : 2,
              overflow:
                  isExpandedDescription
                      ? TextOverflow.visible
                      : TextOverflow.ellipsis,
              widget.article.description ?? "No Description",
              style: TextStyle(color: Colors.grey, fontSize: 15),
            ),
          ),
        ],
      ),
    );
  }
}

/*
import 'package:flutter/material.dart';
import 'package:shimmer_animation/shimmer_animation.dart';
import '../../model/article.dart';

class ArticleItem extends StatefulWidget {
  const ArticleItem({super.key, required this.article});

  final Article article;

  @override
  State<ArticleItem> createState() => _ArticleItemState();
}

class _ArticleItemState extends State<ArticleItem> {
  bool isExpandedDescription = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            child: widget.article.urlToImage != null
                ? Image.network(
              widget.article.urlToImage!,
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return Shimmer(
                  duration: const Duration(seconds: 2),
                  color: Colors.grey.shade300,
                  colorOpacity: 0.3,
                  enabled: true,
                  child: Container(
                    width: double.infinity,
                    height: 200,
                    color: Colors.grey.shade300,
                  ),
                );
              },
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  width: double.infinity,
                  height: 200,
                  color: Colors.grey[300],
                  child: const Icon(
                    Icons.broken_image,
                    size: 60,
                    color: Colors.black54,
                  ),
                );
              },
            )
                : Shimmer(
              duration: const Duration(seconds: 2),
              color: Colors.grey.shade300,
              colorOpacity: 0.3,
              enabled: true,
              child: Container(
                width: double.infinity,
                height: 200,
                color: Colors.grey.shade300,
              ),
            ),
          ),

          const SizedBox(height: 10),
          widget.article.title != null
              ? Text(
            widget.article.title!,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          )
              : Shimmer(
            duration: const Duration(seconds: 2),
            color: Colors.grey.shade300,
            colorOpacity: 0.3,
            enabled: true,
            child: Container(
              width: double.infinity,
              height: 20,
              margin: const EdgeInsets.symmetric(vertical: 4),
              color: Colors.grey.shade300,
            ),
          ),

          const SizedBox(height: 12),

          GestureDetector(
            onTap: () {
              setState(() {
                isExpandedDescription = !isExpandedDescription;
              });
            },
            child: widget.article.description != null
                ? Text(
              widget.article.description!,
              maxLines: isExpandedDescription ? null : 2,
              overflow: isExpandedDescription
                  ? TextOverflow.visible
                  : TextOverflow.ellipsis,
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 15,
              ),
            )
                : Shimmer(
              duration: const Duration(seconds: 2),
              color: Colors.grey.shade300,
              colorOpacity: 0.3,
              enabled: true,
              child: Container(
                width: double.infinity,
                height: 40,
                color: Colors.grey.shade300,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

 */

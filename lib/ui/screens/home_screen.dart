// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_elisoft/cubit/article_fetch_cubit.dart';
import 'package:flutter_elisoft/ui/widgets/shimmer_home_widget.dart';

import '../widgets/article_card.dart';
import '../widgets/article_tile.dart';
import '../widgets/header_home.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const routeName = '/home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ArticleFetchCubit, ArticleFetchState>(
        builder: (context, state) {
          if (state is ArticleFetchLoading) {
            return const ShimmerHomePage();
          } else if (state is ArticleFetchSuccess) {
            return SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const HeaderHome(),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 190,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: state.articleList.length,
                        itemBuilder: (context, index) => ArticleCard(
                          title: state.articleList[index].title,
                          index: index,
                          content: state.articleList[index].content,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: state.articleList.length,
                        itemBuilder: (context, index) => ArticleTile(
                          title: state.articleList[index].title,
                          content: state.articleList[index].content,
                          date: state.articleList[index].created.date,
                          image: state.articleList[index].image,
                          index: index,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}

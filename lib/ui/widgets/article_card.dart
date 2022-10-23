import 'package:flutter/material.dart';

import '../../theme.dart';

class ArticleCard extends StatelessWidget {
  final String title;
  final int index;
  final String content;
  const ArticleCard({
    Key? key,
    required this.title,
    required this.index,
    required this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 210,
      decoration: BoxDecoration(
        border: Border.all(color: styleColor(1)),
        borderRadius: BorderRadius.circular(
          10,
        ),
      ),
      margin: EdgeInsets.only(left: index == 0 ? 0 : 16),
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: contentTextStyle.copyWith(
              fontWeight: FontWeight.w700,
              color: styleColor(1),
            ),
            maxLines: 1,
          ),
          Expanded(
            child: Text(
              content,
              style: contentTextStyle,
              maxLines: 8,
            ),
          ),
        ],
      ),
    );
  }
}

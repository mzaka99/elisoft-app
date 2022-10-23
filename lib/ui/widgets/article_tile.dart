import 'package:flutter/material.dart';
import 'package:flutter_elisoft/theme.dart';
import 'package:intl/intl.dart';

import '../../constants/constants.dart';

class ArticleTile extends StatelessWidget {
  final String title;
  final int index;
  final String content;
  final String image;
  final String date;
  const ArticleTile({
    Key? key,
    required this.title,
    required this.index,
    required this.content,
    required this.image,
    required this.date,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: index == 0 ? 0 : 30),
      child: Container(
        height: 200,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: const Color.fromRGBO(36, 120, 129, 0.15),
          borderRadius: BorderRadius.circular(6),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: const Color.fromRGBO(152, 152, 152, 1),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(6),
                    child: Image.network(
                      image,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: SizedBox(
                    height: 40,
                    child: Text(
                      title,
                      style: contentTextStyle,
                      maxLines: 2,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: Text(
                content,
                style: contentTextStyle,
                maxLines: 3,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: double.infinity,
              height: 20,
              child: Text(
                DateFormat(
                  dateFormatArticle,
                ).format(
                  DateTime.parse(date),
                ),
                style: contentTextStyle,
                textAlign: TextAlign.right,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter_elisoft/models/created_model.dart';
import 'package:flutter_elisoft/models/user_model.dart';

class ArticleModel {
  final String uuid;
  final String title;
  final String content;
  final String image;
  final int views;
  final CreatedModel created;
  final UserModel user;
  ArticleModel({
    required this.uuid,
    required this.title,
    required this.content,
    required this.image,
    required this.views,
    required this.created,
    required this.user,
  });

  factory ArticleModel.fromMap(Map<String, dynamic> map) {
    return ArticleModel(
      uuid: map['uuid'],
      title: map['title'],
      content: map['content'],
      image: map['image'],
      views: map['views'],
      created: CreatedModel.fromMap(map['created'] as Map<String, dynamic>),
      user: UserModel.fromMap(map['user'] as Map<String, dynamic>),
    );
  }
}

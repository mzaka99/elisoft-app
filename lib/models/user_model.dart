import 'package:flutter_elisoft/models/created_model.dart';

class UserModel {
  final String name;
  final String email;
  final String phoneNumber;
  final CreatedModel created;
  final String uuid;
  UserModel({
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.created,
    required this.uuid,
  });

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'],
      email: map['email'],
      phoneNumber: map['phone_number'],
      created: CreatedModel.fromMap(map['created']),
      uuid: map['uuid'],
    );
  }
}

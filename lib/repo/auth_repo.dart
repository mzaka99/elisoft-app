import 'package:flutter_elisoft/models/failure_model.dart';
import 'package:flutter_elisoft/models/user_model.dart';
import 'package:flutter_elisoft/services/api_service.dart';

class AuthRepository {
  String path = 'auth/login';

  Future<UserModel?> login(
      {required String email, required String password}) async {
    final response = await ApiService()
        .postData(path: path, body: {'email': email, 'password': password});
    if (response['code'] == 200) {
      return UserModel.fromMap(response['user']);
    } else {
      throw const Failure(message: 'There was an error.');
    }
  }
}

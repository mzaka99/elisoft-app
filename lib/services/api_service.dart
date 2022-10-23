import 'dart:convert';
import 'dart:io';

import 'package:flutter_elisoft/models/failure_model.dart';
import 'package:http/http.dart' as http;

import '../constants/constants.dart';

class ApiService {
  dynamic postData({
    required String path,
    Map<String, dynamic>? body,
  }) async {
    final url = Uri.parse(baseUrl + path);
    try {
      final response = await http.post(url, headers: setHeaders, body: body);
      final responseData = jsonDecode(response.body);
      return responseData;
    } on SocketException {
      throw const Failure(message: 'No Connection');
    }
  }

  dynamic getData({
    required String path,
  }) async {
    final url = Uri.parse(baseUrl + path);
    try {
      final response = await http.get(
        url,
        headers: setHeaders,
      );
      final responseData = jsonDecode(response.body);
      return responseData;
    } on SocketException {
      throw const Failure(message: 'No Connection');
    }
  }
}

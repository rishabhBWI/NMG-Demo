import 'dart:convert';
import 'dart:ffi';

import 'package:dio/dio.dart';
import 'package:ngm/modals/authors.dart';
import 'package:ngm/modals/posts.dart';

class MyDio {
  final dio = Dio();
  Future<List<User>> getUsers() async {
    final response =
        await dio.get('https://jsonplaceholder.typicode.com/users');
    if (response.statusCode == 200) {
      List<dynamic> usersJson = response.data;
      print(usersJson);
      return usersJson.map((userJson) => User.fromJson(userJson)).toList();
    } else {
      throw Exception('Failed to load users');
    }
  }

  Future<List<Post>> getPosts() async {
    Response response;
    response = await dio.get('https://jsonplaceholder.typicode.com/posts');
    if (response.statusCode == 200) {
      List<dynamic> postJson = response.data;
      print(postJson);
      return postJson.map((upostJson) => Post.fromJson(upostJson)).toList();
    } else {
      throw Exception('Failed to load users');
    }
  }
}

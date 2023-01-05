import 'dart:convert';

import 'package:flutter_demo_project/model/response_model.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

abstract class PostClass {
  Future<List<PostModel>> getPostList();
}

class PostServices implements PostClass {
  //
  static const _baseUrl = 'jsonplaceholder.typicode.com';
  static const String _GET_POST = '/posts';

  @override
  Future<List<PostModel>> getPostList() async {
    Uri uri = Uri.https(_baseUrl, _GET_POST);
    Response response = await http.get(uri);

    List<PostModel> posts = postsFromJson(response.body);

    return posts;
  }

  List<PostModel> postsFromJson(String str) => List<PostModel>.from(
      json.decode(str).map((x) => PostModel.fromJson(x)));
}

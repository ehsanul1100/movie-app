import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:movenew/model/moveModel.dart';


class MovieApi {
  static Future<MoveList> getMovies() async {
    var url = Uri.parse('https://yts.mx/api/v2/list_movies.json');

    var response = await get(url);

    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body) as Map<String, dynamic>;

      // print();
      debugPrint('Data get success');
      return MoveList.fromJson(jsonResponse['data']['movies']);

      // print(jsonResponse);
    } else {
      print('Request failed with status: ${response.statusCode}.');
      return MoveList();
    }
  }
}

class MovieListPage {
  static Future<MoveList> getMovies(int movieId) async {
    var url = Uri.parse('https://yts.mx/api/v2/list_movies.json?page=$movieId');

    var response = await get(url);
    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body) as Map<String, dynamic>;

      // print();
      print('Data get success');
      return MoveList.fromJson(jsonResponse['data']['movies']);

      // print(jsonResponse);
    } else {
      print('Request failed with status: ${response.statusCode}.');
      return MoveList();
    }
  }
}
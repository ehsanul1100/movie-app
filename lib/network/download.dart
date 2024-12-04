import 'dart:convert';

import 'package:http/http.dart';
import 'package:movenew/model/moveModel.dart';

class MovieApi2 {
  static Future<MoveList> getMovies2() async {
    var url = Uri.parse('https://yts.mx/api/v2/list_movies.json');

    var response = await get(url);
    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body) as Map<String, dynamic>;
      print('data get success 2');
      return MoveList.fromJson(jsonResponse['data']['movies']);
    } else {
      print('data not get !!!');
      return MoveList();
    }
  }
}

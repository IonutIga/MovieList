import 'dart:convert';
import 'package:http/http.dart';
import 'package:meta/meta.dart';
import 'package:exemple/models/movie.dart';

class YtsApi {
  const YtsApi({@required Client client})
      : assert(client != null),
        _client = client;

  final Client _client;

  Future<List<Movie>> getMovies(int nextPage, String genre) async {
    String url = 'https://yts.mx/api/v2/list_movies.json?limit=3&page=$nextPage';
    if (genre != null) url = 'https://yts.mx/api/v2/list_movies.json?limit=3&page=$nextPage&genre=$genre';
    print(url);
    final Response response = await _client.get(url);
    final String body = response.body;
    final List<dynamic> list = jsonDecode(body)['data']['movies'];
    return list.map((dynamic json) => Movie.fromJson(json)).toList();
  }
}

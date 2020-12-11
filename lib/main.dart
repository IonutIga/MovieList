import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:http/http.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeApp(),
    );
  }
}

class HomeApp extends StatefulWidget {
  @override
  _HomeAppState createState() => _HomeAppState();
}

class _HomeAppState extends State<HomeApp> {
  Future<List<Movie>> movies;
  String _url = 'https://yts.mx/api/v2/list_movies.json';
  String _genreFilter = '';
  String _lastGenre = '';
  final ScrollController _scrollController = ScrollController();
  int i = 2;
  List<Movie> _listOfMovies = <Movie>[];
  bool _showMore = false;

  Future<List<Movie>> getResponse(String url) async {
    print('In getResponse: $url');
    final Response response = await get(url);
    final Map<String, dynamic> map = jsonDecode(response.body);
    final List<dynamic> movieList = map['data']['movies'];
    if (url.contains('genre')) {
      // ignore: always_put_control_body_on_new_line
      if (_lastGenre.compareTo(_genreFilter) != 0) _listOfMovies = <Movie>[];
      _lastGenre = url.substring(url.indexOf('genre') + 6, url.contains('&') ? url.indexOf('page') - 1 : url.length);
      print('lastGenre: $_lastGenre');
      print('genre: $_genreFilter');
    }
    for (int i = 0; i < movieList.length; i++) {
      final StringBuffer listGenre = StringBuffer();
      for (final String genre in movieList[i]['genres'])
        listGenre.write(movieList[i]['genres'].indexOf(genre) == 0 ? genre : ', $genre');
      _listOfMovies.add(
        Movie(
            title: movieList[i]['title'],
            imageSmall: movieList[i]['small_cover_image'],
            imageMedium: movieList[i]['medium_cover_image'],
            year: movieList[i]['year'],
            genres: listGenre,
            summary: movieList[i]['summary']),
      );
    }
    return _listOfMovies;
  }

  @override
  void initState() {
    super.initState();
    movies = getResponse(_url);
    _scrollController.addListener(() {
      setState(() {
        if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent)
          _url.contains('?') ? movies = getResponse('$_url&page=${i++}') : movies = getResponse('$_url?page=${i++}');
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movies'),
        // ignore: avoid_bool_literals_in_conditional_expressions
        centerTitle: Platform.isIOS ? true : false,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FlatButton(
              child: const Text(
                'FILTER',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                showDialog<AlertDialog>(
                  context: context,
                  child: AlertDialog(
                    title: const Text('Filter settings'),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        TextField(
                          decoration: const InputDecoration(
                            hintText: 'Action, Crime, Drama etc.',
                          ),
                          onChanged: (String value) {
                            setState(() {
                              _genreFilter = value;
                            });
                          },
                        ),
                      ],
                    ),
                    actions: <Widget>[
                      FlatButton(
                        child: const Text('Save'),
                        onPressed: () {
                          setState(() {
                            if (_genreFilter.isNotEmpty) {
                              _url = 'https://yts.mx/api/v2/list_movies.json?genre=$_genreFilter';
                              movies = getResponse(_url);
                              i = 2;
                            }
                            Navigator.of(context).pop();
                            print('In save: $_url');
                          });
                        },
                      ),
                      FlatButton(
                        child: const Text('Cancel'),
                        onPressed: () {
                          setState(() {
                            print('In cancel: $_url');
                            Navigator.of(context).pop();
                          });
                        },
                      ),
                    ],
                  ),
                );
              },
              color: Colors.blue,
            ),
          ),
        ],
      ),
      body: FutureBuilder<List<Movie>>(
        future: movies,
        builder: (BuildContext context, AsyncSnapshot<List<Movie>> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              controller: _scrollController,
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  onTap: () {
                    showDialog<AlertDialog>(
                      context: context,
                      barrierDismissible: false,
                      child: StatefulBuilder(
                        // ignore: always_specify_types
                        builder: (BuildContext context, setState) {
                          return AlertDialog(
                            scrollable: true,
                            elevation: 8,
                            title: Text(snapshot.data[index].title),
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Image.network(snapshot.data[index].imageMedium),
                                Align(
                                  alignment: AlignmentDirectional.centerStart,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: RichText(
                                      text: TextSpan(
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 18,
                                        ),
                                        children: <TextSpan>[
                                          const TextSpan(
                                            text: 'Year: ',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          TextSpan(text: snapshot.data[index].year.toString()),
                                          const TextSpan(
                                            text: '\nGenre(s): ',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          TextSpan(text: snapshot.data[index].genres.toString()),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        _showMore = true;
                                      });
                                    },
                                    child: Text(
                                      snapshot.data[index].summary,
                                      overflow: _showMore ? TextOverflow.visible : TextOverflow.ellipsis,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            actions: <Widget>[
                              FlatButton(
                                child: const Text('Cancel'),
                                onPressed: () {
                                  setState(() {
                                    _showMore = false;
                                    Navigator.of(context).pop();
                                  });
                                },
                              ),
                            ],
                          );
                        },
                      ),
                    );
                  },
                  title: Text(snapshot.data[index].title),
                  leading: Image.network(snapshot.data[index].imageSmall),
                  subtitle: Text(snapshot.data[index].year.toString() + '\n' + snapshot.data[index].genres.toString()),
                );
              },
            );
          } else if (snapshot.hasError) {
            print(snapshot.error.toString());
            return const Align(child: Text('No such genre! Please insert another!'));
          }
          return const Align(
            alignment: AlignmentDirectional.center,
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}

class Movie {
  Movie(
      {@required this.title,
      @required this.imageSmall,
      @required this.imageMedium,
      @required this.year,
      @required this.genres,
      @required this.summary});

  String title;
  String imageSmall;
  String imageMedium;
  int year;
  StringBuffer genres;
  String summary;
}

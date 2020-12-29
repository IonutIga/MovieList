import 'package:built_collection/built_collection.dart';
import 'package:exemple/actions/get_movies.dart';
import 'package:exemple/actions/update_genre.dart';
import 'package:exemple/containers/is_loading_container.dart';
import 'package:exemple/containers/movies_container.dart';
import 'package:exemple/containers/page_container.dart';
import 'package:exemple/containers/update_genre.dart';
import 'package:exemple/models/app_state.dart';
import 'package:exemple/models/movie.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageContainer(builder: (BuildContext context, int nextPage) {
      return IsLoadingContainer(
        builder: (BuildContext context, bool isLoading) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Movie Finder'),
            ),
            body: Builder(
              builder: (BuildContext context) {
                if (isLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                return MoviesContainer(
                  builder: (BuildContext context, BuiltList<Movie> movies) {
                    return Column(
                      children: <Widget>[
                        UpdateGenreContainer(
                          builder: (BuildContext context, String genre) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextField(
                                decoration:  InputDecoration(
                                  hintText: (genre != null) ? genre : 'Insert genre here...',
                                ),
                                onSubmitted: (String value) {
                                  StoreProvider.of<AppState>(context)
                                    ..dispatch(UpdateGenreStart(value))
                                    ..dispatch(const GetMovies());
                                },
                              ),
                            );
                          },
                        ),
                        Expanded(
                          child: GridView.builder(
                            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                              mainAxisSpacing: 4.0,
                              crossAxisSpacing: 4.0,
                              crossAxisCount: 3,
                            ),
                            itemCount: movies.length,
                            itemBuilder: (BuildContext context, int index) {
                              final Movie movie = movies[index];

                              return GridTile(
                                child: Image.network(movie.mediumCoverImage),
                                footer: GridTileBar(
                                  title: Text(movie.title),
                                  subtitle: Text(movie.genres.join(', ')),
                                ),
                              );
                            },
                          ),
                        ),
                        FlatButton(
                          child: const Text('Load more'),
                          color: Colors.blue,
                          onPressed: () {
                            StoreProvider.of<AppState>(context).dispatch(const GetMovies());
                          },
                        )
                      ],
                    );
                  },
                );
              },
            ),
          );
        },
      );
    });
  }
}

import 'package:exemple/actions/get_movies.dart';
import 'package:exemple/actions/update_genre.dart';
import 'package:exemple/models/app_state.dart';

AppState reducer(AppState state, dynamic action) {
  final AppStateBuilder builder = state.toBuilder();

  if (action is GetMoviesStart) {
    builder.isLoading = true;
  } else if (action is GetMoviesSuccessful) {
    builder.movies.addAll(action.movies);
    builder.isLoading = false;
    builder.nextPage++;
  } else if (action is GetMoviesError) {
    builder.isLoading = false;
  } else if (action is UpdateGenreStart) {
    builder
      ..movies.clear()
      ..nextPage = 1
      ..genre = action.genre;
  }
  return builder.build();
}

import 'package:exemple/actions/index.dart';
import 'package:exemple/models/index.dart';

import 'package:redux/redux.dart';

Reducer<AppState> reducer = combineReducers<AppState>(<Reducer<AppState>>[
  TypedReducer<AppState, GetMoviesStart>(_getMoviesStart),
  TypedReducer<AppState, GetMoviesSuccessful>(_getMoviesSuccessful),
  TypedReducer<AppState, GetMoviesError>(_getMoviesError),
  TypedReducer<AppState, UpdateGenreStart>(_updateGenreStart),
]);

AppState _getMoviesStart(AppState state, GetMoviesStart action) {
  return state.rebuild((AppStateBuilder b) => b.isLoading = true);
}

AppState _getMoviesSuccessful(AppState state, GetMoviesSuccessful action) {
  return state.rebuild(
    (AppStateBuilder b) => b
      ..movies.addAll(action.movies)
      ..isLoading = false
      ..nextPage = state.nextPage + 1,
  );
}

AppState _getMoviesError(AppState state, GetMoviesError action) {
  return state.rebuild((AppStateBuilder b) => b..isLoading = false);
}

AppState _updateGenreStart(AppState state, UpdateGenreStart action) {
  return state.rebuild(
    (AppStateBuilder b) => b
      ..movies.clear()
      ..genre = state.genre
      ..nextPage = 1,
  );
}

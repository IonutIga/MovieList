import 'package:exemple/actions/index.dart';
import 'package:exemple/data/YtsApi.dart';
import 'package:exemple/models/index.dart';
import 'package:meta/meta.dart';
import 'package:redux/redux.dart';

class AppMiddleware {
  const AppMiddleware({@required YtsApi ytsApi})
      : assert(ytsApi != null),
        _ytsApi = ytsApi;

  final YtsApi _ytsApi;

  List<Middleware<AppState>> get middleware {
    return <Middleware<AppState>>[TypedMiddleware<AppState, GetMoviesStart>(_getMovies)];
  }

  Future<void> _getMovies(Store<AppState> store, GetMoviesStart action, NextDispatcher next) async {
    next(action);
    try {
      final List<Movie> movies = await _ytsApi.getMovies(store.state.nextPage, store.state.genre);

      final GetMoviesSuccessful successful = GetMoviesSuccessful(movies);
      store.dispatch(successful);
    } catch (e) {
      final GetMoviesError error = GetMoviesError(e);
      store.dispatch(error);
    }
  }
}

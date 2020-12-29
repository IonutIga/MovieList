import 'package:exemple/actions/index.dart';
import 'package:exemple/data/YtsApi.dart';
import 'package:exemple/models/index.dart';
import 'package:meta/meta.dart';
import 'package:redux_epics/redux_epics.dart';
import 'package:rxdart/rxdart.dart';

class AppEpics {
  const AppEpics({@required YtsApi ytsApi})
      : assert(ytsApi != null),
        _ytsApi = ytsApi;

  final YtsApi _ytsApi;

  Epic<AppState> get epic {
    return combineEpics(<Epic<AppState>>[TypedEpic<AppState, GetMoviesStart>(_getMoviesStart)]);
  }

  Stream<dynamic> _getMoviesStart(Stream<GetMoviesStart> actions, EpicStore<AppState> store) {
    return actions
        .asyncMap((GetMoviesStart event) => _ytsApi.getMovies(store.state.nextPage, store.state.genre))
        .map<GetMoviesSuccessful>((List<Movie> event) => GetMoviesSuccessful(event))
        .onErrorReturnWith((dynamic error) => GetMovies.error(error));
  }
}

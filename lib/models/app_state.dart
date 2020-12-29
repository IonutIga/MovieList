part of models;

abstract class AppState implements Built<AppState, AppStateBuilder> {
  factory AppState([void Function(AppStateBuilder) updates]) = _$AppState;

  AppState._();

  factory AppState.initialState() {
    final AppStateBuilder builder = AppStateBuilder();
    builder
      ..isLoading = true
      ..nextPage = 1;
    return builder.build();
  }

  BuiltList<Movie> get movies;

  bool get isLoading;

  int get nextPage;

  @nullable
  String get genre;
}

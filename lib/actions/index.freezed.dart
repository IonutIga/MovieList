// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of actions;

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$GetMoviesTearOff {
  const _$GetMoviesTearOff();

// ignore: unused_element
  GetMoviesStart call() {
    return const GetMoviesStart();
  }

// ignore: unused_element
  GetMoviesSuccessful successful(List<Movie> movies) {
    return GetMoviesSuccessful(
      movies,
    );
  }

// ignore: unused_element
  GetMoviesError error(dynamic error) {
    return GetMoviesError(
      error,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $GetMovies = _$GetMoviesTearOff();

/// @nodoc
mixin _$GetMovies {
  @optionalTypeArgs
  Result when<Result extends Object>(
    Result $default(), {
    @required Result successful(List<Movie> movies),
    @required Result error(dynamic error),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>(
    Result $default(), {
    Result successful(List<Movie> movies),
    Result error(dynamic error),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>(
    Result $default(GetMoviesStart value), {
    @required Result successful(GetMoviesSuccessful value),
    @required Result error(GetMoviesError value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>(
    Result $default(GetMoviesStart value), {
    Result successful(GetMoviesSuccessful value),
    Result error(GetMoviesError value),
    @required Result orElse(),
  });
}

/// @nodoc
abstract class $GetMoviesCopyWith<$Res> {
  factory $GetMoviesCopyWith(GetMovies value, $Res Function(GetMovies) then) =
      _$GetMoviesCopyWithImpl<$Res>;
}

/// @nodoc
class _$GetMoviesCopyWithImpl<$Res> implements $GetMoviesCopyWith<$Res> {
  _$GetMoviesCopyWithImpl(this._value, this._then);

  final GetMovies _value;
  // ignore: unused_field
  final $Res Function(GetMovies) _then;
}

/// @nodoc
abstract class $GetMoviesStartCopyWith<$Res> {
  factory $GetMoviesStartCopyWith(
          GetMoviesStart value, $Res Function(GetMoviesStart) then) =
      _$GetMoviesStartCopyWithImpl<$Res>;
}

/// @nodoc
class _$GetMoviesStartCopyWithImpl<$Res> extends _$GetMoviesCopyWithImpl<$Res>
    implements $GetMoviesStartCopyWith<$Res> {
  _$GetMoviesStartCopyWithImpl(
      GetMoviesStart _value, $Res Function(GetMoviesStart) _then)
      : super(_value, (v) => _then(v as GetMoviesStart));

  @override
  GetMoviesStart get _value => super._value as GetMoviesStart;
}

/// @nodoc
class _$GetMoviesStart implements GetMoviesStart {
  const _$GetMoviesStart();

  @override
  String toString() {
    return 'GetMovies()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is GetMoviesStart);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>(
    Result $default(), {
    @required Result successful(List<Movie> movies),
    @required Result error(dynamic error),
  }) {
    assert($default != null);
    assert(successful != null);
    assert(error != null);
    return $default();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>(
    Result $default(), {
    Result successful(List<Movie> movies),
    Result error(dynamic error),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if ($default != null) {
      return $default();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>(
    Result $default(GetMoviesStart value), {
    @required Result successful(GetMoviesSuccessful value),
    @required Result error(GetMoviesError value),
  }) {
    assert($default != null);
    assert(successful != null);
    assert(error != null);
    return $default(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>(
    Result $default(GetMoviesStart value), {
    Result successful(GetMoviesSuccessful value),
    Result error(GetMoviesError value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }
}

abstract class GetMoviesStart implements GetMovies {
  const factory GetMoviesStart() = _$GetMoviesStart;
}

/// @nodoc
abstract class $GetMoviesSuccessfulCopyWith<$Res> {
  factory $GetMoviesSuccessfulCopyWith(
          GetMoviesSuccessful value, $Res Function(GetMoviesSuccessful) then) =
      _$GetMoviesSuccessfulCopyWithImpl<$Res>;
  $Res call({List<Movie> movies});
}

/// @nodoc
class _$GetMoviesSuccessfulCopyWithImpl<$Res>
    extends _$GetMoviesCopyWithImpl<$Res>
    implements $GetMoviesSuccessfulCopyWith<$Res> {
  _$GetMoviesSuccessfulCopyWithImpl(
      GetMoviesSuccessful _value, $Res Function(GetMoviesSuccessful) _then)
      : super(_value, (v) => _then(v as GetMoviesSuccessful));

  @override
  GetMoviesSuccessful get _value => super._value as GetMoviesSuccessful;

  @override
  $Res call({
    Object movies = freezed,
  }) {
    return _then(GetMoviesSuccessful(
      movies == freezed ? _value.movies : movies as List<Movie>,
    ));
  }
}

/// @nodoc
class _$GetMoviesSuccessful implements GetMoviesSuccessful {
  const _$GetMoviesSuccessful(this.movies) : assert(movies != null);

  @override
  final List<Movie> movies;

  @override
  String toString() {
    return 'GetMovies.successful(movies: $movies)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is GetMoviesSuccessful &&
            (identical(other.movies, movies) ||
                const DeepCollectionEquality().equals(other.movies, movies)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(movies);

  @override
  $GetMoviesSuccessfulCopyWith<GetMoviesSuccessful> get copyWith =>
      _$GetMoviesSuccessfulCopyWithImpl<GetMoviesSuccessful>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>(
    Result $default(), {
    @required Result successful(List<Movie> movies),
    @required Result error(dynamic error),
  }) {
    assert($default != null);
    assert(successful != null);
    assert(error != null);
    return successful(movies);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>(
    Result $default(), {
    Result successful(List<Movie> movies),
    Result error(dynamic error),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (successful != null) {
      return successful(movies);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>(
    Result $default(GetMoviesStart value), {
    @required Result successful(GetMoviesSuccessful value),
    @required Result error(GetMoviesError value),
  }) {
    assert($default != null);
    assert(successful != null);
    assert(error != null);
    return successful(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>(
    Result $default(GetMoviesStart value), {
    Result successful(GetMoviesSuccessful value),
    Result error(GetMoviesError value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (successful != null) {
      return successful(this);
    }
    return orElse();
  }
}

abstract class GetMoviesSuccessful implements GetMovies {
  const factory GetMoviesSuccessful(List<Movie> movies) = _$GetMoviesSuccessful;

  List<Movie> get movies;
  $GetMoviesSuccessfulCopyWith<GetMoviesSuccessful> get copyWith;
}

/// @nodoc
abstract class $GetMoviesErrorCopyWith<$Res> {
  factory $GetMoviesErrorCopyWith(
          GetMoviesError value, $Res Function(GetMoviesError) then) =
      _$GetMoviesErrorCopyWithImpl<$Res>;
  $Res call({dynamic error});
}

/// @nodoc
class _$GetMoviesErrorCopyWithImpl<$Res> extends _$GetMoviesCopyWithImpl<$Res>
    implements $GetMoviesErrorCopyWith<$Res> {
  _$GetMoviesErrorCopyWithImpl(
      GetMoviesError _value, $Res Function(GetMoviesError) _then)
      : super(_value, (v) => _then(v as GetMoviesError));

  @override
  GetMoviesError get _value => super._value as GetMoviesError;

  @override
  $Res call({
    Object error = freezed,
  }) {
    return _then(GetMoviesError(
      error == freezed ? _value.error : error as dynamic,
    ));
  }
}

/// @nodoc
class _$GetMoviesError implements GetMoviesError {
  const _$GetMoviesError(this.error) : assert(error != null);

  @override
  final dynamic error;

  @override
  String toString() {
    return 'GetMovies.error(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is GetMoviesError &&
            (identical(other.error, error) ||
                const DeepCollectionEquality().equals(other.error, error)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(error);

  @override
  $GetMoviesErrorCopyWith<GetMoviesError> get copyWith =>
      _$GetMoviesErrorCopyWithImpl<GetMoviesError>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>(
    Result $default(), {
    @required Result successful(List<Movie> movies),
    @required Result error(dynamic error),
  }) {
    assert($default != null);
    assert(successful != null);
    assert(error != null);
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>(
    Result $default(), {
    Result successful(List<Movie> movies),
    Result error(dynamic error),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (error != null) {
      return error(this.error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>(
    Result $default(GetMoviesStart value), {
    @required Result successful(GetMoviesSuccessful value),
    @required Result error(GetMoviesError value),
  }) {
    assert($default != null);
    assert(successful != null);
    assert(error != null);
    return error(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>(
    Result $default(GetMoviesStart value), {
    Result successful(GetMoviesSuccessful value),
    Result error(GetMoviesError value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class GetMoviesError implements GetMovies {
  const factory GetMoviesError(dynamic error) = _$GetMoviesError;

  dynamic get error;
  $GetMoviesErrorCopyWith<GetMoviesError> get copyWith;
}

/// @nodoc
class _$UpdateGenreTearOff {
  const _$UpdateGenreTearOff();

// ignore: unused_element
  UpdateGenreStart call(String genre) {
    return UpdateGenreStart(
      genre,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $UpdateGenre = _$UpdateGenreTearOff();

/// @nodoc
mixin _$UpdateGenre {
  String get genre;

  $UpdateGenreCopyWith<UpdateGenre> get copyWith;
}

/// @nodoc
abstract class $UpdateGenreCopyWith<$Res> {
  factory $UpdateGenreCopyWith(
          UpdateGenre value, $Res Function(UpdateGenre) then) =
      _$UpdateGenreCopyWithImpl<$Res>;
  $Res call({String genre});
}

/// @nodoc
class _$UpdateGenreCopyWithImpl<$Res> implements $UpdateGenreCopyWith<$Res> {
  _$UpdateGenreCopyWithImpl(this._value, this._then);

  final UpdateGenre _value;
  // ignore: unused_field
  final $Res Function(UpdateGenre) _then;

  @override
  $Res call({
    Object genre = freezed,
  }) {
    return _then(_value.copyWith(
      genre: genre == freezed ? _value.genre : genre as String,
    ));
  }
}

/// @nodoc
abstract class $UpdateGenreStartCopyWith<$Res>
    implements $UpdateGenreCopyWith<$Res> {
  factory $UpdateGenreStartCopyWith(
          UpdateGenreStart value, $Res Function(UpdateGenreStart) then) =
      _$UpdateGenreStartCopyWithImpl<$Res>;
  @override
  $Res call({String genre});
}

/// @nodoc
class _$UpdateGenreStartCopyWithImpl<$Res>
    extends _$UpdateGenreCopyWithImpl<$Res>
    implements $UpdateGenreStartCopyWith<$Res> {
  _$UpdateGenreStartCopyWithImpl(
      UpdateGenreStart _value, $Res Function(UpdateGenreStart) _then)
      : super(_value, (v) => _then(v as UpdateGenreStart));

  @override
  UpdateGenreStart get _value => super._value as UpdateGenreStart;

  @override
  $Res call({
    Object genre = freezed,
  }) {
    return _then(UpdateGenreStart(
      genre == freezed ? _value.genre : genre as String,
    ));
  }
}

/// @nodoc
class _$UpdateGenreStart implements UpdateGenreStart {
  const _$UpdateGenreStart(this.genre) : assert(genre != null);

  @override
  final String genre;

  @override
  String toString() {
    return 'UpdateGenre(genre: $genre)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is UpdateGenreStart &&
            (identical(other.genre, genre) ||
                const DeepCollectionEquality().equals(other.genre, genre)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(genre);

  @override
  $UpdateGenreStartCopyWith<UpdateGenreStart> get copyWith =>
      _$UpdateGenreStartCopyWithImpl<UpdateGenreStart>(this, _$identity);
}

abstract class UpdateGenreStart implements UpdateGenre {
  const factory UpdateGenreStart(String genre) = _$UpdateGenreStart;

  @override
  String get genre;
  @override
  $UpdateGenreStartCopyWith<UpdateGenreStart> get copyWith;
}

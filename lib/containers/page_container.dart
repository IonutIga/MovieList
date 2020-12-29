

import 'package:built_collection/built_collection.dart';
import 'package:exemple/models/app_state.dart';
import 'package:exemple/models/movie.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:meta/meta.dart';
import 'package:redux/redux.dart';

class PageContainer extends StatelessWidget {
  const PageContainer({Key key, @required this.builder}) : super(key: key);

  final ViewModelBuilder<int> builder;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState,int>(
      converter: (Store<AppState> store) {
        return store.state.nextPage;
      },
      builder: builder,
    );
  }
}

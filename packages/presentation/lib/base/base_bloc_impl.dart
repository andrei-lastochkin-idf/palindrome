import 'dart:async';
import 'package:flutter/widgets.dart';
import 'base_bloc.dart';
import 'bloc_data.dart';

class BaseBlocImpl<D> implements BaseBloc<D> {
  final _blocData = BlocData.init();

  final _data = StreamController<BlocData<D?>>();

  @override
  Stream<BlocData<D?>> get dataStream => _data.stream;

  @override
  void dispose() {
    _data.close();
  }

  @protected
  void handleData({
    bool? isLoading,
    bool? isValid,
    D? data,
  }) {
    if (!_data.isClosed) {
      _blocData.updateParams(
        isLoading: isLoading,
        data: data,
      );
      _data.add(_blocData.copy<D>());
    }
  }

  @override
  void initState() {}
}

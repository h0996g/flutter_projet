import 'package:flutter_bloc/flutter_bloc.dart';

import 'CubitOfferDetailState.dart';

class CubitDetail extends Cubit<DetailStates> {
  CubitDetail() : super(InitialDetailState());
  static CubitDetail get(context) => BlocProvider.of(context);

  int a = 0;

  void declarA(int index) {
    a = index;
    emit(DeclarIndexState());
  }
}

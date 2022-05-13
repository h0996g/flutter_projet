import 'package:flutter_bloc/flutter_bloc.dart';

import 'CubitOfferDetailState.dart';

class CubitDetail extends Cubit<DetailStates> {
  CubitDetail() : super(InitialDetailState());
  static CubitDetail get(context) => BlocProvider.of(context);

  int indexAgence = 0;
  int indexClient = 0;

  void changeNavDetailAgence(int index) {
    indexAgence = index;
    emit(DeclarIndexState());
  }

  void changeNavDetailClient(int index) {
    indexClient = index;
    emit(DeclarIndexState());
  }
}

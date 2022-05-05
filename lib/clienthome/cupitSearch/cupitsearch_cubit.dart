import 'package:agence/clienthome/cupitSearch/cupitsearch_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CupitsearchCubit extends Cubit<CupitsearchStates> {
  CupitsearchCubit() : super(CupitsearchInitial());
  static CupitsearchCubit get(context) => BlocProvider.of(context);
}

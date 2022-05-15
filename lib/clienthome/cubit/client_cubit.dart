import 'package:flutter_bloc/flutter_bloc.dart';

import 'client_state.dart';

class ClientCubit extends Cubit<ClientState> {
  ClientCubit() : super(InitialClientState());
  static ClientCubit get(context) => BlocProvider.of(context);
}

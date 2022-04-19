import 'package:agence/Model/RegisterAgenceModel.dart';
import 'package:agence/modeles.dart';

abstract class LoginStates {}

class InitialState extends LoginStates {}

class ConditionalLodinState extends LoginStates {}

class GoodLoginState extends LoginStates {
  final LoginModel mod;

  GoodLoginState(this.mod);
}

class BadLoginState extends LoginStates {
  final error;

  BadLoginState(this.error);
}

class HiddenPasswordState extends LoginStates {}

class PutcacheonbordingStates extends LoginStates {}

class SharedSkipState extends LoginStates {}

class RegisterAgenceSuccesState extends LoginStates {
  final RegisterAgenceModel? model;

  RegisterAgenceSuccesState(this.model);
}

class RegisterAgenceBadState extends LoginStates {}

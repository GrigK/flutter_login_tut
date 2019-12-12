import 'dart:async';
import 'package:bloc/bloc.dart';
import './bloc.dart';

class LoginFormBloc extends Bloc<LoginFormEvent, LoginFormState> {
  @override
  LoginFormState get initialState => InitialLoginFormState();

  @override
  Stream<LoginFormState> mapEventToState(
    LoginFormEvent event,
  ) async* {
    // TODO: Add Logic
  }
}

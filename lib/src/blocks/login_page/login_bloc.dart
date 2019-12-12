import 'dart:async';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_login_tut/src/resources/user_repository.dart';
import './bloc.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final UserRepository userRepository;

  LoginBloc({@required this.userRepository}) : assert(userRepository != null);

  @override
  LoginState get initialState => LoginUninitializedState();

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    if (event is AppStartedEvent) {
      final bool hasToken = await userRepository.hasToken();

      if (hasToken) {
        yield LoginAuthenticatedState();
      } else {
        yield LoginUnauthenticatedState();
      }
    }

    if (event is LoggedInEvent) {
      yield LoginLoadingState();
      await userRepository.persistToken(event.token);
    }

    if (event is LoggedOutEvent) {
      yield LoginLoadingState();
      await userRepository.deleteToken();
      yield LoginUnauthenticatedState();
    }
  }
}

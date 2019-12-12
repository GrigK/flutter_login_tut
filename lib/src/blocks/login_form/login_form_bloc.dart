import 'dart:async';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import './bloc.dart';

import 'package:flutter_login_tut/src/resources/user_repository.dart';
import 'package:flutter_login_tut/src/blocks/login_page/bloc.dart';


/// LoginFormBloc зависит от user_repository чтоб авторизовать пользователя
/// так же передает событие LoggedInEvent в LoginBloc в случае успешной авторизации
class LoginFormBloc extends Bloc<LoginFormEvent, LoginFormState> {
  final UserRepository userRepository;
  final LoginBloc loginBloc;

  LoginFormBloc({@required this.userRepository, @required this.loginBloc})
      : assert(userRepository != null),
        assert(loginBloc != null);

  @override
  LoginFormState get initialState => LoginFormInitialState();

  @override
  Stream<LoginFormState> mapEventToState(LoginFormEvent event,) async* {
    if (event is LoginButtonPressedEvent) {
      yield LoginFormLoadingState();

      try {
        final String token = await userRepository.authenticate(
            username: event.username, password: event.password);
        // передадим в LoginBloc событие об успешной авторизации и
        // токен авторизованного пользователя
        loginBloc.add(LoggedInEvent(token: token));
      } catch (error) {
        yield LoginFormFailureState(error: error.toString());
      }
    }
    return;
  }
}

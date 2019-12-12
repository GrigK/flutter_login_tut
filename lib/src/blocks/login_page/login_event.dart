import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';


/// основные события:
///
/// AppStarted - проверить, аутентифицирован ли пользователь в настоящее время или нет
/// LoggedIn - пользователь успешно вошел в систему
/// LoggedOut - пользователь успешно вышел из системы
abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class AppStartedEvent extends LoginEvent{}

class LoggedInEvent extends LoginEvent{
  final String token;

  const LoggedInEvent({@required this.token});

  @override
  List<Object> get props => [token];

  @override
  String toString() => "LoggedIn { token: $token }";
}

class LoggedOutEvent extends LoginEvent{}

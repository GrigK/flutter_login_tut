import 'package:equatable/equatable.dart';

/// Состояния пользователя:
/// uninitialized - waiting to see if the user is authenticated or not on app start.
/// loading - ожидание проверки подлинности пользователя при запуске приложения.
/// authenticated - успешно авторизован
/// unauthenticated - не авторизован
///
/// Наример:
///
/// если uninitialized то видит заставку
/// если loading то видит индикатор загрузки
/// если authenticated то переходт на домашнюю страницу
/// если unauthenticated то видит форму входа
///
/// extends Equatable позволяет сравнивать два объекта
abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginUninitializedState extends LoginState {}

class LoginLoadingState extends LoginState {}

class LoginAuthenticatedState extends LoginState {}

class LoginUnauthenticatedState extends LoginState {}


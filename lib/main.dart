import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_login_tut/src/pages/loading_page.dart';

import './generated/i18n.dart';
import './src/blocks/simple_bloc_delegate.dart';
import './src/blocks/theme_block.dart';

import './src/pages/home_page.dart';
import './src/pages/splash_page.dart';
import './src/pages/login_page.dart';
import './src/pages/widgets/loaging_indicator.dart';

import 'package:flutter_login_tut/src/resources/user_repository.dart';
import 'package:flutter_login_tut/src/blocks/login_page/bloc.dart';


void main() {
  BlocSupervisor.delegate = SimpleBlocDelegate();
  final userRepository = UserRepository();

  return runApp(
    BlocProvider(
        create: (context){
          return LoginBloc(userRepository: userRepository)
          ..add(AppStartedEvent());
        },
        child: MyApp(userRepository: userRepository,) ,
    ),
  );
}

class MyApp extends StatelessWidget {
  final UserRepository userRepository;

  const MyApp({Key key, this.userRepository}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ThemeBloc>(
      create: (context) => ThemeBloc(),
      child: BlocBuilder<ThemeBloc, ThemeData>(
        builder: (context, theme) {
          /// ThemeBloc - это глобальный BLoC
          /// доступный из любого места MaterialApp через
          /// BlocProvider.of<ThemeBloc>(context)
          return MaterialApp(
            localizationsDelegates: [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              DefaultCupertinoLocalizations.delegate,
            ],
            supportedLocales: S.delegate.supportedLocales,
//            localeResolutionCallback: S.delegate.resolution(fallback: new Locale("en", "")),

            onGenerateTitle: (context) => S.of(context).appName,
            home: _routePages(context),
            theme: theme,
          );
        },
      ),
    );
  }

  Widget _routePages(BuildContext context){
    return BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {
          if (state is LoginUninitializedState) {
            return SplashPage();
          }
          if (state is LoginAuthenticatedState) {
            return HomePage();
          }
          if (state is LoginUnauthenticatedState) {
            return LoginPage(userRepository: userRepository);
          }
          if (state is LoginLoadingState) {
            return LoadingPage();
          }
          return Container();
        },
      );
  }
}

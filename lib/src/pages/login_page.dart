import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_login_tut/generated/i18n.dart';
import 'package:flutter_login_tut/src/resources/user_repository.dart';
import 'package:flutter_login_tut/src/blocks/login_page/bloc.dart';
import 'package:flutter_login_tut/src/blocks/login_form/bloc.dart';
import 'package:flutter_login_tut/src/pages/widgets/login_form.dart';

class LoginPage extends StatelessWidget {
  final UserRepository userRepository;

  const LoginPage({Key key, this.userRepository})
      : assert(userRepository != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(S.of(context).loginTitle),
        ),
        // используем BlocProvider для создания,
        // закрытия и предоставления LoginFormBloc для поддерева
        body: BlocProvider<LoginFormBloc>(
          create: (context) {
            // используем UserRepository для создания LoginFormBloc
            return LoginFormBloc(
                userRepository: userRepository,
                // в LoginFormBloc нужен доступ к LoginBloc
                loginBloc: BlocProvider.of<LoginBloc>(context));
          },
          child: LoginForm(),
        ));
  }
}

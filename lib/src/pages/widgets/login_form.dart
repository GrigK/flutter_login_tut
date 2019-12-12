import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_login_tut/generated/i18n.dart';
import 'package:flutter_login_tut/src/blocks/login_form/bloc.dart';
import 'loaging_indicator.dart';

class LoginForm extends StatefulWidget {
  LoginForm({Key key}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginFormBloc, LoginFormState>(
      listener: (context, state) {
        if (state is LoginFormFailureState) {
          Scaffold.of(context).showSnackBar(SnackBar(
            content: Text('${state.error}'),
            backgroundColor: Colors.red,
          ));
        }
      },
      child: _loginFormBuilder(context: context),
    );
  }

  _onLoginBtnPressed(BuildContext context) {
    BlocProvider.of<LoginFormBloc>(context).add(LoginButtonPressedEvent(
        username: _usernameController.text,
        password: _passwordController.text));
  }

  Widget _loginFormBuilder({BuildContext context}) {
    return BlocBuilder<LoginFormBloc, LoginFormState>(
      builder: (context, state) {
        return Container(
          padding: EdgeInsets.all(20),
          child: Form(
              child: Column(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(labelText: S.of(context).labelLogin),
                controller: _usernameController,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: S.of(context).labelPass),
                controller: _passwordController,
                obscureText: true,
              ),
              SizedBox(height: 24.0,),
              RaisedButton(
                onPressed: state is! LoginFormLoadingState
                    ? () {
                        _onLoginBtnPressed(context);
                      }
                    : null,
                child: Text(S.of(context).btnLogin),
              ),
              SizedBox(height: 24.0,),
              Container(
                child: state is LoginFormLoadingState
                    ? LoadingIndicator()
                    : null,
              ),
            ],
          )),
        );
      },
    );
  }

}

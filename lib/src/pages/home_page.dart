import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_login_tut/src/blocks/login_page/bloc.dart';
import '../../generated/i18n.dart';
import '../blocks/home_page/bloc.dart';
import '../blocks/theme_block.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomePageBloc _homeBloc;

  @override
  void initState() {
    super.initState();
    _homeBloc = BlocProvider.of<HomePageBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      body: BlocBuilder<HomePageBloc, HomePageState>(builder: _body),
    );
  }

  AppBar _appBar(BuildContext context) {
    return AppBar(
      title: Text(S.of(context).titleHomePage),
      actions: <Widget>[
        IconButton(
            icon: Icon(Icons.brightness_medium),
            onPressed: () {
              // Используем глобальный BLoC (смена темы)
              BlocProvider.of<ThemeBloc>(context).add(ThemeEvent.toggle);
            }),
        SizedBox(
          width: 16.0,
        )
      ],
    );
  }

  Widget _body(BuildContext context, HomePageState state) {
    // обработчики состояний:
//    if (state is InitialHomePageState) {
      return Container(
          child: Center(
        child:
            RaisedButton(
                child: Text(S.of(context).btnLogout),
                onPressed: (){
                  BlocProvider.of<LoginBloc>(context).add(LoggedOutEvent());
                }),
      ));
//    }

//    return Center(
//      child: Text('Not state BLoC'),
//    );
  }
}

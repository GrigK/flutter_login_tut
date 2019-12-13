import 'package:flutter/material.dart';
import 'package:flutter_login_tut/src/pages/splash_page.dart';
import 'package:flutter_login_tut/src/pages/widgets/loaging_indicator.dart';

class LoadingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: <Widget>[
          SplashPage(),
          Center(
            child: LoadingIndicator(),
          ),
        ],
      ),
    );
  }
}
